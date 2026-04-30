<template>

    <div class="page-wrapper">
        <div class="page-content">
            <!--breadcrumb-->

            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-3 mt-3">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <router-link to="/">Home</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link to="/orders/order-list">Orders</router-link>
                    </li>
                    <li class="breadcrumb-item active">Order Details</li>
                </ol>
            </nav>

            <!-- HEADER -->
            <div class="card bg-primary text-white mb-3 shadow-sm">
                <div class="card-body d-flex justify-content-between flex-wrap align-items-center">

                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white text-primary rounded p-2">
                            <i class="bx bx-receipt fs-4"></i>
                        </div>
                        <div>
                            <h5 class="mb-0 fw-bold">INVOICE</h5>
                            <small>Order Summary</small>
                        </div>
                    </div>

                    <div class="text-end">
                        <h5 class="mb-0 text-white">#{{ orderid }}</h5>
                        <small>{{ orderDate }}</small>
                    </div>

                </div>
            </div>

            <!-- STATUS -->
            <div class="card mb-3 shadow-sm">
                <div class="card-body d-flex justify-content-between align-items-center flex-wrap">

                    <div>
                        <span class="text-muted small">Order Status:</span>
                        <span class="badge ms-2" :class="statusClass">
                            {{ orderstatus }}
                        </span>
                    </div>

                    <!-- <button class="btn btn-outline-dark btn-sm" @click="printInvoice">
                            <i class="bx bx-printer"></i> Print Invoice
                        </button> -->

                </div>
            </div>

            <!-- CUSTOMER -->
            <div class="card mb-3 shadow-sm">
                <div class="card-body d-flex flex-wrap gap-2">

                    <span class="badge bg-primary p-2">
                        <i class="bx bx-user"></i>Customer Name: {{ customername }}
                    </span>

                    <span class="badge bg-success p-2">
                        <i class="bx bx-phone"></i> Customer Phone: {{ customerphone }}
                    </span>

                    <span class="badge bg-warning text-dark p-2">
                        <i class="bx bx-envelope"></i> Customer Email:{{ customeremail }}
                    </span>

                </div>
            </div>

            <!-- TABLE -->
            <div class="card mb-3 shadow-sm">
                <div class="card-header fw-bold">
                    <i class="bx bx-package"></i> Order Items
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered align-middle text-center mb-0">

                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Image</th>
                                <th class="text-start">Product</th>
                                <th>Qty</th>
                                <th>Unit Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr v-for="(order, index) in orders" :key="index">
                                <td>{{ index + 1 }}</td>

                                <td>
                                    <img :src="order.thumbnail_img" class="rounded" width="50">
                                </td>

                                <td class="text-start fw-semibold">
                                    {{ order.product_name }}
                                </td>

                                <td>
                                    <span class="badge bg-secondary">
                                        {{ order.quantity }}
                                    </span>
                                </td>

                                <td>{{ formatCurrency(order.price) }}</td>

                                <td class="fw-bold text-primary">
                                    {{ formatCurrency(order.total) }}
                                </td>
                            </tr>
                        </tbody>

                        <tfoot>

                            <tr>
                                <td colspan="4" class="text-end fw-bold">Subtotal</td>
                                <td colspan="2">{{ formatCurrency(subtotalAmount) }}</td>
                            </tr>

                            <tr v-if="coupon_code">
                                <td colspan="4" class="text-end">
                                    Discount ({{ coupon_code }})
                                </td>
                                <td colspan="2" class="text-danger">
                                    - {{ formatCurrency(coupon_discount) }}
                                </td>
                            </tr>

                            <tr v-if="delivery_type">
                                <td colspan="4" class="text-end">
                                    Delivery ({{ delivery_type }})
                                </td>
                                <td colspan="2">
                                    {{ formatCurrency(delivery_charge) }}
                                </td>
                            </tr>

                            <tr class="table-primary">
                                <td colspan="4" class="text-end fw-bold">
                                    Grand Total
                                </td>
                                <td colspan="2" class="fw-bold">
                                    {{ formatCurrency(grandTotal) }}
                                </td>
                            </tr>

                        </tfoot>

                    </table>
                </div>
            </div>

            <!-- UPDATE FORM -->
            <div class="card shadow-sm">
                <div class="card-header fw-bold">
                    <i class="bx bx-edit"></i> Update Order
                </div>

                <div class="card-body">
                    <form @submit.prevent="saveData">

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Delivery Charge</label>
                                <input type="number" class="form-control" v-model="delivery_charge">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Order Status</label>
                                <select v-model="insertdata.orderstatus" class="form-select">
                                    <option v-for="(option, index) in order_status" :key="index" :value="option.id">
                                        {{ option.name }}
                                    </option>
                                </select>
                            </div>

                        </div>

                        <button class="btn btn-success">
                            <i class="bx bx-check"></i> Update Order
                        </button>

                    </form>
                </div>
            </div>

            <!-- PRINT AREA (UNCHANGED LOGIC) -->
            <div id="invoice-print" style="display:none">
                <!-- KEEP YOUR ORIGINAL PRINT DESIGN HERE -->
            </div>
        </div>
    </div>


