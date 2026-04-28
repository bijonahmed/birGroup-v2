<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Models\Categorys;
use Illuminate\Http\Request;
use App\Models\Product;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use App\Models\Order;
use Validator;

use App\Models\OrderStatus;
use App\Models\OrderHistory;
use App\Models\ProductCategory;
use App\Models\CategoryCommissionHistory;
use App\Models\couponUseHistory;
use App\Models\ordersProduct;
use Illuminate\Support\Facades\Log;
use App\Models\productwarrantyhistory;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Support\Facades\Validator as FacadesValidator;

class OrderSubmit extends Controller
{
    function generateUniqueRandomNumber($length = 5)
    {
        do {
            $randomNumber = mt_rand(pow(10, $length - 1), pow(10, $length) - 1);
        } while (Order::where('id', $randomNumber)->exists());
        return $randomNumber;
    }

    public function sms_send($longOrderId, $customerPhone)
    {

        $message = "Order confirmed! ID: {$longOrderId}. We'll contact you shortly. - Bir Ecommerce";

        try {
            $response = Http::asForm()->post('http://bulksmsbd.net/api/smsapi', [
                'api_key'  => env('BULKSMS_API_KEY'),
                'senderid' => env('BULKSMS_SENDER_ID'),
                'number'   => preg_replace('/\D/', '', "88$customerPhone"),
                'message'  => $message, // ✅ REQUIRED
            ]);
            Log::info('SMS send response', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);
            return $response->body();
        } catch (\Exception $e) {
            Log::error('SMS Error', ['error' => $e->getMessage()]);
            return false;
        }
    }



    public function sms_send_login_details($phone, $email, $password)
    {

        $message = "Welcome to Bir Ecommerce! Your account has been created.Please log in to view your orders. Email: {$email} , Password: {$password} - Bir Ecommerce.";

        try {
            $response = Http::asForm()->post('http://bulksmsbd.net/api/smsapi', [
                'api_key'  => env('BULKSMS_API_KEY'),
                'senderid' => env('BULKSMS_SENDER_ID'),
                'number'   => preg_replace('/\D/', '', "88$phone"),
                'message'  => $message, // ✅ REQUIRED
            ]);
            Log::info('SMS send response', [
                'status' => $response->status(),
                'body'   => $response->body(),
            ]);
            return $response->body();
        } catch (\Exception $e) {
            Log::error('SMS Error', ['error' => $e->getMessage()]);
            return false;
        }
    }


