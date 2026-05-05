<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />
        <section class="main_content py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-8">
                        <!-- Success Card -->
                        <div class="success-card">
                            <!-- Header -->
                            <div class="success-card__header">
                                <div class="success-icon">
                                    <svg width="64" height="64" viewBox="0 0 80 80" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="40" cy="40" r="40" fill="#fff" fill-opacity="0.2" />
                                        <path
                                            d="M52.9743 35.7612C52.9743 35.3426 52.8069 34.9241 52.5056 34.6228L50.2288 32.346C49.9275 32.0446 49.5089 31.8772 49.0904 31.8772C48.6719 31.8772 48.2533 32.0446 47.952 32.346L36.9699 43.3449L32.048 38.4062C31.7467 38.1049 31.3281 37.9375 30.9096 37.9375C30.4911 37.9375 30.0725 38.1049 29.7712 38.4062L27.4944 40.683C27.1931 40.9844 27.0257 41.4029 27.0257 41.8214C27.0257 42.24 27.1931 42.6585 27.4944 42.9598L33.5547 49.0201L35.8315 51.2969C36.1328 51.5982 36.5513 51.7656 36.9699 51.7656C37.3884 51.7656 37.8069 51.5982 38.1083 51.2969L40.385 49.0201L52.5056 36.8996C52.8069 36.5982 52.9743 36.1797 52.9743 35.7612Z"
                                            fill="white" />
                                    </svg>
                                </div>
                                <h2>Order Confirmed!</h2>
                                <p>Thank you! Your order has been received and is being processed.</p>
                            </div>
                            <!-- Body -->
                            <div class="success-card__body" v-if="orderData">
                                <center>
                                    <h3>Order ID: {{ orderData.order_id }}</h3>
                                </center>
                                <!-- Two Column: Customer Info + Shipping -->
                                <div class="info-grid">
                                    <!-- Customer Info -->
                                    <div class="info-section">
                                        <div class="info-section__title">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" viewBox="0 0 24 24">
                                                <path
                                                    d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" />
                                            </svg>
                                            Customer Info
                                        </div>
                                        <div class="info-section__body">
                                            <div class="info-row">
                                                <span class="info-row__label">Name</span>
                                                <span class="info-row__value">{{ orderData.customerName }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span class="info-row__label">Email</span>
                                                <span class="info-row__value">{{ orderData.customerEmail }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span class="info-row__label">Phone</span>
                                                <span class="info-row__value">{{ orderData.customerPhone }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span class="info-row__label">Date</span>
                                                <span class="info-row__value">{{ orderData.date }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span class="info-row__label">Payment</span>
                                                <span class="info-row__value">
                                                    <span class="badge-payment">{{ paymentLabel }}</span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Shipping Info -->
                                    <div class="info-section">
                                        <div class="info-section__title">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" viewBox="0 0 24 24">
                                                <path
                                                    d="M20 8h-3V4H3c-1.1 0-2 .9-2 2v11h2c0 1.66 1.34 3 3 3s3-1.34 3-3h6c0 1.66 1.34 3 3 3s3-1.34 3-3h2v-5l-3-4zM6 18.5c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm13.5-9l1.96 2.5H17V9.5h2.5zm-1.5 9c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5z" />
                                            </svg>
                                            Shipping Address
                                        </div>
                                        <div class="info-section__body">
                                            <div class="info-row">
                                                <span class="info-row__label">Address</span>
                                                <span class="info-row__value">{{ orderData.shippingAddress }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span class="info-row__label">Phone</span>
                                                <span class="info-row__value">{{ orderData.shippingPhone }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Order Items Table -->
                                <div class="order-table-wrap">
                                    <div class="order-table-wrap__title">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" viewBox="0 0 24 24">
                                            <path
                                                d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 3c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6zm7 13H5v-.23c0-.62.28-1.2.76-1.58C7.47 15.82 9.64 15 12 15s4.53.82 6.24 2.19c.48.38.76.97.76 1.58V19z" />
                                        </svg>
                                        Order Summary
                                    </div>
                                    <table class="order-table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th class="text-center">Qty</th>
                                                <th class="text-right">Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(item, index) in productsList" :key="index">
                                                <td>{{ item.product_name }}</td>
                                                <td class="text-center">
                                                    <span class="qty-badge">{{ item.quantity }}</span>
                                                </td>
                                                <td class="text-right">BDT {{ (item.price * item.quantity).toFixed(2) }}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- Totals -->
                                    <div class="order-totals">
                                        <div class="order-totals__row">
                                            <span>Items Total</span>
                                            <span>BDT {{ orderData.itemTotal }}</span>
                                        </div>
                                        <div class="order-totals__row">
                                            <span>Delivery Charge
                                                <span v-if="orderData.delivery_type">({{ orderData.delivery_type
                                                    }})</span>

                                            </span>
                                            <span>BDT {{ orderData.deliveryFee }}</span>
                                        </div>

                                        <!-- ✅ Coupon Discount row — only shown if coupon was applied -->
                                        <div class="order-totals__row order-totals__row--coupon"
                                            v-if="orderData.couponDiscount && parseFloat(orderData.couponDiscount) > 0">
                                            <span class="coupon-label">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                    fill="currentColor" viewBox="0 0 24 24"
                                                    style="margin-right:4px;vertical-align:middle;">
                                                    <path
                                                        d="M21.41 11.58l-9-9C12.05 2.22 11.55 2 11 2H4c-1.1 0-2 .9-2 2v7c0 .55.22 1.05.59 1.42l9 9c.36.36.86.58 1.41.58s1.05-.22 1.41-.59l7-7c.37-.36.59-.86.59-1.41s-.23-1.06-.59-1.42zM5.5 7C4.67 7 4 6.33 4 5.5S4.67 4 5.5 4 7 4.67 7 5.5 6.33 7 5.5 7z" />
                                                </svg>
                                                Coupon Discount
                                            </span>
                                            <span class="coupon-amount">- BDT {{
                                                parseFloat(orderData.couponDiscount).toFixed(2) }}</span>
                                        </div>

                                        <div class="order-totals__row order-totals__row--total">
                                            <span>Total</span>
                                            <span>BDT {{ orderData.total }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Fallback -->
                            <div v-if="!orderData" class="no-order">
                                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="#ccc"
                                    viewBox="0 0 24 24">
                                    <path
                                        d="M11 15h2v2h-2zm0-8h2v6h-2zm.99-5C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z" />
                                </svg>
                                <p>No order information found.</p>
                            </div>

                            <!-- <center>
                                <h5 style="
                                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                                    color: #ffffff;
                                    padding: 12px 24px;
                                    border-radius: 25px;
                                    display: inline-block;
                                    font-size: 14px;
                                    font-weight: 600;
                                    letter-spacing: 0.3px;
                                    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                                    border-left: 4px solid #f093fb;
                                    margin: 10px 0; ">
                                    🚚 Note: The final delivery charge will be confirmed by our call center agent.
                                </h5>
                            </center> -->
                            <!-- Footer CTA -->
                            <div class="success-card__footer">
                                <nuxt-link to="/" class="btn-continue">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        viewBox="0 0 24 24">
                                        <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z" />
                                    </svg>
                                    Continue Shopping
                                </nuxt-link>
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
    head() {
        return {
            title: 'Order Confirmed - Bir Group',
        };
    },
    data() {
        return {
            orderData: null,
            showPassword: false,
            copied: false,
            productsList: [],
        };
    },
    mounted() {
        if (process.client) {
            const saved = sessionStorage.getItem('lastOrderData');
            if (saved) {
                this.orderData = JSON.parse(saved);
                this.getproductsList();
            }
        }
    },
    computed: {
        paymentLabel() {
            if (!this.orderData) return '';
            return this.orderData.paymentMethod === 'cod' ? 'Cash on Delivery' : 'Online Payment';
        },
    },
    methods: {
        getproductsList() {
            this.$axios.get('/unauthenticate/getCartData?order_id=' + this.orderData.order_id)
                .then(response => {
                    this.productsList = response.data.data;
                });
        },
    },
};
</script>

<style scoped>
/* ── Outer Card ── */
.success-card {
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.09);
    overflow: hidden;
}

/* ── Header ── */
.success-card__header {
    background: linear-gradient(135deg, #900c3f, #c0392b);
    color: #fff;
    text-align: center;
    padding: 40px 24px 32px;
}

.success-icon {
    margin-bottom: 16px;
}

.success-card__header h2 {
    font-size: 1.6rem;
    font-weight: 800;
    margin: 0 0 8px;
}

.success-card__header p {
    font-size: 0.95rem;
    opacity: 0.88;
    margin: 0;
}

/* ── Body ── */
.success-card__body {
    padding: 28px 28px 8px;
}

/* ── Info Grid ── */
.info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
    margin-bottom: 24px;
}

@media (max-width: 576px) {
    .info-grid {
        grid-template-columns: 1fr;
    }
}

.info-section {
    border: 1px solid #eee;
    border-radius: 10px;
    overflow: hidden;
}

.info-section__title {
    background: #f8f8f8;
    border-bottom: 1px solid #eee;
    font-weight: 700;
    font-size: 0.82rem;
    color: #444;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    padding: 10px 14px;
    display: flex;
    align-items: center;
    gap: 7px;
}

.info-section__body {
    padding: 12px 14px;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.info-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    font-size: 0.85rem;
    gap: 8px;
}

.info-row__label {
    color: #888;
    font-weight: 600;
    flex-shrink: 0;
    min-width: 70px;
}

.info-row__value {
    color: #222;
    text-align: right;
}

.badge-payment {
    background: #fff3cd;
    color: #856404;
    border-radius: 20px;
    padding: 2px 10px;
    font-size: 0.78rem;
    font-weight: 600;
}

/* ── Order Table ── */
.order-table-wrap {
    border: 1px solid #eee;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 24px;
}

.order-table-wrap__title {
    background: #f8f8f8;
    border-bottom: 1px solid #eee;
    font-weight: 700;
    font-size: 0.82rem;
    color: #444;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    padding: 10px 16px;
    display: flex;
    align-items: center;
    gap: 7px;
}

.order-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.87rem;
}

.order-table thead tr {
    background: #fafafa;
}

.order-table th {
    padding: 10px 16px;
    font-weight: 700;
    font-size: 0.78rem;
    color: #888;
    text-transform: uppercase;
    letter-spacing: 0.4px;
    border-bottom: 1px solid #eee;
}

.order-table td {
    padding: 11px 16px;
    color: #333;
    border-bottom: 1px solid #f3f3f3;
}

.order-table tbody tr:last-child td {
    border-bottom: none;
}

.text-center {
    text-align: center !important;
}

.text-right {
    text-align: right !important;
}

.qty-badge {
    display: inline-block;
    background: #f0f0f0;
    color: #444;
    border-radius: 4px;
    padding: 2px 9px;
    font-weight: 600;
    font-size: 0.82rem;
}

/* ── Totals ── */
.order-totals {
    border-top: 1px solid #eee;
    padding: 14px 16px;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.order-totals__row {
    display: flex;
    justify-content: space-between;
    font-size: 0.88rem;
    color: #555;
}

/* ✅ Coupon discount row styling */
.order-totals__row--coupon {
    background: #f0faf4;
    border: 1px dashed #28a745;
    border-radius: 6px;
    padding: 7px 10px;
    margin: 2px 0;
}

.coupon-label {
    color: #1a7a3a;
    font-weight: 600;
    display: flex;
    align-items: center;
}

.coupon-amount {
    color: #1a7a3a;
    font-weight: 700;
}

.order-totals__row--total {
    font-weight: 800;
    font-size: 1rem;
    color: #900c3f;
    border-top: 1px dashed #eee;
    padding-top: 10px;
    margin-top: 4px;
}

/* ── No Order ── */
.no-order {
    text-align: center;
    padding: 40px;
    color: #bbb;
}

.no-order p {
    margin-top: 12px;
    font-size: 0.95rem;
}

/* ── Footer CTA ── */
.success-card__footer {
    padding: 20px 28px 28px;
    text-align: center;
    border-top: 1px solid #f0f0f0;
}

.btn-continue {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: #900c3f;
    color: #fff !important;
    text-decoration: none !important;
    padding: 12px 32px;
    border-radius: 8px;
    font-weight: 700;
    font-size: 0.95rem;
    transition: background 0.2s;
}

.btn-continue:hover {
    background: #700930;
}
</style>