</template>

<script>
export default {
    data() {
        return {
            orderstatus: '',
            orderid: '',
            customername: '',
            customeremail: '',
            customerphone: '',
            coupon_discount: 0,
            coupon_code: '',
            delivery_charge: 0,
            delivery_type: '',
            insertdata: {
                orderId: this.$route?.query?.orderId || '',
                orderstatus: '',
            },
            orders: [],
            order_status: [],
            errors: {},
            orderDate: '',
            ordersData: '',
        };
    },

    async mounted() {
        this.defaultLoading();
    },

    computed: {
        totalQuantity() {
            return this.orders.reduce((t, o) => t + Number(o.quantity), 0);
        },
        subtotalAmount() {
            return this.orders.reduce((t, o) => t + Number(o.total), 0);
        },
        grandTotal() {
            return (
                this.subtotalAmount -
                Number(this.coupon_discount || 0) +
                Number(this.delivery_charge || 0)
            );
        },
        statusClass() {
            const s = (this.orderstatus || '').toLowerCase();
            if (s.includes('deliver')) return 'bg-success';
            if (s.includes('cancel')) return 'bg-danger';
            if (s.includes('dispatch')) return 'bg-info text-dark';
            if (s.includes('packed')) return 'bg-warning text-dark';
            return 'bg-secondary';
        },
    },

    methods: {
        formatCurrency(val) {
            return '৳ ' + (Number(val) || 0).toFixed(2);
        },

        printInvoice() {
            window.print();
        },

        saveData() {

            // ✅ Clean numeric validation
            const charge = Number(this.delivery_charge);

            if (!charge || charge <= 0) {
                alert("Delivery charge must be greater than 0");
                return; 
            }

            // Optional: prevent double click
            if (this.loading) return;
            this.loading = true;

            const formData = new FormData();
            formData.append('orderId', this.insertdata.orderId);
            formData.append('orderstatus', this.insertdata.orderstatus);
            formData.append('delivery_charge', charge);

            this.$axios.post('/order/update_order_status', formData)
                .then(() => {
                    this.success_noti && this.success_noti();
                    this.$router.push('/orders/order-list');
                })
                .catch((error) => {
                    console.error(error);
                    alert("Something went wrong! Please try again.");
                })
                .finally(() => {
                    this.loading = false;
                });
        },
        async defaultLoading() {
            const orderId = this.$route?.query?.orderId;
            this.orderid = orderId;

            const res = await this.$axios.get(`/order/orderDetails/${orderId}`);

            this.orders = res.data.orderdata;
            this.orderstatus = res.data.orderrow;
            this.customername = res.data.customername;
            this.customeremail = res.data.customeremail;
            this.customerphone = res.data.customerphone;
            this.order_status = res.data.OrderStatus;
            this.orderDate = res.data.create_at;
            this.coupon_discount = res.data.coupon_discount || 0;
            this.coupon_code = res.data.coupon_code;
            this.delivery_charge = res.data.delivery_charge || 0;
            this.delivery_type = res.data.delivery_type;
            this.insertdata.orderstatus = res.data.orderstatus_id;
        },
    },
};
</script>