    public function submitOrder(Request $request)
    {
       // dd($request->all());
        // Validate request
        $validator = FacadesValidator::make(
            $request->all(),
            [
                'subTotal'              => 'required|numeric',
                'item_total'            => 'required|numeric',
                'shipp_phoneNumber'     => 'required',
                'shipp_address'         => 'required',
                'Cutomer_name'          => 'required|string',
                'Cutomer_email'         => 'required|email',
                'Cutomer_phone_number'  => 'required',
                'payment_staus'         => 'required|in:cod,online',
                'cart'                  => 'required|json',
            ],
            [
                'subTotal.required'             => 'Subtotal is required',
                'item_total.required'           => 'Total amount is required',
                'shipp_phoneNumber.required'    => 'Please add your shipping phone number',
                'shipp_address.required'        => 'Please add your shipping address',
                'payment_staus.required'        => 'Please select a payment method',
                'payment_staus.in'              => 'Invalid payment method selected',
                'cart.required'                 => 'Cart is empty',
                'cart.json'                     => 'Cart data is invalid',
            ]
        );
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::where('email', $request->Cutomer_email)
            ->orWhere('phone_number', $request->Cutomer_phone_number)
            ->first();


        if (!$user) {

            $password = 123456; // Default password for new users
            $user = User::create([
                'email'        => $request->Cutomer_email,
                'phone_number' => $request->Cutomer_phone_number,
                'name'         => $request->Cutomer_name,
                'role_id'      => 2,
                'password' => bcrypt($password),
            ]);

            $this->sms_send_login_details($request->Cutomer_phone_number, $request->Cutomer_email, $password);
        }
        $userId = $user->id;
        //echo $userId;exit; 
        // $this->userid = $user->id;
        // Generate unique order ID
        $randomNum = $userId . $this->generateUniqueRandomNumber() . "-" . date("y");
        //  Decode cart data
        $cartData = json_decode($request->cart);
        if (is_object($cartData)) {
            $cartData = [$cartData];
        }
        // Calculate total (optional)
        $total = 0;
        foreach ($cartData as $cartItem) {
            $quantity  = $cartItem->quantity;
            $price     = floatval(str_replace(',', '', $cartItem->product->price));
            if (!is_numeric($quantity) || !is_numeric($price)) continue;
            $total += $quantity * $price;
        }
        //  Save order
        $order = Order::create([
            'orderId'       => $randomNum,
            'total'         => $request->item_total,
            'subtotal'      => $request->subTotal,
            'shipper_name'  => $request->Cutomer_name,
            'shipper_email' => $request->Cutomer_email,
            'shipper_phone_number'  => $request->Cutomer_phone_number,
            'shipper_address'       => $request->shipp_address,
            'billing_name'          => $request->Cutomer_name,
            'billing_email'         => $request->Cutomer_email,
            'billing_phone_number'  => $request->Cutomer_phone_number,
            'billing_address'       => $request->billAddress,
            'payment_type'          => $request->payment_staus,
            'delivery_charge'       => $request->delivery_fee,
            'delivery_type'         => $request->delivery_type,
            //apply coupon
            'coupon_id'             => $request->coupon_id ?? "",
            'coupon_code'           => $request->coupon_code ?? "",
            'coupon_discount'       => $request->coupon_discount ?? "",

            'customer_id'           => $userId,
            'order_status'          => 1, // Placed
        ]);
        // Save each product in the order
        foreach ($cartData as $item) {
            $product = $item->product;
            ordersProduct::create([
                'order_id'          => $order->orderId,
                'product_id'        => $product->id,
                'price'             => $product->price,
                'discount'          => $product->discount,
                'discount_status'   => $product->discount_status,
                'last_price'        => $product->last_price,
                'qty'               => $item->quantity,
                'color'             => $product->color ?? '',
                'size'              => $product->size ?? '',
                'vat'               => $product->vat ?? '',
                'vat_status'        => $product->vat_status ?? '',
            ]);
            if (!empty($product->warranty_id)) {
                productwarrantyhistory::create([
                    'warranty_id' => $product->warranty_id,
                    'product_id'  => $product->id,
                    'order_id'    => $order->orderId,
                ]);
            }
        }
        //  Process category commission and order history
        $itemtotal = 0;
        foreach ($cartData as $cartItem) {
            $productId = $cartItem->product->id;
            $quantity  = $cartItem->quantity;
            $price     = floatval(str_replace(',', '', $cartItem->product->price));
            // Seller info
            $chkpost = Product::where('id', $productId)->select('seller_id')->first();
            $seller_id = $chkpost ? $chkpost->seller_id : 1;
            // Category commission
            $chkCat = ProductCategory::where('product_id', $productId)->first();
            $categories = !empty($chkCat->parent_id) ? explode(',', $chkCat->parent_id) : [];
            $catrow = Categorys::where('id', $categories)->first();
            // Order history
            $subtotal = $quantity * $price;
            $itemtotal += $subtotal;
            OrderHistory::create([
                'order_id'   => $order->id,
                'seller_id'  => $seller_id,
                'product_id' => $productId,
                'quantity'   => $quantity,
                'price'      => $price,
                'total'      => $itemtotal,
            ]);
        }
        // Coupon usage
        if (!empty($request->coupon_id)) {
            couponUseHistory::create([
                'user_id' => $userId,
                'coupon_id' => $request->coupon_id,
            ]);
        }

        $this->sms_send($order->orderId, $request->Cutomer_phone_number);
        //Success response
        return response()->json([
            'message'  => "Your order successfully done!",
            'order_id' => $order->orderId,
        ], 200);
    }
}
