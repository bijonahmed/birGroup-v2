<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />
        <section class="main_content">
            <div class="container">
                <div class="main_profile">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="shopContainer d-block">
                                <div class="order-complete">
                                    <div class="order-complete__message">
                                        <svg width="80" height="80" viewBox="0 0 80 80" fill="none"
                                            xmlns="http://www.w3.org/2000/svg">
                                            <circle cx="40" cy="40" r="40" fill="#B9A16B"></circle>
                                            <path
                                                d="M52.9743 35.7612C52.9743 35.3426 52.8069 34.9241 52.5056 34.6228L50.2288 32.346C49.9275 32.0446 49.5089 31.8772 49.0904 31.8772C48.6719 31.8772 48.2533 32.0446 47.952 32.346L36.9699 43.3449L32.048 38.4062C31.7467 38.1049 31.3281 37.9375 30.9096 37.9375C30.4911 37.9375 30.0725 38.1049 29.7712 38.4062L27.4944 40.683C27.1931 40.9844 27.0257 41.4029 27.0257 41.8214C27.0257 42.24 27.1931 42.6585 27.4944 42.9598L33.5547 49.0201L35.8315 51.2969C36.1328 51.5982 36.5513 51.7656 36.9699 51.7656C37.3884 51.7656 37.8069 51.5982 38.1083 51.2969L40.385 49.0201L52.5056 36.8996C52.8069 36.5982 52.9743 36.1797 52.9743 35.7612Z"
                                                fill="white"></path>
                                        </svg>
                                        <h3>Your order is completed!</h3>
                                        <p>Thank you. Your order has been received.</p>
                                    </div>

                                    <div class="order-info" v-if="orderData">
                                        <div class="order-info__item">
                                            <label>Customer Name</label>
                                            <span>{{ orderData.customerName }}</span>
                                        </div>
                                        <div class="order-info__item">
                                            <label>Email</label>
                                            <span>{{ orderData.customerEmail }}</span>
                                        </div>
                                        <div class="order-info__item">
                                            <label>Phone</label>
                                            <span>{{ orderData.customerPhone }}</span>
                                        </div>
                                        <div class="order-info__item">
                                            <label>Date</label>
                                            <span>{{ orderData.date }}</span>
                                        </div>
                                        <div class="order-info__item">
                                            <label>Total</label>
                                            <span>BDT {{ orderData.total }}</span>
                                        </div>
                                        <div class="order-info__item">
                                            <label>Payment Method</label>
                                            <span>{{ paymentLabel }}</span>
                                        </div>
                                    </div>

                                    <div class="checkout__totals-wrapper" v-if="orderData">
                                        <div class="checkout__totals">
                                            <h3>Order Details</h3>

                                            <!-- Shipping Address -->
                                            <div class="shipping-info mb-3">
                                                <h6 class="shipping-label">Shipping Address</h6>
                                                <p class="shipping-value">{{ orderData.shippingAddress }}</p>
                                                <p class="shipping-value">📞 {{ orderData.shippingPhone }}</p>
                                            </div>

                                            <table class="checkout-cart-items">
                                                <thead>
                                                    <tr>
                                                        <th>PRODUCT</th>
                                                        <th>QTY</th>
                                                        <th>SUBTOTAL</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, index) in orderData.cartItems" :key="index">
                                                        <td>{{ item.product.product_name }}</td>
                                                        <td>{{ item.quantity }}</td>
                                                        <td style="text-align: right;">BDT {{ (item.product.last_price *
                                                            item.quantity).toFixed(2)
                                                        }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <table class="checkout-totals">
                                                <tbody>
                                                    <tr>
                                                        <th>ITEMS TOTAL</th>
                                                        <td>BDT {{ orderData.itemTotal }}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>DELIVERY FEE</th>
                                                        <td>BDT {{ orderData.deliveryFee }}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>TOTAL</th>
                                                        <td>BDT {{ orderData.total }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!-- Fallback if no order data -->
                                    <div v-if="!orderData" class="text-center py-4">
                                        <p>No order information found.</p>
                                    </div>

                                    <div class="text-center mt-4">
                                        <nuxt-link to="/" class="btn-continue">Continue Shopping</nuxt-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="back_top">
            <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
        </div>
        <Footer />
    </div>
</template>

<script>
import $ from 'jquery';
import NavbarSecond from '~/components/NavbarSecond.vue';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';

export default {
    components: {
        NavbarSecond,
        Common_MobileSidebar,
        Common_MiniTabNavbar,
        Common_MobileSearchProduct,
    },
    data() {
        return {
            orderData: null,
        };
    },
    mounted() {
        if (process.client) {
            const saved = sessionStorage.getItem('lastOrderData');
            if (saved) {
                this.orderData = JSON.parse(saved);
                //console.log('First cart item:', JSON.stringify(this.orderData.cartItems[0]))
            }
        }
    },
    computed: {
        paymentLabel() {
            if (!this.orderData) return '';
            return this.orderData.paymentMethod === 'cod' ? 'Cash on Delivery' : 'Online Payment';
        }
    }
};
</script>

<style scoped>
.shipping-info {
    background: #f9f9f9;
    border-radius: 8px;
    padding: 12px 16px;
    margin-bottom: 16px;
}

.shipping-label {
    font-weight: 600;
    font-size: 13px;
    color: #555;
    margin-bottom: 4px;
}

.shipping-value {
    font-size: 14px;
    color: #222;
    margin: 0;
}

.btn-continue {
    display: inline-block;
    background-color: #900c3f;
    color: #fff;
    padding: 12px 30px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    transition: background 0.3s;
}

.btn-continue:hover {
    background-color: #700930;
    color: #fff;
}
</style>