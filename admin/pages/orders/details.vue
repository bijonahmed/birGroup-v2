<template>
    <div>
        <div class="page-content container mt-5">
            <!-- Breadcrumb -->
           
            <!-- HEADER -->
            <div class="card bg-primary text-white mb-3 shadow-sm">
                <div class="card-body d-flex justify-content-between flex-wrap align-items-center">
                    <div class="d-flex align-items-center gap-3">
                        <div class="bg-white text-primary rounded p-2">
                            <i class="bx bx-receipt fs-4"></i>
                        </div>
                        <div>
                            <h5 class="mb-0 fw-bold text-white">INVOICE</h5>
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
                </div>
            </div>
            <!-- CUSTOMER -->
           <div class="card mb-3 shadow-sm">
    <div class="d-flex flex-wrap align-items-center gap-3 p-3">

        <span class="d-flex align-items-center gap-1">
            <i class="bx bx-user"></i>
            <strong>Customer:</strong> {{ customername }}
        </span>

        <span class="d-flex align-items-center gap-1">
            <i class="bx bx-phone"></i>
            <strong>Phone:</strong> {{ customerphone }}
        </span>

        <span class="d-flex align-items-center gap-1">
            <i class="bx bx-envelope"></i>
            <strong>Email:</strong> {{ customeremail }}
        </span>

        <span class="ms-auto">
            <router-link to="/orders/order-list" class="btn btn-sm btn-primary">
                ← Back to Orders
            </router-link>
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
                                <td class="text-start fw-semibold">{{ order.product_name }}</td>
                                <td>
                                    <span class="badge bg-secondary">{{ order.quantity }}</span>
                                </td>
                                <td>{{ formatCurrency(order.price) }}</td>
                                <td class="fw-bold text-primary">{{ formatCurrency(order.total) }}</td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" class="text-end fw-bold">Subtotal</td>
                                <td colspan="2">{{ formatCurrency(subtotalAmount) }}</td>
                            </tr>
                            <tr v-if="coupon_code">
                                <td colspan="4" class="text-end">Discount ({{ coupon_code }})</td>
                                <td colspan="2" class="text-danger">- {{ formatCurrency(coupon_discount) }}</td>
                            </tr>
                            <tr v-if="delivery_type">
                                <td colspan="4" class="text-end">Delivery ({{ delivery_type }})</td>
                                <td colspan="2">{{ formatCurrency(delivery_charge) }}</td>
                            </tr>
                            <tr class="table-primary">
                                <td colspan="4" class="text-end fw-bold">Grand Total</td>
                                <td colspan="2" class="fw-bold">{{ formatCurrency(grandTotal) }}</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <!-- UPDATE FORM -->
            <div class="card shadow-sm mb-3">
                <div class="card-header fw-bold">
                    <i class="bx bx-edit"></i> Order Info
                </div>
                <div class="card-body">
                    <form @submit.prevent="saveData">
                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Recipient Phone </label>
                                <input type="number" class="form-control" v-model="insertdata.shipper_phone_number">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Recipient Address </label>
                                <input type="text" class="form-control" v-model="insertdata.shipper_address">
                            </div>


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
                        <button class="btn btn-success" :disabled="loading">
                            <i class="bx bx-check"></i> Update Order
                        </button>
                    </form>
                </div>
            </div>
            <!-- TRANSFER TO PATHAO BUTTON -->
            <div class="card shadow-sm mb-3">
                <div class="card-body">
                    <form @submit.prevent="handleSendToDelivery">
                        <button
                            class="btn btn-primary w-100 py-3 rounded-4 fw-semibold d-flex justify-content-center align-items-center gap-2"
                            type="submit" :disabled="pathaoLoading">
                            <span v-if="pathaoLoading" class="spinner-border spinner-border-sm"></span>
                            <i v-else class="bx bx-truck"></i>
                            {{ pathaoLoading ? 'Loading...' : 'Transfer to Pathao' }}
                        </button>
                    </form>
                </div>
            </div>
            <!-- PRINT AREA -->
            <div id="invoice-print" style="display:none"></div>
        </div>
        <!-- PATHAO MODAL -->
        <div v-if="showModal" class="modal fade show d-flex align-items-center justify-content-center" tabindex="-1"
            style="background: rgba(0,0,0,0.5); height: 100vh;">
            <div class="modal-dialog modal-xl modal-fullscreen-lg-down" style="max-width: 95%;">
                <div class="modal-content rounded-4 border-0 shadow">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            <i class="bx bx-truck me-2"></i>Send Request Pathao
                        </h5>
                        <button class="btn-close" @click="showModal = false"></button>
                    </div>
                    <div class="modal-body">

                        <!-- Summary -->
                        <div class="mb-4 d-flex flex-wrap gap-3">
                            <!-- <span class="badge bg-light text-dark border p-2">
                                <strong>Receipt Address:</strong> {{ receiptAddress }}
                            </span> -->
                            <span class="badge bg-light text-dark border p-2" style="font-size:14px;">
                                Store: {{ selectedStoreId || 'Not selected' }}
                            </span>

                            <span class="badge bg-light text-dark border p-2" style="font-size:14px;">
                                City: {{ selectedCity || 'Not selected' }}
                            </span>

                            <span class="badge bg-light text-dark border p-2" style="font-size:14px;">
                                Zone: {{ selectedZoneId || 'Not selected' }}
                            </span>

                            <span class="badge bg-light text-dark border p-2" style="font-size:14px;">
                                Area: {{ selectedAreaId || 'Not selected' }}
                            </span>
                        </div>
                        <div class="d-flex gap-3 flex-wrap">
                            <!-- Store List -->
                            <div class="card shadow-sm mb-3 flex-fill">
                                <div class="card-body">
                                    <div class="row">
                                        <div v-if="errorMessage" class="alert alert-danger">
                                            <ul>
                                                <li v-for="(line, i) in errorMessage.split('\n')" :key="i">
                                                    {{ line }}
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-6">
                                            <h5 class="fw-bold mb-3">Store List</h5>
                                            <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
                                                <table
                                                    class="table table-hover table-striped align-middle text-center mb-0 text-nowrap">
                                                    <thead class="table-primary">
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Store Name</th>
                                                            <th>Address</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr v-if="storeList.length === 0">
                                                            <td colspan="3" class="text-center">No Data Found</td>
                                                        </tr>
                                                        <tr v-for="(item, index) in storeList"
                                                            :key="item.store_id || index" style="cursor: pointer;"
                                                            @click="selectedStoreId = item.store_id"
                                                            :class="{ 'table-primary': selectedStoreId === item.store_id }">
                                                            <td>{{ index + 1 }}</td>
                                                            <td class="text-start">{{ item.store_name }}</td>
                                                            <td class="text-start">{{ item.store_address }}</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div v-if="pricePlanLoading" class="d-inline-flex align-items-center ms-2">
                                                <div class="spinner-border spinner-border-sm text-primary"
                                                    role="status"></div>
                                            </div>

                                            <div v-if="!pricePlanLoading && pricePlan"
                                                class="mt-2 p-2 d-flex flex-wrap gap-2 align-items-center rounded-3"
                                                style="font-size:13px; background: linear-gradient(135deg, #f8f9ff 0%, #eef1ff 100%); border: 1px solid #d0d7ff;">

                                                <span class="text-muted">
                                                    Price: <strong style="color:#4f46e5;">৳{{ pricePlan?.price ?? 0
                                                    }}</strong>
                                                </span>

                                                <span class="text-muted border-start ps-2">
                                                    Discount: <strong style="color:#16a34a;">৳{{ pricePlan?.discount ??
                                                        0 }}</strong>
                                                </span>

                                                <span class="text-muted border-start ps-2">
                                                    Promo: <strong style="color:#d97706;">৳{{ pricePlan?.promo_discount
                                                        ?? 0 }}</strong>
                                                </span>

                                                <span class="text-muted border-start ps-2">
                                                    Extra: <strong style="color:#dc2626;">৳{{
                                                        pricePlan?.additional_charge ?? 0 }}</strong>
                                                </span>

                                                <span class="text-muted border-start ps-2">
                                                    COD: <strong style="color:#0891b2;">
                                                        {{ ((pricePlan?.cod_percentage ?? 0) * 100).toFixed(1) }}%
                                                    </strong>
                                                </span>

                                                <span class="border-start ps-2 fw-bold"
                                                    style="color:#fff; background: linear-gradient(135deg, #4f46e5, #7c3aed); padding: 3px 10px; border-radius: 20px;">
                                                    ৳{{ pricePlan?.final_price ?? 0 }}
                                                </span>
                                            </div>


                                        </div>
                                        <div class="col-6">
                                            <!-- City List -->
                                            <label for="citySelect" class="form-label fw-bold">Select
                                                City</label>
                                            <select id="citySelect" class="form-select" v-model="selectedCity"
                                                @change="handleCityClick(selectedCity)">
                                                <option value="" disabled>-- Select a city --</option>
                                                <option v-for="city in filteredCityList" :key="city.city_id"
                                                    :value="city.city_id">
                                                    {{ city.city_name }} (ID: {{ city.city_id }})
                                                </option>
                                                <option v-if="filteredCityList.length === 0" value="" disabled>
                                                    No cities found
                                                </option>
                                            </select>

                                            <hr />
                                            <label for="zoneSelect" class="form-label fw-bold">Select Zone</label>
                                            <select id="zoneSelect" class="form-select" v-model="selectedZoneId"
                                                @change="handleZoneClick(selectedZoneId)">
                                                <option value="" disabled>-- Select a zone --</option>
                                                <option v-for="zone in zoneList" :key="zone.zone_id"
                                                    :value="zone.zone_id">
                                                    {{ zone.zone_name }} (ID: {{ zone.zone_id }})
                                                </option>
                                                <option v-if="zoneList.length === 0" value="" disabled>No zones
                                                    available
                                                </option>
                                            </select>
                                            <hr />
                                            <!-- <div class="mb-3">
                                                <input type="text" class="form-control w-auto"
                                                    placeholder="Search Area..." v-model="areaSearch" />
                                            </div> -->

                                            <label for="citySelect" class="form-label fw-bold">Select
                                                Area</label>
                                            <select class="form-select" v-model="selectedAreaId"
                                                @change="handleAreaClick(selectedAreaId)">
                                                <option value="" disabled>-- Select Area --</option>
                                                <option v-for="area in filteredAreaList" :key="area.area_id"
                                                    :value="area.area_id">
                                                    {{ area.area_name }} (ID: {{ area.area_id }})
                                                    | Home Delivery: {{ area.home_delivery_available ? 'Yes' : 'No'
                                                    }}
                                                    | Pickup: {{ area.pickup_available ? 'Yes' : 'No' }}
                                                </option>
                                                <option v-if="filteredAreaList.length === 0" value="" disabled>No
                                                    areas found</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Zone & Area -->
                        <div class="card shadow-sm mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <!-- Zone -->
                                    <div class="col-6">
                                        <div class="mt-3">
                                            <label class="form-label">Pathao Delivery Charge</label>
                                            <input type="text" class="form-control" name="pathao_delivery_fee"
                                                v-model="pricePlan.price"
                                                @input="pricePlan.price = pricePlan.price.replace(/[^0-9]/g, '')" />
                                        </div>
                                    </div>
                                    <!-- Area -->
                                    <div class="col-6">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary btn-lg" @click="showModal = false">
                            Close
                        </button>
                        <button class="btn btn-success btn-lg" @click="sendToPathaoMerchant"
                            :disabled="!selectedStoreId || !selectedCity || !selectedAreaId">
                            <i class="bx bx-send me-1"></i> Send to Pathao Merchant
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<style></style>

