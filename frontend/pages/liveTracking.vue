<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />
        <section class="main_content py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-8">
                        <!-- TRACKING INPUT -->
                        <div class="tracking-box mb-3">
                            <h4>Bir E-commerce Order Tracking</h4>
                            <div class="tracking-input">
                                <input v-model="trackingId" type="text" placeholder="Enter Order ID (e.g. 123456)" />
                                <button @click="trackOrder">Track</button>
                            </div>
                            <center>
                                <p v-if="errorMsg" class="error text-center">{{ errorMsg }}</p>
                            </center>
                        </div>
                        <!-- SUCCESS CARD -->
                        <div class="success-card" v-if="orderData">
                            <!-- HEADER -->
                            <div class="success-card__header">
                                <div class="success-icon">
                                    <!-- icon unchanged -->
                                    <svg width="64" height="64" viewBox="0 0 80 80" fill="none">
                                        <circle cx="40" cy="40" r="40" fill="#fff" fill-opacity="0.2" />
                                        <path
                                            d="M52.97 35.76L36.96 51.76L27.49 40.68L29.77 38.4L36.96 45.34L50.22 32.34L52.97 35.76Z"
                                            fill="white" />
                                    </svg>
                                </div>
                                <h2>Order Tracking - Bir E-commerce</h2>
                                <p>Live order status and details</p>
                                <!-- STATUS -->
                                <div class="status-badge">
                                    Status: {{ orderData.status || 'Processing' }}
                                </div>
                            </div>
                            <!-- BODY -->
                            <div class="success-card__body">
                                <!-- INFO GRID -->
                                <div class="info-grid">
                                    <div class="info-section">
                                        <div class="info-section__title">Customer Info</div>
                                        <div class="info-section__body">
                                            <div class="info-row">
                                                <span>Name</span>
                                                <span>{{ orderData.billing_name }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span>Email</span>
                                                <span>{{ orderData.billing_email }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span>Phone</span>
                                                <span>{{ orderData.billing_phone_number }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="info-section">
                                        <div class="info-section__title">Shipping</div>
                                        <div class="info-section__body">
                                            <div class="info-row">
                                                <span>Address</span>
                                                <span>{{ orderData.shipper_address }}</span>
                                            </div>
                                            <div class="info-row">
                                                <span>Phone</span>
                                                <span>{{ orderData.shipper_phone_number }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PRODUCTS -->
                                <div class="order-table-wrap">
                                    <div class="order-table-wrap__title">
                                        Order Items
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
                                                <td class="text-center">{{ item.quantity }}</td>
                                                <td class="text-right">
                                                    BDT {{ (item.price * item.quantity).toFixed(2) }}
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- TOTAL -->
                                <div class="order-totals">
                                    <div>Total: BDT {{ orderData.total }}</div>
                                </div>
                            </div>
                            <!-- FOOTER -->
                            <div class="success-card__footer">
                                <nuxt-link to="/" class="btn-continue">
                                    Continue Shopping
                                </nuxt-link>
                            </div>
                        </div>
                        <!-- NOT FOUND -->
                        <div v-else class="no-order">
                            Enter Order ID to track your order
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
export default {
    head() {
        return {
            title: 'Order Tracking - Bir Group',
        };
    },
    data() {
        return {
            trackingId: '',
            orderData: null,
            productsList: [],
            errorMsg: ''
        }
    },
    methods: {
        async trackOrder() {
            this.errorMsg = ''
            if (!this.trackingId) {
                this.errorMsg = 'Please enter order ID'
                return
            }
            try {
                const res = await this.$axios.get(
                    '/unauthenticate/getCartData?order_id=' + this.trackingId
                )
                // success response (200)
                this.orderData = res.data.order
                this.productsList = res.data.data
            } catch (e) {
                if (e.response && e.response.data) {
                    this.errorMsg = e.response.data.message
                } else {
                    this.errorMsg = 'Server error'
                }
                this.orderData = null
                this.productsList = []
            }
        }
    }
}
</script>
<style scoped>
/* ===== PAGE BACKGROUND ===== */
.main_content {
    background: linear-gradient(180deg, #f8f9fb 0%, #ffffff 100%);
}
/* ===== TRACKING BOX ===== */
.tracking-box {
    background: linear-gradient(135deg, #ffffff, #f7f7ff);
    padding: 22px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    border: 1px solid #eee;
    margin-bottom: 18px;
}
.tracking-box h4 {
    font-size: 18px;
    font-weight: 800;
    color: #222;
    margin-bottom: 12px;
    letter-spacing: 0.3px;
}
/* INPUT AREA */
.tracking-input {
    display: flex;
    gap: 10px;
}
.tracking-input input {
    flex: 1;
    padding: 12px 14px;
    border: 2px solid #eee;
    border-radius: 10px;
    outline: none;
    font-size: 14px;
    transition: 0.3s;
    background: #fff;
}
.tracking-input input:focus {
    border-color: #900c3f;
    box-shadow: 0 0 0 3px rgba(144, 12, 63, 0.1);
}
.tracking-input button {
    background: linear-gradient(135deg, #900c3f, #c0392b);
    color: #fff;
    border: none;
    padding: 12px 20px;
    border-radius: 10px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 6px 18px rgba(144, 12, 63, 0.25);
}
.tracking-input button:hover {
    transform: translateY(-2px);
}
/* ERROR */
.error {
    color: #e74c3c;
    margin-top: 10px;
    font-weight: 600;
}
/* ===== SUCCESS CARD ===== */
.success-card {
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
    overflow: hidden;
    border: 1px solid #f1f1f1;
}
/* HEADER */
.success-card__header {
    background: linear-gradient(135deg, #900c3f, #c0392b);
    color: #fff;
    text-align: center;
    padding: 40px 20px 30px;
    position: relative;
}
.success-icon {
    margin-bottom: 10px;
    animation: pop 0.5s ease;
}
@keyframes pop {
    0% {
        transform: scale(0.6);
        opacity: 0;
    }
    100% {
        transform: scale(1);
        opacity: 1;
    }
}
.success-card__header h2 {
    font-size: 20px;
    font-weight: 900;
    margin: 5px 0;
}
.success-card__header p {
    font-size: 13px;
    opacity: 0.9;
}
/* STATUS BADGE */
.status-badge {
    margin-top: 12px;
    display: inline-block;
    padding: 6px 14px;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    color: #fff;
    font-weight: 700;
    border-radius: 30px;
    font-size: 12px;
}
/* BODY */
.success-card__body {
    padding: 24px;
}
/* ===== INFO GRID ===== */
.info-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
    margin-bottom: 20px;
}
@media (max-width: 576px) {
    .info-grid {
        grid-template-columns: 1fr;
    }
}
.info-section {
    border: 1px solid #eee;
    border-radius: 14px;
    overflow: hidden;
    background: #fff;
}
.info-section__title {
    background: #fafafa;
    padding: 10px 14px;
    font-weight: 800;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: #444;
    border-bottom: 1px solid #eee;
}
.info-section__body {
    padding: 12px 14px;
    display: flex;
    flex-direction: column;
    gap: 10px;
}
.info-row {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    color: #333;
}
.info-row span:first-child {
    color: #777;
    font-weight: 600;
}
.text-right {
    text-align: right !important;
}
/* ===== PRODUCT TABLE ===== */
.order-table-wrap {
    border: 1px solid #eee;
    border-radius: 14px;
    overflow: hidden;
    margin-bottom: 15px;
}
.order-table-wrap__title {
    background: #f9f9f9;
    padding: 12px 14px;
    font-weight: 800;
    font-size: 13px;
    border-bottom: 1px solid #eee;
}
.order-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 13px;
}
.order-table th {
    text-align: left;
    padding: 10px;
    background: #fcfcfc;
    color: #777;
    font-weight: 700;
    font-size: 12px;
}
.order-table td {
    padding: 10px;
    border-top: 1px solid #f1f1f1;
    color: #333;
}
.text-center {
    text-align: center;
}
.text-right {
    text-align: right;
}
/* ===== TOTAL BOX ===== */
.order-totals {
    text-align: right;
    font-size: 15px;
    font-weight: 900;
    color: #900c3f;
    padding: 10px 0;
}
/* ===== FOOTER BUTTON ===== */
.success-card__footer {
    padding: 18px;
    text-align: center;
    border-top: 1px solid #f1f1f1;
    background: #fafafa;
}
.btn-continue {
    display: inline-block;
    padding: 12px 26px;
    background: linear-gradient(135deg, #900c3f, #c0392b);
    color: #fff !important;
    border-radius: 10px;
    font-weight: 800;
    text-decoration: none;
    transition: 0.3s;
    box-shadow: 0 8px 20px rgba(144, 12, 63, 0.25);
}
.btn-continue:hover {
    transform: translateY(-2px);
}
/* ===== EMPTY STATE ===== */
.no-order {
    text-align: center;
    padding: 40px;
    color: #999;
    font-weight: 600;
}
/* keep your existing CSS unchanged */
</style>