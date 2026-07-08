<template>
    <div>
        <!--start page wrapper -->
        <div class="page-wrapper">
            <div class="page-content">
                <!--breadcrumb-->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/"><a href="javascript:;"><i
                                                class="bx bx-home-alt"></i></a></router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Order List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!--end breadcrumb-->
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Search Order ID"
                                        v-model="searchQuery.orderId" @input="handleSearch" />
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <select v-model="searchQuery.status" class="form-select" @change="handleSearch">
                                    <option value="">All Status</option>
                                    <option v-for="(option, index) in order_status" :key="index" :value="option.id">
                                        {{ option.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group mb-3">
                                    <button class="btn btn-primary w-100" type="button" @click="fetchData">
                                        Search
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group mb-3">
                                    <button class="btn btn-secondary w-100" type="button" @click="resetFilters">
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- Loading Spinner (Vue reactive, no jQuery) -->
                        <div v-if="loading" class="d-flex justify-content-center my-3">
                            <div class="spinner-border" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Order ID</th>
                                        <th>Pathao Consignment ID</th>
                                        <th>Order Date</th>
                                        <th>Total</th>
                                        <th class="text-center">Status</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="paginatedData.length === 0">
                                        <td colspan="6" class="text-center text-muted py-4">No orders found.</td>
                                    </tr>
                                    <tr v-for="(item, index) in paginatedData" :key="item.id || item.orderId"
                                        :class="item.order_status == 1 ? 'table-success bg-opacity-10' : ''">
                                        <td>{{ (currentPage - 1) * perPage + index + 1 }}</td>
                                        <td @click="edit(item.orderId)">{{ item.orderId }}</td>
                                        <td> <span v-if="item.pathao_consignment_id" class="text-success fw-semibold">
                                                {{ item.pathao_consignment_id }}
                                                <span v-if="item.pathao_order_status" style="color:#2563eb;">({{ item.pathao_order_status }})</span>
                                            </span>
                                            <span v-else class="bg-warning text-dark">
                                                Not submitted to Pathao
                                            </span>
                                        </td>
                                        <td>{{ item.placeOn }}</td>
                                        <td>{{ item.total }}</td>
                                        <td class="text-center">
                                            <a href="#" v-on:click="checkPathaoStatus(item.id)">
                                                Check Pathao Status
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    viewBox="0 0 16 16" fill="currentColor"
                                                    style="color:#6366f1; margin-right:6px; vertical-align:middle;">
                                                    <path
                                                        d="M6 10.117V15l4-2v-2.883l5.447-6.336A.5.5 0 0 0 15.084 3H.916a.5.5 0 0 0-.363.817L6 10.117z" />
                                                </svg>
                                            </a>
                                            || {{ item.name }}
                                        </td>
                                        <td class="text-center">
                                            <!-- EDIT -->
                                            <button type="button" class="btn btn-sm me-1"
                                                style="background: linear-gradient(135deg,#f59e0b,#f97316); color:white;"
                                                @click="edit(item.orderId)">
                                                <!-- Pencil Icon -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                    fill="currentColor" viewBox="0 0 16 16" class="me-1">
                                                    <path
                                                        d="M12.854.146a.5.5 0 0 1 .707 0l2.293 2.293a.5.5 0 0 1 0 .707l-10 10L3 14l.854-2.854 10-10zM11.207 3L13 4.793 14.793 3 13 1.207 11.207 3zM1 13.5V16h2.5l9.793-9.793-2.5-2.5L1 13.5z" />
                                                </svg>
                                                Edit
                                            </button>
                                            <!-- INVOICE -->
                                            <button type="button" class="btn btn-sm me-1"
                                                style="background: linear-gradient(135deg,#3b82f6,#2563eb); color:white;"
                                                @click="makeInvoice(item.orderId)">
                                                <!-- Invoice Icon -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                    fill="currentColor" viewBox="0 0 16 16" class="me-1">
                                                    <path d="M2 2h12v12H2z" fill="none" />
                                                    <path d="M4 4h8v1H4zm0 2h8v1H4zm0 2h5v1H4z" />
                                                </svg>
                                                Invoice
                                            </button>
                                            <!-- DELIVERY NOTE -->
                                            <button type="button" class="btn btn-sm"
                                                style="background: linear-gradient(135deg,#22c55e,#16a34a); color:white;"
                                                @click="makedeliveryNote(item.orderId)">
                                                <!-- Truck Icon -->
                                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                    fill="currentColor" viewBox="0 0 16 16" class="me-1">
                                                    <path d="M0 1h10v9H0zM10 4h3l3 3v3h-6z" />
                                                    <circle cx="3" cy="12" r="2" />
                                                    <circle cx="11" cy="12" r="2" />
                                                </svg>
                                                D-Note
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Pagination -->
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <small class="text-muted">
                                Showing {{ paginationFrom }}–{{ paginationTo }} of {{ filteredData.length }} orders
                            </small>
                            <div>
                                <button @click="previousPage" :disabled="currentPage === 1"
                                    class="btn btn-primary btn-sm me-1">
                                    &laquo;
                                </button>
                                <span class="mx-2">Page {{ currentPage }} of {{ totalPages }}</span>
                                <button @click="nextPage" :disabled="currentPage === totalPages"
                                    class="btn btn-primary btn-sm ms-1">
                                    &raquo;
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <!-- Pathao Status Modal -->
        <div v-if="showPathaoModal" class="modal-overlay">

            <div class="modal-box shadow-lg">

                <div class="modal-header">
                    <h5 class="mb-0">🚚 Pathao Status</h5>
                    <button class="btn-close" @click="showPathaoModal = false"></button>
                </div>

                <div class="modal-body">

                    <p><strong>Consignment ID:</strong> {{ pathaoData.consignment_id }}</p>
                    <p><strong>Merchant Order ID:</strong> {{ pathaoData.merchant_order_id }}</p>

                    <p>
                        <strong>Status:</strong>
                        <span class="badge bg-primary">
                            {{ pathaoData.order_status }}
                        </span>
                    </p>

                    <p><strong>Delivery Fee:</strong> ৳{{ pathaoData.delivery_fee }}</p>

                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary btn-sm" @click="showPathaoModal = false">
                        Close
                    </button>
                </div>

            </div>

        </div>
        <!--end page wrapper -->
    </div>


</template>
<style>
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.modal-box {
    background: #fff;
    width: 420px;
    border-radius: 12px;
    overflow: hidden;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    padding: 12px 16px;
    border-bottom: 1px solid #eee;
}

.modal-body {
    padding: 16px;
}

.modal-footer {
    padding: 12px 16px;
    border-top: 1px solid #eee;
    text-align: right;
}
.pagenation {
    margin-top: 10px;
}
</style>
<script>
import _ from 'lodash';
export default {
    head: {
        title: 'Order List',
    },
    data() {
        return {
            data: [],
            order_status: [],
            loading: false,
            searchQuery: {
                orderId: '',
                status: 1
            },
            currentPage: 1,
            perPage: 20,
            showPathaoModal: false,
            pathaoData: {}
        };
    },
    async mounted() {
        await this.fetchData();
    },
    computed: {
        filteredData() {
            let result = this.data;
            // ✅ FIX 1: Order ID filter
            if (this.searchQuery.orderId && this.searchQuery.orderId.trim() !== '') {
                const q = this.searchQuery.orderId.trim().toLowerCase();
                result = result.filter(item =>
                    String(item.orderId).toLowerCase().includes(q)
                );
            }
            // ✅ FIX 2: Status filter
            // Compares item.statusId (the numeric id field) against selected status id
            // Both sides cast to Number to avoid "1" !== 1 type mismatch
            if (this.searchQuery.status !== '' && this.searchQuery.status !== null) {
                result = result.filter(item =>
                    Number(item.order_status) === Number(this.searchQuery.status)
                );
            }
            return result;
        },
        totalPages() {
            return Math.max(1, Math.ceil(this.filteredData.length / this.perPage));
        },
        paginatedData() {
            const start = (this.currentPage - 1) * this.perPage;
            return _.slice(this.filteredData, start, start + this.perPage);
        },
        paginationFrom() {
            return this.filteredData.length === 0 ? 0 : (this.currentPage - 1) * this.perPage + 1;
        },
        paginationTo() {
            return Math.min(this.currentPage * this.perPage, this.filteredData.length);
        },
    },
    watch: {
        'searchQuery.orderId'() { this.currentPage = 1; },
        'searchQuery.status'() { this.currentPage = 1; },
    },
    methods: {
        async checkPathaoStatus(orderId) {
            try {
                const res = await this.$axios.get('/deliveryAssign/checkPathaoResponseOrder', {
                    params: {
                        id: orderId
                    }
                });

                console.log("response:", res.data);

                if (res.data.success) {
                    this.pathaoData = res.data.orderResonse;
                    this.showPathaoModal = true;
                } else {
                    alert(res.data.message || "Something went wrong");
                }

            } catch (error) {
                console.error(error);

                alert(
                    error?.response?.data?.message ||
                    "Request failed. Please try again."
                );
            }
        },
        async fetchData() {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/order/allOrdersAdmin`);
                this.data = (response.data.orderdata || []).reverse();
                this.order_status = response.data.OrderStatus || [];
            } catch (error) {
                console.error('Failed to load orders:', error);
            } finally {
                this.loading = false;
            }
        },
        handleSearch() {
            this.currentPage = 1;
        },
        resetFilters() {
            this.searchQuery.orderId = '';
            this.searchQuery.status = '';
            this.currentPage = 1;
        },
        previousPage() {
            if (this.currentPage > 1) this.currentPage--;
        },
        nextPage() {
            if (this.currentPage < this.totalPages) this.currentPage++;
        },
        edit(orderId) {
            this.$router.push({ path: '/orders/details', query: { orderId } });
        },
        makeInvoice(orderId) {
            this.$router.push({ path: '/orders/invoice', query: { orderId } });
        },
        makedeliveryNote(orderId) {
            this.$router.push({ path: '/orders/delivery', query: { orderId } });
        },
    },
};
</script>
 