<script>
export default {
    data() {
        return {
            // Order data
            orderstatus: '',
            orderid: '',
            customername: '',
            customeremail: '',
            customerphone: '',
            coupon_discount: 0,
            coupon_code: '',
            delivery_charge: 0,
            errorMessage: "",
            delivery_type: '',
            insertdata: {
                orderId: this.$route?.query?.orderId || '',
                orderstatus: '',
                shipper_phone_number: '',
                shipper_address: '',
            },
            orders: [],
            order_status: [],
            errors: {},
            orderDate: '',
            ordersData: '',
            loading: false,
            pricePlan: {
                price: 0,
                discount: 0,
                promo_discount: 0,
                additional_charge: 0,
                cod_percentage: 0,
                final_price: 0
            },
            pricePlanLoading: false,
            shipper_phone_number: '',
            shipper_address: '',
            // Pathao modal state
            showModal: false,
            pathaoLoading: false,
            storeList: [],
            cityList: [],
            zoneList: [],
            areaList: [],
            selectedStoreId: null,
            selectedCity: '',
            selectedZoneId: '',
            selectedAreaId: '',
            areaSearch: '',
            modalDeliveryCharge: 0,
            receiptAddress: '',
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
        // Filter city list (add your own filter logic if needed)
        filteredCityList() {
            return this.cityList;
        },
        // Filter area list based on search
        filteredAreaList() {
            if (!this.areaSearch) return this.areaList;
            return this.areaList.filter(area =>
                area.area_name.toLowerCase().includes(this.areaSearch.toLowerCase())
            );
        },
    },
    methods: {
        formatCurrency(val) {
            return '৳ ' + (Number(val) || 0).toFixed(2);
        },
        printInvoice() {
            window.print();
        },
        // ─── Update Order ───────────────────────────────────────────
        saveData() {
            const charge = Number(this.delivery_charge);

            if (!charge || charge <= 0) {
                alert("Delivery charge must be greater than 0");
                return;
            }

            if (this.loading) return;
            this.loading = true;

            const formData = new FormData();
            formData.append('orderId', this.insertdata.orderId);
            formData.append('orderstatus', this.insertdata.orderstatus);
            formData.append('shipper_phone_number', this.insertdata.shipper_phone_number);
            formData.append('shipper_address', this.insertdata.shipper_address);
            formData.append('delivery_charge', charge);

            this.$axios.post('/order/update_order_status', formData)

                .then((res) => {
                    this.success_noti && this.success_noti();
                    window.location.reload();
                    //this.$router.push('/orders/order-list');
                })

                .catch((error) => {
                    console.error("FULL ERROR:", error);
                    let message = "Something went wrong!";
                    if (error.response && error.response.data) {
                        const res = error.response.data;
                        if (res.errors) {
                            message = Object.values(res.errors)
                                .flat()
                                .join('\n');
                        }
                        else if (res.message) {
                            message = res.message;
                        }
                    }

                    alert(message); // 👉 এখন real error দেখাবে
                })

                .finally(() => {
                    this.loading = false;
                });
        },
        // ─── Load Order Details ─────────────────────────────────────
        async defaultLoading() {
            const orderId = this.$route?.query?.orderId;
            this.orderid = orderId;
            const res = await this.$axios.get(`/order/orderDetails/${orderId}`);
            this.orders = res.data.orderdata;
            this.orderstatus = res.data.orderrow;
            this.customername = res.data.customername;
            this.customeremail = res.data.customeremail;
            this.customerphone = res.data.customerphone;
            //shipper phone & address
            this.insertdata.shipper_phone_number = res.data.shipper_phone_number;
            this.insertdata.shipper_address = res.data.shipper_address;
            //end
            this.order_status = res.data.OrderStatus;
            this.orderDate = res.data.create_at;
            this.coupon_discount = res.data.coupon_discount || 0;
            this.coupon_code = res.data.coupon_code;
            this.delivery_charge = res.data.delivery_charge || 0;
            this.delivery_type = res.data.delivery_type;
            this.insertdata.orderstatus = res.data.orderstatus_id;
            // Pre-fill modal delivery charge and address
            this.modalDeliveryCharge = res.data.delivery_charge || 0;
            this.receiptAddress = res.data.address || '';
        },
        // ─── Pathao: Handle Transfer Button ────────────────────────
        async handleSendToDelivery(e) {
            e.preventDefault();
            await this.checkFirstStore();
        },
        // ─── Pathao: Check & Load Store/City Data ──────────────────
        async checkFirstStore() {
            try {
                this.pathaoLoading = true;
                const token = this.$store?.getters?.token || localStorage.getItem('token');
                const res = await this.$axios.post('/deliveryAssign/checkInitialized', {});
                const data = res.data;
                this.storeList = data.responseData?.store || [];
                this.cityList = data.responseData?.city || [];
                // Reset previous selections
                this.selectedStoreId = null;
                this.selectedCity = '';
                this.selectedZoneId = '';
                this.selectedAreaId = '';
                this.zoneList = [];
                this.areaList = [];
                this.areaSearch = '';
                this.showModal = true;
            } catch (error) {
                console.error(error);
                alert("Something went wrong! Please try again.");
            } finally {
                this.pathaoLoading = false;
            }
        },
        // ─── Pathao: City Selected → Load Zones ────────────────────
        async handleCityClick(cityId) {
            if (!cityId) return;
            this.selectedZoneId = '';
            this.selectedAreaId = '';
            this.zoneList = [];
            this.areaList = [];
            try {
                const res = await this.$axios.post('/deliveryAssign/checkZone', {
                    cityId: cityId
                });
                this.zoneList = res.data?.responseData?.zone || [];
            } catch (error) {
                console.error('Failed to load zones:', error);
                alert("Failed to load zones. Please try again.");
            }
        },
        // ─── Pathao: Zone Selected → Load Areas ────────────────────
        async handleZoneClick(zoneId) {
            //  console.log("Selected zone : " + zoneId);
            // return false; 
            this.selectedAreaId = '';
            this.areaList = [];
            try {
                const res = await this.$axios.post('/deliveryAssign/checkZoneWiseArea', {
                    zoneId: zoneId
                });
                this.areaList = res.data?.responseData?.area || [];
            } catch (error) {
                console.error('Failed to load areas:', error);
                alert("Failed to load areas. Please try again.");
            }
        },


        async handleAreaClick(areaId) {
            const store_id = this.selectedStoreId;
            const area_id = this.selectedAreaId;
            const zone_id = this.selectedZoneId;
            const city_id = this.selectedCity;
            //console.log(`Store ID: ${store_id}, Area ID: ${area_id}, Zone ID: ${zone_id}, City ID: ${city_id}`);
            try {
                const res = await this.$axios.post('/deliveryAssign/checkPricingPlanAreaWise', {
                    store_id: store_id,
                    area_id: area_id,
                    zone_id: zone_id,
                    city_id: city_id,

                });
                //console.log("respone:" + res);
                this.pricePlan = res.data.pricePlan;
                //this.areapriceing = res.data?.responseData?.area?.data || [];
            } catch (error) {
                console.error('Failed to load areas:', error);
                alert("Failed to load areas. Please try again.");
            }
        },

        // ─── Pathao: Send to Merchant ───────────────────────────────
        async sendToPathaoMerchant() {

            this.errorMessage = ""; // reset আগে

            if (!this.selectedStoreId || !this.selectedCity || !this.selectedAreaId) {
                alert("Please select store, city, and area before proceeding.");
                return;
            }

            try {
                const payload = {
                    orderId: this.insertdata.orderId,
                    order_status: Number(this.insertdata.orderstatus),
                    store_id: this.selectedStoreId,
                    city_id: this.selectedCity,
                    zone_id: this.selectedZoneId,
                    area_id: this.selectedAreaId,
                    delivery_charge: this.pricePlan?.price ?? 0,
                };

                await this.$axios.post('/deliveryAssign/sendToPathao', payload);

                alert("Order successfully sent to Pathao!");
                this.showModal = false;
                this.$router.push('/orders/order-list');

            } catch (error) {
                let message = "Failed to send to Pathao.";

                if (error.response?.data) {
                    const res = error.response.data;

                    if (res.error) {
                        try {
                            // 👉 "Pathao create order failed (422): {...}" থেকে JSON part আলাদা করা
                            const jsonStart = res.error.indexOf('{');
                            const jsonString = res.error.substring(jsonStart);

                            const parsed = JSON.parse(jsonString);

                            if (parsed.errors) {
                                message = Object.values(parsed.errors)
                                    .flat()
                                    .join('\n');
                            } else {
                                message = parsed.message || message;
                            }

                        } catch (e) {
                            message = res.error;
                        }
                    }
                }

                this.errorMessage = message;
            }
        }
    },
};
</script>
