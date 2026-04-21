<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderHistory;
use Illuminate\Http\Request;
use App\Models\Product;
//use Darryldecode\Cart\Cart;
use Illuminate\Support\Facades\Session;
use Cart;

class CartController extends Controller
{


    public function getCartData(Request $request)
    {
        $orderId = $request->query('order_id');

        if (!$orderId) {
            return response()->json([
                'status' => false,
                'message' => 'Order ID required'
            ], 400);
        }

        // ✅ Find Order
        $order = Order::where('orderId', $orderId)->first();

        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Sorry invalid order id please check your invalid id'
            ], 404);
        }

        // ✅ Join with product table
        $orderItems = OrderHistory::query()
            ->select(
                'order_history.*',
                'product.name as product_name',
                'order_history.price as product_price',
                'product.thumnail_img'
            )
            ->join('product', 'product.id', '=', 'order_history.product_id')
            ->where('order_history.order_id', $order->id)
            ->get();

        return response()->json([
            'status' => true,
            'order'  => $order,
            'data'   => $orderItems
        ]);
    }
}
