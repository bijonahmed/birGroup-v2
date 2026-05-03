<?php

namespace App\Http\Controllers\Patho;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Services\PathaoService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class GatewayController extends Controller
{
    public function __construct(private PathaoService $pathao) {}

    /**
     * Get stores and cities
     */
    public function checkInitialized()
    {
        $stores = $this->pathao->getStores();
        $cities = $this->pathao->getCities();

        return response()->json([
            'success'      => true,
            'responseData' => [
                'store' => $stores['data']['data'] ?? [],
                'city' => $cities['data']['data'] ?? [],
            ],
        ]);
    }

    /**
     * Get zones by city ID
     */
    public function checkZone(Request $request)
    {
        $request->validate([
            'cityId' => 'required|integer',
        ]);

        $response = $this->pathao->getZones($request->cityId);

        return response()->json([
            'success'      => true,
            'responseData' => [
                'zone' => $response['data']['data'] ?? [],
            ],
        ]);
    }

    /**
     * Get areas by zone ID
     */
    public function checkZoneWiseArea(Request $request)
    {
        $request->validate([
            'zoneId' => 'required|integer',
        ]);

        $response = $this->pathao->getAreas($request->zoneId);

        return response()->json([
            'success'      => true,
            'responseData' => [
                'area' => $response['data']['data'] ?? [],
            ],
        ]);
    }

    /**
     * Get price plan
     */
    public function checkPricingPlanAreaWise(Request $request)
    {
        $request->validate([
            'store_id' => 'required|integer',
            'city_id'  => 'required|integer',
            'zone_id'  => 'required|integer',
            'weight'   => 'nullable|numeric|min:0.5|max:10',
        ]);

        $response = $this->pathao->getPricePlan(
            storeId: $request->store_id,
            cityId: $request->city_id,
            zoneId: $request->zone_id,
            itemWeight: $request->weight ?? 0.5,
            areaId: $request->area_id ?? null,
        );

        return response()->json([
            'success'   => true,
            'pricePlan' => $response['data'] ?? [],
        ]);
    }

    /**
     * Check & sync Pathao order status
     */
    public function checkPathaoResponseOrder(Request $request)
    {

        $request->validate([
            'id' => 'required|integer',
        ]);

        $order = Order::findOrFail($request->id);

        if (empty($order->pathao_consignment_id)) {
            return response()->json([
                'success' => false,
                'message' => 'No Pathao consignment found for this order.',
            ], 404);
        }

        $response           = $this->pathao->getOrderInfo($order->pathao_consignment_id);
        $pathaoOrderStatus  = $response['data']['order_status_slug'] ?? '';



        $order_status = 1;
        if ($pathaoOrderStatus == "Pickup_Cancelled") {
            $order_status = 12; //Pickup cancelled.
        }

        if ($pathaoOrderStatus == "pending") {
            $order_status = 13; //Pickup cancelled.
        }

        $order->update([
            'pathao_order_status' => $pathaoOrderStatus,
            'order_status' => $order_status,
        ]);

        return response()->json([
            'success'      => true,
            'orderResonse' => [
                'consignment_id'    => $order->pathao_consignment_id,
                'merchant_order_id' => $order->pathao_merchant_order_id,
                'order_status'      => $pathaoOrderStatus,
                'delivery_fee'      => $order->pathao_delivery_fee,
            ],
        ]);
    }

    /**
     * Send order to Pathao
     */
    public function sendToPathao(Request $request)
    {

        //dd($request->all());
        try {
            // dd($request->all());
            $validator = Validator::make($request->all(), [
                'orderId'         => 'required',
                'order_status'    => 'required',
                'store_id'        => 'required|integer',
                'city_id'         => 'required|integer',
                'zone_id'         => 'required|integer',
                'area_id'         => 'required|integer',
                'delivery_charge' => 'required|numeric',
            ], [
                'orderId.required'         => 'Order ID is required.',
                'order_status.required'    => 'Status is required.',
                'store_id.required'        => 'Store is required.',
                'store_id.integer'         => 'Store must be an integer.',
                'city_id.required'         => 'City is required.',
                'city_id.integer'          => 'City must be an integer.',
                'zone_id.required'         => 'Zone is required.',
                'zone_id.integer'          => 'Zone must be an integer.',
                'area_id.required'         => 'Area is required.',
                'area_id.integer'          => 'Area must be an integer.',
                'delivery_charge.required' => 'Delivery charge is required.',
                'delivery_charge.numeric'  => 'Delivery charge must be a number.',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Validation Error',
                    'errors'  => $validator->errors()
                ], 422);
            }

            // $validated = $validator->validated();
            // Get Order
            $order = Order::where('orderId', $request->orderId)->firstOrFail();
            //dd($order);

            // Update order before sending
            Order::where('orderId', $request->orderId)->update([
                'order_status'    => 10,
                'orderUpdateDate' => now()->toDateString(),
                'orderUpdateby'   => Auth::id() ?? 1,
            ]);

            //exit;

            // Call Pathao API
            $pathaoResponse = $this->pathao->createOrder([
                'store_id'            => $request->store_id, //"391862", //$validated['store_id'],
                'merchant_order_id'   => $order->orderId,
                'recipient_name'      => $order->shipper_name,
                'recipient_phone'     => $order->shipper_phone_number,
                'recipient_address'   => $order->shipper_address,
                'recipient_city'      => $request->city_id,
                'recipient_zone'      => $request->zone_id,
                'recipient_area'      => $request->area_id,
                'delivery_type'       => 48,
                'item_type'           => 2,
                'special_instruction' => '',
                'item_quantity'       => 1,
                'item_weight'         => 0.5,
                'amount_to_collect'   => $request->delivery_charge, //$validated['delivery_charge'],
                'item_description'    => 'No details',
            ]);

            // Check Pathao API success
            if (!isset($pathaoResponse['data'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Pathao API failed',
                    'error'   => $pathaoResponse
                ], 400);
            }

            $data = $pathaoResponse['data'];

            // ✅ Save Pathao response
            Order::where('orderId', $request->orderId)->update([
                'pathao_consignment_id'    => $data['consignment_id'] ?? null,
                'pathao_merchant_order_id' => $data['merchant_order_id'] ?? null,
                'pathao_order_status'      => $data['order_status'] ?? null,
                'pathao_delivery_fee'      => $data['delivery_fee'] ?? null,
            ]);

            // ✅ Final success response
            return response()->json([
                'success'       => true,
                'message'       => 'Order sent to Pathao successfully.',
                'orderResponse' => $data
            ]);
        } catch (ValidationException $e) {

            // ✅ Return all validation errors
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors'  => $e->errors()
            ], 422);
        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {

            return response()->json([
                'success' => false,
                'message' => 'Order not found'
            ], 404);
        } catch (\Exception $e) {

            // ✅ Log error for debugging
            \Log::error('Pathao Order Error:', [
                'message' => $e->getMessage()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
                'error'   => $e->getMessage()
            ], 500);
        }
    }
}
