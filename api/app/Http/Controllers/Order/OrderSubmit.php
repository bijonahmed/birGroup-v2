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
use App\Models\productwarrantyhistory;
use App\Models\trackingModel;
use App\Models\WishList;
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


    public function submitOrder(Request $request)
    {
        // 1️⃣ Validate request
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
            $user = User::create([
                'email' => $request->Cutomer_email,
                'phone_number' => $request->Cutomer_phone_number,
                'name' => $request->Cutomer_name,
                'role_id' => 2,
                'password' => bcrypt(123456),
            ]);
        }

        $userId = $user->id;

        //echo $userId;exit; 
        // $this->userid = $user->id;

        // 3️⃣ Generate unique order ID
        $randomNum = $userId . $this->generateUniqueRandomNumber() . "-" . date("y");

        // 4️⃣ Decode cart data
        $cartData = json_decode($request->cart);
        if (is_object($cartData)) {
            $cartData = [$cartData];
        }

        // 5️⃣ Calculate total (optional)
        $total = 0;
        foreach ($cartData as $cartItem) {
            $quantity  = $cartItem->quantity;
            $price     = floatval(str_replace(',', '', $cartItem->product->price));
            if (!is_numeric($quantity) || !is_numeric($price)) continue;
            $total += $quantity * $price;
        }

        // 6️⃣ Save order
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
            'customer_id'           => $userId,
            'order_status'          => 1, // Placed
        ]);

        // 7️⃣ Save each product in the order
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

        // 8️⃣ Process category commission and order history
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

        // 9️⃣ Coupon usage
        if (!empty($request->coupon_id)) {
            couponUseHistory::create([
                'user_id' => $userId,
                'coupon_id' => $request->coupon_id,
            ]);
        }

        // ✅ Success response
        return response()->json("Your order successfully done!", 200);
    }

    /*

    public function submitOrder(Request $request)
    {

        //dd($request->all());

        $validator = FacadesValidator::make(
            $request->all(),
            [
                'subTotal'              => 'required',
                'item_total'            => 'required',
                'shipp_phoneNumber'     => 'required',
                'shipp_address'         => 'required',
                'Cutomer_name'          => 'required',
                'Cutomer_email'         => 'required',
                'Cutomer_phone_number'  => 'required',
                'payment_staus'         => 'required',
            ],
            [
                'item_total'            => 'Errors in Total amount',
                'shipp_phoneNumber'     => 'Please add your shipping phone number',
                'shipp_address'         => 'Please add your shipping address',
                'payment_staus'         => 'Please select payment method',

            ]
        );

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }


        $subTotal               = $request->subTotal;
        $item_total             = $request->item_total;
        $shipp_address          = $request->shipp_address;
        $billAddress            = $request->billAddress;
        $Cutomer_name           = $request->Cutomer_name;
        $Cutomer_email          = $request->Cutomer_email;
        $Cutomer_phone_number   = $request->Cutomer_phone_number;
        $payment_staus          = $request->payment_staus;


        //first verify email and phone_number create new user id if empty users table and role_id 2 otherwise everything is okay

        $randomNum = $this->userid . $this->generateUniqueRandomNumber() . "-" . date("y");

        $cartData = json_decode($request->input('cart'));
        if (is_object($cartData)) {
            // Convert the stdClass object to an array
            $cartData = [$cartData];
        }
        // dd($cartData);
        // return false;
        $total = 0;
        foreach ($cartData as $cartItem) {
            $productid = $cartItem->product->id; //$cartItem['product']['id'];
            $quantity  = $cartItem->quantity; //$cartItem['quantity'];
            $price     = str_replace(',', '', $cartItem->product->price); //$cartItem['product']['price']); // Remove commas
            $price     = floatval($price); // Convert to float

            if (!is_numeric($quantity) || !is_numeric($price)) {
                continue;
            }
            // Calculate the subtotal for the current item
            $subtotal = $quantity * $price;
            $total += $subtotal;
        }

        $order                  = new Order();
        $order->orderId         = $randomNum;
        $order->total           = $item_total;
        $order->subtotal        = $subTotal;

        $order->shipper_name          = $Cutomer_name;
        $order->shipper_email         = $Cutomer_email;
        $order->shipper_phone_number  = $Cutomer_phone_number;
        $order->shipper_address       = $shipp_address;
        $order->billing_name          = $Cutomer_name;
        $order->billing_email         = $Cutomer_email;
        $order->billing_phone_number  = $Cutomer_phone_number;
        $order->billing_address       = $billAddress;
        $order->payment_type        = $payment_staus;

        $order->customer_id     = $this->userid;
        $order->order_status    = 1; // Order Placed 
        $order->save();

        $lastOrderId = $order->id;

        $formattedItems = [];
        foreach ($cartData as $item) {
            $formattedItem = [
                'order_id' => $order->orderId,
                'product_id' => $item->product->id,
                'price' => $item->product->price,
                'discount' => $item->product->discount,
                'discount_status' => $item->product->discount_status,
                'last_price' => $item->product->last_price,
                'qty' => $item->quantity,
                'color' => $item->product->color ? $item->product->color : '',
                'size' => $item->product->size ? $item->product->size : '',
                'vat' => $item->product->vat,
                'vat_status' => $item->product->vat_status,

            ];
            // dd($item->product->warranty_id);
            // return false;
            if (!empty($item->product->warranty_id)) {
                productwarrantyhistory::create([
                    'warranty_id'   => $item->product->warranty_id,
                    'product_id'    => $item->product->id,
                    'order_id'      => $order->orderId,
                ]);
            }

            $formattedItems[] = $formattedItem;
            ordersProduct::create($formattedItem);
        }


        $itemtotal = 0;
        foreach ($cartData as $cartItem) {
            $pid = $cartItem->product->id; //$cartItem['product']['id'];
            $chkpost = Product::where('id', $pid)->select('seller_id')->first();
            $seller_id = !empty($chkpost) ? $chkpost->seller_id : 1;
            $productid = $pid;
            $quantity  = $cartItem->quantity; //$cartItem['quantity'];
            $price     = str_replace(',', '', $cartItem->product->price); //$cartItem['product']['price']); // Remove commas
            $price     = floatval($price); // Convert to float
            $chkCat    = ProductCategory::where('product_id', $productid)->first();
            $categories = !empty($chkCat->parent_id) ? explode(',', $chkCat->parent_id) : "";
            $parentCategoryId = isset($categories[0]) ? $categories[0] : null;
            $catrow     = Categorys::where('id', $categories)->first();
            $commission = !empty($catrow->commission) ? $catrow->commission : 0;
            //Insert into CategoryCommissionHistory
            $categoryHistory = new CategoryCommissionHistory();
            $categoryHistory->customer_id         = $this->userid;
            $categoryHistory->seller_id           = $seller_id;
            $categoryHistory->product_qty         = $quantity;
            $categoryHistory->product_price       = $price;
            $categoryHistory->product_id          = $productid;
            $categoryHistory->category_id         = $parentCategoryId;
            $categoryHistory->category_percetage  = $commission;
            $categoryHistory->admin_get_amount    = ($price * $commission) / 100;
            $categoryHistory->save();
            //End 
            $subtotal = $quantity * $price;
            // Add the subtotal to the total
            $itemtotal += $subtotal;
            $order_history                  = new OrderHistory();
            $order_history->order_id        = $lastOrderId;
            $order_history->seller_id       = $seller_id;
            $order_history->product_id      = $productid;
            $order_history->quantity        = $quantity;
            $order_history->price           = $price;
            $order_history->total           = $itemtotal;
            $order_history->save();
        }

        $couponUse = $request->coupon_id ?? '';
        if ($couponUse !== '') {
            // dd($request->coupon_id,$request->user_id);
            $couponUseadd = couponUseHistory::create([
                'user_id' => $request->user_id,
                'coupon_id' => $request->coupon_id,
            ]);

            return response()->json("Your order successfully done!", 200);
        }

        return response()->json("Your order successfully done!", 200);
    }
    */
}
