<?php
namespace App\Services;
use App\Models\PathaoToken;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
class PathaoService
{
    private string $baseUrl;
    private string $clientId;
    private string $clientSecret;
    private string $username;
    private string $password;
    public function __construct()
    {
        $isSandbox = config('services.pathao.sandbox', true);
        if ($isSandbox) {
            $this->baseUrl      = "https://courier-api-sandbox.pathao.com/aladdin/api/v1";
            $this->clientId     = "7N1aMJQbWm";
            $this->clientSecret = "wRcaibZkUdSNz2EI9ZyuXLlNrnAv0TdPUPXMnD39";
            $this->username     = "test@pathao.com";
            $this->password     = "lovePathao";
        } else {
            $clientId     = config('services.pathao.client_id');
            $clientSecret = config('services.pathao.client_secret');
            $username     = config('services.pathao.username');
            $password     = config('services.pathao.password');
            //  Fail early with a clear message instead of cryptic TypeError
            if (!$clientId || !$clientSecret || !$username || !$password) {
                throw new \RuntimeException(
                    'Pathao production credentials are missing. ' .
                        'Check PATHAO_CLIENT_ID, PATHAO_CLIENT_SECRET, PATHAO_USERNAME, PATHAO_PASSWORD in .env'
                );
            }
            $this->baseUrl      = "https://api-hermes.pathao.com/aladdin/api/v1";
            $this->clientId     = $clientId;
            $this->clientSecret = $clientSecret;
            $this->username     = $username;
            $this->password     = $password;
        }
    }
    /**
     * Get a valid access token (from DB, refreshed, or freshly issued).
     */
    public function getAccessToken(): string
    {
        // Scope tokens per environment to avoid sandbox token being used in production
        $env   = config('services.pathao.sandbox', false) ? 'sandbox' : 'live';
        $token = PathaoToken::where('environment', $env)->latest()->first();
        // 1. Token exists and is still valid → return it
        if ($token && Carbon::now()->lt($token->expires_at)) {
            return $token->access_token;
        }
        // 2. Token exists but expired → try refreshing
        if ($token && $token->refresh_token) {
            try {
                return $this->refreshToken($token->refresh_token);
            } catch (\Exception $e) {
                Log::warning("Pathao [{$env}] refresh token failed, re-issuing: " . $e->getMessage());
            }
        }
        // 3. No token or refresh failed → issue a brand new token
        return $this->issueToken();
    }
    /**
     * Issue a fresh token using credentials.
     */
    public function issueToken(): string
    {
        $response = Http::post($this->baseUrl . "/issue-token", [
            "client_id"     => $this->clientId,
            "client_secret" => $this->clientSecret,
            "grant_type"    => "password",
            "username"      => $this->username,
            "password"      => $this->password,
        ]);
        $this->ensureSuccess($response, 'issue token');
        return $this->saveToken($response->json());
    }
    /**
     * Refresh an existing token.
     */
    public function refreshToken(string $refreshToken): string
    {
        $response = Http::post($this->baseUrl . "/issue-token", [
            "client_id"     => $this->clientId,
            "client_secret" => $this->clientSecret,
            "grant_type"    => "refresh_token",
            "refresh_token" => $refreshToken,
        ]);
        $this->ensureSuccess($response, 'refresh token');
        return $this->saveToken($response->json());
    }
    /**
     * Persist token to DB and return the access token string.
     */
    private function saveToken(array $data): string
    {
        if (empty($data['access_token']) || empty($data['refresh_token']) || empty($data['expires_in'])) {
            throw new \RuntimeException('Invalid token response from Pathao: ' . json_encode($data));
        }
        $env       = config('services.pathao.sandbox', true) ? 'sandbox' : 'live';
        $expiresAt = Carbon::now()->addSeconds($data['expires_in']);
        // Delete only tokens for this environment
        PathaoToken::where('environment', $env)->delete();
        PathaoToken::create([
            'environment'   => $env,
            'access_token'  => $data['access_token'],
            'refresh_token' => $data['refresh_token'],
            'expires_in'    => $data['expires_in'],
            'expires_at'    => $expiresAt,
        ]);
        return $data['access_token'];
    }
    /**
     * Get delivery price plan.
     * Fixed endpoint: /merchant/price-plan (not /price-plan)
     */
    public function getPricePlan(int $storeId, int $cityId, int $zoneId, float $itemWeight = 0.5, ?int $areaId = null): array
    {
        $token = $this->getAccessToken();
        $payload = [
            'store_id'       => $storeId,
            'item_type'      => 2,
            'delivery_type'  => 48,
            'item_weight'    => $itemWeight,
            'recipient_city' => $cityId,
            'recipient_zone' => $zoneId,
        ];
        if ($areaId) {
            $payload['recipient_area'] = $areaId;
        }
        $response = Http::withToken($token)
            ->post($this->baseUrl . '/merchant/price-plan', $payload); // ← Fixed endpoint
        $this->ensureSuccess($response, 'get price plan');
        return $response->json();
    }
    /**
     * Create a single Pathao order.
     */
    public function createOrder(array $payload): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->post($this->baseUrl . '/orders', $payload);
        $this->ensureSuccess($response, 'create order');
        return $response->json();
    }
    /**
     * Create multiple orders at once.
     */
    public function createBulkOrder(array $orders): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->post($this->baseUrl . '/orders/bulk', ['orders' => $orders]);
        $this->ensureSuccess($response, 'create bulk order');
        return $response->json();
    }
    /**
     * Get order short info by consignment ID.
     */
    public function getOrderInfo(string $consignmentId): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->get($this->baseUrl . "/orders/{$consignmentId}/info");
        $this->ensureSuccess($response, 'get order info');
        return $response->json();
    }
    /**
     * Get all stores for the authenticated merchant.
     */
    public function getStores(): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->get($this->baseUrl . '/stores');
        $this->ensureSuccess($response, 'get stores');
        return $response->json();
    }
    /**
     * Get list of cities.
     */
    public function getCities(): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->get($this->baseUrl . '/city-list');
        $this->ensureSuccess($response, 'get cities');
        return $response->json();
    }
    /**
     * Get zones within a city.
     */
    public function getZones(int $cityId): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->get($this->baseUrl . "/cities/{$cityId}/zone-list");
        $this->ensureSuccess($response, 'get zones');
        return $response->json();
    }
    /**
     * Get areas within a zone.
     */
    public function getAreas(int $zoneId): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->get($this->baseUrl . "/zones/{$zoneId}/area-list");
        $this->ensureSuccess($response, 'get areas');
        return $response->json();
    }
    /**
     * Create a new store.
     */
    public function createStore(array $payload): array
    {
        $token    = $this->getAccessToken();
        $response = Http::withToken($token)
            ->post($this->baseUrl . '/stores', $payload);
        $this->ensureSuccess($response, 'create store');
        return $response->json();
    }
    /**
     * Throw a descriptive exception if the HTTP response is not successful.
     */
    private function ensureSuccess(\Illuminate\Http\Client\Response $response, string $action): void
    {
        if ($response->failed()) {
            $body = $response->body();
            Log::error("Pathao API [{$action}] failed [{$response->status()}]: {$body}");
            throw new \RuntimeException("Pathao {$action} failed ({$response->status()}): {$body}");
        }
    }
}
