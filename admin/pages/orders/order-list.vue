<template>
    <div>
        <div class="page-wrapper">
            <div class="page-content">
                <!-- breadcrumb -->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Order List</li>
                            </ol>
                        </nav>
                    </div>
                </div>

               

                <!-- Dark Loader Overlay -->
                <div v-if="tabLoading" class="dark-loader-overlay">
                    <div class="dark-loader-content">
                        <div class="dark-spinner"></div>
                        <span>Loading...</span>
                    </div>
                </div>

                <!-- Filters -->
                <div class="card mb-3 shadow-sm">
                    <div class="card-body">
                        <div class="row g-2 align-items-end">
                            <div class="col-md-4">
                                <label class="form-label fw-semibold small">Search Order ID</label>
                                <input type="text" class="form-control" placeholder="Type order ID..."
                                    v-model="searchQuery.orderId" @input="handleSearch" />
                            </div>
                            <div class="col-md-3">
                                <label class="form-label fw-semibold small">Status</label>
                                <select v-model="searchQuery.status" class="form-select" @change="onStatusChange">
                                    <option value="">All Status</option>
                                    <option v-for="(option, index) in order_status" :key="index" :value="option.id">
                                        {{ option.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-primary w-100" type="button" @click="fetchData">
                                    <i class="bx bx-search me-1"></i> Search
                                </button>
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-outline-secondary w-100" type="button" @click="resetFilters">
                                    <i class="bx bx-reset me-1"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Loading -->
                <div v-if="loading" class="d-flex justify-content-center my-4">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
 <!-- Status Tabs -->
                <div class="status-tabs-wrapper mb-3">
                    <div class="d-flex align-items-center gap-2 flex-nowrap overflow-auto pb-1">
                        <button class="status-tab"
                            :class="{ 'active': searchQuery.status === '' }"
                            @click="setStatusFilter('')">
                            <span class="tab-label">All</span>
                            <span class="tab-count">{{ data.length }}</span>
                        </button>
                        <div class="tab-divider"></div>
                        <button v-for="(option, index) in order_status" :key="index" class="status-tab"
                            :class="{ 'active': searchQuery.status === option.id }"
                            @click="setStatusFilter(option.id)">
                            <span class="tab-dot" :style="{ background: getStatusColor(option.name) }"></span>
                            <span class="tab-label">{{ option.name }}</span>
                            <span class="tab-count">{{ getStatusCount(option.id) }}</span>
                        </button>
                    </div>
                </div>
                <!-- Orders Table -->
                <div class="card shadow-sm" v-if="!loading">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-sm align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width:50px">#</th>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Phone</th>
                                        <th>Pathao Consignment</th>
                                        <th>Order Date</th>
                                        <th>Total</th>
                                        <th class="text-center">Status</th>
                                        <th class="text-center" style="width:200px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="paginatedData.length === 0">
                                        <td colspan="9" class="text-center text-muted py-4">
                                            <i class="bx bx-search-alt fs-1 d-block mb-2"></i>
                                            No orders found.
                                        </td>
                                    </tr>
                                </tbody>
                                <tbody v-for="(item, index) in paginatedData" :key="item.id || item.orderId">
                                        <!-- Main Row -->
                                        <tr :class="{
                                            'table-success bg-opacity-10': item.order_status == 1,
                                            'table-active': expandedOrderId === item.orderId
                                        }" style="cursor: pointer;" @click="togglePreview(item)">
                                            <td>{{ (currentPage - 1) * perPage + index + 1 }}</td>
                                            <td>
                                                <span class="fw-semibold text-primary">{{ item.orderId }}</span>
                                            </td>
                                            <td>{{ item.customer_name }}</td>
                                            <td>{{ item.customer_phone }}</td>
                                            <td>
                                                <span v-if="item.pathao_consignment_id" class="text-success fw-semibold">
                                                    {{ item.pathao_consignment_id }}
                                                    <span v-if="item.pathao_order_status" class="ms-1" style="color:#2563eb;">
                                                        ({{ item.pathao_order_status }})
                                                    </span>
                                                </span>
                                                <span v-else class="badge bg-warning text-dark">Not submitted</span>
                                            </td>
                                            <td>{{ item.placeOn }}</td>
                                            <td class="fw-bold">{{ item.total }}</td>
                                            <td class="text-center">
                                                <a href="#" @click.stop="checkPathaoStatus(item.id)" class="text-decoration-none">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        viewBox="0 0 16 16" fill="currentColor"
                                                        style="color:#6366f1; vertical-align:middle;">
                                                        <path d="M6 10.117V15l4-2v-2.883l5.447-6.336A.5.5 0 0 0 15.084 3H.916a.5.5 0 0 0-.363.817L6 10.117z" />
                                                    </svg>
                                                </a>
                                                <span class="ms-1 small">{{ item.name }}</span>
                                            </td>
                                            <td class="text-center" @click.stop>
                                                <!-- Details / Toggle Preview -->
                                                <button type="button" class="btn btn-sm me-1"
                                                    :class="expandedOrderId === item.orderId ? 'btn-danger' : 'btn-info'"
                                                    style="color:white;"
                                                    @click="togglePreview(item)">
                                                    <i class="bx" :class="expandedOrderId === item.orderId ? 'bx-x' : 'bx-show'"></i>
                                                    {{ expandedOrderId === item.orderId ? 'Close' : 'Details' }}
                                                </button>
                                                <!-- INVOICE -->
                                                <button type="button" class="btn btn-sm me-1"
                                                    style="background: linear-gradient(135deg,#3b82f6,#2563eb); color:white;"
                                                    @click="makeInvoice(item.orderId)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                        fill="currentColor" viewBox="0 0 16 16" class="me-1">
                                                        <path d="M4 4h8v1H4zm0 2h8v1H4zm0 2h5v1H4z" />
                                                    </svg>
                                                    Invoice
                                                </button>
                                                 <!-- D-NOTE -->
                                                <button type="button" class="btn btn-sm"
                                                    style="background: linear-gradient(135deg,#22c55e,#16a34a); color:white;"
                                                    @click="makedeliveryNote(item.orderId)">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                        fill="currentColor" viewBox="0 0 16 16" class="me-1">
                                                        <path d="M0 1h10v9H0zM10 4h3l3 3v3h-6z" />
                                                        <circle cx="3" cy="12" r="2" />
                                                        <circle cx="11" cy="12" r="2" />
                                                    </svg>
                                                    D-Note
                                                </button>
                                                <!-- DELETE (admin only) -->
                                                <button v-if="role_id == 1" type="button"
                                                    class="btn btn-sm btn-danger ms-1"
                                                    @click="deleteOrder(item.orderId)" title="Delete Order">
                                                    <i class="bx bx-trash"></i>
                                                </button>
                                            </td>
                                        </tr>

                                        <!-- Inline Preview Panel -->
                                        <tr v-if="expandedOrderId === item.orderId">
                                            <td colspan="9" class="p-0">
                                                <div class="order-preview-panel">
                                                    <!-- Loading -->
                                                    <div v-if="previewLoading" class="d-flex justify-content-center py-4">
                                                        <div class="spinner-border spinner-border-sm text-primary"></div>
                                                        <span class="ms-2 text-muted">Loading details...</span>
                                                    </div>

                                                    <!-- Preview Content -->
                                                    <div v-else-if="previewData">
                                                        <div class="row g-3 p-3">
                                                            <!-- Customer Info -->
                                                            <div class="col-md-4">
                                                                <div class="preview-card">
                                                                    <div class="preview-card-header">
                                                                        <i class="bx bx-user"></i> Customer Info
                                                                    </div>
                                                                    <div class="preview-card-body">
                                                                        <p><strong>Name:</strong> {{ previewData.customername }}</p>
                                                                        <p><strong>Phone:</strong> {{ previewData.customerphone }}</p>
                                                                        <p><strong>Email:</strong> {{ previewData.customeremail }}</p>
                                                                        <p><strong>Address:</strong> <span style="word-break: break-word; white-space: normal; display: inline;">{{ previewData.shipper_address || 'N/A' }}</span></p>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Order Info -->
                                                            <div class="col-md-4">
                                                                <div class="preview-card">
                                                                    <div class="preview-card-header">
                                                                        <i class="bx bx-receipt"></i> Order Info
                                                                    </div>
                                                                    <div class="preview-card-body">
                                                                        <p><strong>Order ID:</strong> #{{ previewData.orderId }}</p>
                                                                        <p><strong>Date:</strong> {{ previewData.create_at }}</p>
                                                                        <p>
                                                                            <strong>Status:</strong>
                                                                            <span class="badge ms-1" :class="getStatusClass(previewData.orderstatus)">
                                                                                {{ previewData.orderstatus }}
                                                                            </span>
                                                                        </p>
                                                                        <p><strong>Delivery Type:</strong> {{ previewData.delivery_type || 'N/A' }}</p>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Payment Summary -->
                                                            <div class="col-md-4">
                                                                <div class="preview-card">
                                                                    <div class="preview-card-header">
                                                                        <i class="bx bx-dollar"></i> Payment Summary
                                                                    </div>
                                                                    <div class="preview-card-body">
                                                                        <p><strong>Subtotal:</strong> ৳{{ formatCurrency(previewData.subtotal) }}</p>
                                                                        <p v-if="previewData.coupon_code">
                                                                            <strong>Discount ({{ previewData.coupon_code }}):</strong>
                                                                            <span class="text-danger">- ৳{{ formatCurrency(previewData.coupon_discount) }}</span>
                                                                        </p>
                                                                        <p><strong>Delivery:</strong> ৳{{ formatCurrency(previewData.delivery_charge) }}</p>
                                                                        <hr class="my-1">
                                                                        <p class="mb-0 fw-bold text-primary fs-5">
                                                                            Total: ৳{{ formatCurrency(previewData.grandTotal) }}
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Order Items Table -->
                                                        <div class="px-3 pb-3" v-if="previewData.orders && previewData.orders.length">
                                                            <div class="preview-card mb-0">
                                                                <div class="preview-card-header">
                                                                    <i class="bx bx-package"></i> Order Items
                                                                </div>
                                                                <div class="table-responsive">
                                                                    <table class="table table-bordered align-middle text-center mb-0">
                                                                        <thead class="table-light">
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th class="d-none d-sm-table-cell">Image</th>
                                                                                <th class="text-start">Product</th>
                                                                                <th>Qty</th>
                                                                                <th class="d-none d-md-table-cell">Unit Price</th>
                                                                                <th>Total</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr v-for="(order, idx) in previewData.orders" :key="idx">
                                                                                <td>{{ idx + 1 }}</td>
                                                                                <td class="d-none d-sm-table-cell">
                                                                                    <img :src="order.thumbnail_img" class="rounded" width="45" height="45" style="object-fit:cover;">
                                                                                </td>
                                                                                <td class="text-start">{{ order.product_name }}</td>
                                                                                <td><span class="badge bg-secondary">{{ order.quantity }}</span></td>
                                                                                <td class="d-none d-md-table-cell">৳{{ formatCurrency(order.price) }}</td>
                                                                                <td class="fw-bold text-primary">৳{{ formatCurrency(order.total) }}</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- Action Buttons -->
                                                        <div class="px-3 pb-3 d-flex gap-2 flex-wrap">
                                                            <button class="btn btn-sm btn-warning" @click="edit(previewData.orderId)">
                                                                <i class="bx bx-edit me-1"></i> Edit Order
                                                            </button>
                                                            <button class="btn btn-sm btn-primary" @click="makeInvoice(previewData.orderId)">
                                                                <i class="bx bx-file me-1"></i> Invoice
                                                            </button>
                                                            <button class="btn btn-sm btn-success" @click="makedeliveryNote(previewData.orderId)">
                                                                <i class="bx bx-truck me-1"></i> Delivery Note
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2" v-if="!loading">
                    <small class="text-muted">
                        Showing {{ paginationFrom }}–{{ paginationTo }} of {{ filteredData.length }} orders
                    </small>
                    <div class="d-flex align-items-center gap-1">
                        <button @click="previousPage" :disabled="currentPage === 1"
                            class="btn btn-outline-secondary btn-sm">
                            &laquo;
                        </button>
                        <template v-for="(page, pIdx) in visiblePages">
                            <span v-if="page === '...'" :key="'dot-'+pIdx" class="mx-1 text-muted">...</span>
                            <button v-else :key="'page-'+page"
                                class="btn btn-sm"
                                :class="currentPage === page ? 'btn-primary' : 'btn-outline-secondary'"
                                @click="goToPage(page)">
                                {{ page }}
                            </button>
                        </template>
                        <button @click="nextPage" :disabled="currentPage === totalPages"
                            class="btn btn-outline-secondary btn-sm">
                            &raquo;
                        </button>
                    </div>
                </div>
                <br/><br/>
            </div>
        </div>

        <!-- Pathao Status Modal -->
        <div v-if="showPathaoModal" class="modal-overlay">
            <div class="modal-box shadow-lg">
                <div class="modal-header">
                    <h5 class="mb-0">Pathao Status</h5>
                    <button class="btn-close" @click="showPathaoModal = false"></button>
                </div>
                <div class="modal-body">
                    <p><strong>Consignment ID:</strong> {{ pathaoData.consignment_id }}</p>
                    <p><strong>Merchant Order ID:</strong> {{ pathaoData.merchant_order_id }}</p>
                    <p>
                        <strong>Status:</strong>
                        <span class="badge bg-primary">{{ pathaoData.order_status }}</span>
                    </p>
                    <p><strong>Delivery Fee:</strong> ৳{{ pathaoData.delivery_fee }}</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary btn-sm" @click="showPathaoModal = false">Close</button>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
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

.order-preview-panel {
    background: linear-gradient(135deg, #f8f9ff 0%, #eef1ff 100%);
    border-top: 2px solid #4f46e5;
    animation: slideDown 0.2s ease-out;
}

@keyframes slideDown {
    from {
        opacity: 0;
        max-height: 0;
    }
    to {
        opacity: 1;
        max-height: 2000px;
    }
}

.preview-card {
    background: #fff;
    border-radius: 10px;
    border: 1px solid #e2e8f0;
    overflow: hidden;
    height: 100%;
}

.preview-card-header {
    background: linear-gradient(135deg, #4f46e5, #7c3aed);
    color: #fff;
    padding: 10px 14px;
    font-weight: 600;
    font-size: 0.9rem;
    display: flex;
    align-items: center;
    gap: 6px;
}

.preview-card-body {
    padding: 14px;
    font-size: 0.88rem;
}

.preview-card-body p {
    margin-bottom: 6px;
    word-wrap: break-word;
    overflow-wrap: break-word;
    word-break: break-word;
    white-space: normal;
    max-width: 100%;
}

.table-active {
    background-color: rgba(79, 70, 229, 0.08) !important;
}

/* Status Tabs - Lightweight Design */
.status-tabs-wrapper {
    background: #fff;
    border-radius: 10px;
    padding: 8px 14px;
    border: 1px solid #e9ecef;
    box-shadow: 0 1px 3px rgba(0,0,0,0.04);
}

.status-tab {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 12px;
    border-radius: 20px;
    border: 1px solid #e9ecef;
    background: #f8f9fa;
    color: #6c757d;
    font-size: 0.8rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.2s ease;
    white-space: nowrap;
}

.status-tab:hover {
    background: #e9ecef;
    border-color: #dee2e6;
}

.status-tab.active {
    background: linear-gradient(135deg, #4f46e5, #7c3aed);
    color: #fff;
    border-color: transparent;
    box-shadow: 0 2px 6px rgba(79, 70, 229, 0.3);
}

.status-tab .tab-dot {
    width: 7px;
    height: 7px;
    border-radius: 50%;
    flex-shrink: 0;
}

.status-tab.active .tab-dot {
    background: #fff !important;
    box-shadow: 0 0 0 2px rgba(255,255,255,0.3);
}

.status-tab .tab-label {
    line-height: 1;
}

.status-tab .tab-count {
    background: rgba(0,0,0,0.08);
    padding: 1px 6px;
    border-radius: 10px;
    font-size: 0.7rem;
    font-weight: 600;
    line-height: 1.3;
}

.status-tab.active .tab-count {
    background: rgba(255,255,255,0.25);
    color: #fff;
}

.tab-divider {
    width: 1px;
    height: 20px;
    background: #dee2e6;
    flex-shrink: 0;
}

@media (max-width: 575.98px) {
    .status-tabs-wrapper {
        padding: 6px 10px;
    }
    .status-tab {
        padding: 5px 10px;
        font-size: 0.75rem;
    }
}

/* Dark Loader Overlay */
.dark-loader-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(15, 15, 25, 0.85);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 99999;
    backdrop-filter: blur(4px);
}

.dark-loader-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 14px;
    color: #fff;
    font-size: 0.9rem;
    font-weight: 500;
    letter-spacing: 0.5px;
}

.dark-spinner {
    width: 40px;
    height: 40px;
    border: 3px solid rgba(255, 255, 255, 0.15);
    border-top-color: #8b5cf6;
    border-radius: 50%;
    animation: darkSpin 0.8s linear infinite;
}

@keyframes darkSpin {
    to { transform: rotate(360deg); }
}
</style>

<script>
import _ from 'lodash';

const STORAGE_KEY_STATUS = 'orderList_statusFilter';

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
                status: ''
            },
            currentPage: 1,
            perPage: 15,
            showPathaoModal: false,
            pathaoData: {},
            tabLoading: false,
            // Preview
            expandedOrderId: null,
            previewLoading: false,
            previewData: null,
            role_id: '',
        };
    },
    async mounted() {
        this.loadSavedStatus();
        this.fetchUserRole();
        await this.fetchData();
    },
    computed: {
        filteredData() {
            let result = this.data;
            if (this.searchQuery.orderId && this.searchQuery.orderId.trim() !== '') {
                const q = this.searchQuery.orderId.trim().toLowerCase();
                result = result.filter(item =>
                    String(item.orderId).toLowerCase().includes(q)
                );
            }
            if (this.searchQuery.status !== '' && this.searchQuery.status !== null && this.searchQuery.status !== undefined) {
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
        visiblePages() {
            const total = this.totalPages;
            const current = this.currentPage;
            if (total <= 7) {
                return Array.from({ length: total }, (_, i) => i + 1);
            }
            const pages = [];
            pages.push(1);
            if (current > 3) pages.push('...');
            const start = Math.max(2, current - 1);
            const end = Math.min(total - 1, current + 1);
            for (let i = start; i <= end; i++) pages.push(i);
            if (current < total - 2) pages.push('...');
            pages.push(total);
            return pages;
        },
    },
    watch: {
        'searchQuery.orderId'() { this.currentPage = 1; },
        'searchQuery.status'() { this.currentPage = 1; },
    },
    methods: {
        formatCurrency(val) {
            return (Number(val) || 0).toFixed(2);
        },
        fetchUserRole() {
            this.$axios.get('/auth/showProfileData').then(response => {
                this.role_id = response.data.data.role_id;
            });
        },
        async deleteOrder(orderId) {
            if (!confirm('Are you sure you want to delete this order?')) return;
            try {
                await this.$axios.post('/order/deleteOrder', { order_id: orderId });
                alert('Order deleted successfully!');
                this.fetchData();
            } catch (error) {
                console.error(error);
                alert('Failed to delete order. Please try again.');
            }
        },
        setStatusFilter(statusId) {
            this.tabLoading = true;
            this.searchQuery.status = statusId;
            this.saveStatusToStorage(statusId);
            this.currentPage = 1;
            setTimeout(() => {
                this.tabLoading = false;
            }, 400);
        },
        getStatusColor(statusName) {
            const s = (statusName || '').toLowerCase();
            if (s.includes('deliver')) return '#22c55e';
            if (s.includes('cancel')) return '#ef4444';
            if (s.includes('dispatch')) return '#3b82f6';
            if (s.includes('packed')) return '#f59e0b';
            if (s.includes('new')) return '#8b5cf6';
            return '#6c757d';
        },
        getStatusCount(statusId) {
            return this.data.filter(item => Number(item.order_status) === Number(statusId)).length;
        },
        getStatusClass(status) {
            const s = (status || '').toLowerCase();
            if (s.includes('deliver')) return 'bg-success';
            if (s.includes('cancel')) return 'bg-danger';
            if (s.includes('dispatch')) return 'bg-info text-dark';
            if (s.includes('packed')) return 'bg-warning text-dark';
            return 'bg-secondary';
        },
        // ─── localStorage: Save Status ──────────────────────
        saveStatusToStorage(value) {
            try {
                localStorage.setItem(STORAGE_KEY_STATUS, value);
            } catch (e) {
                console.warn('Failed to save status to localStorage:', e);
            }
        },
        loadSavedStatus() {
            try {
                const saved = localStorage.getItem(STORAGE_KEY_STATUS);
                if (saved !== null && saved !== '') {
                    this.searchQuery.status = isNaN(Number(saved)) ? saved : Number(saved);
                }
            } catch (e) {
                console.warn('Failed to load status from localStorage:', e);
            }
        },
        onStatusChange() {
            this.saveStatusToStorage(this.searchQuery.status);
            this.currentPage = 1;
        },
        // ─── Toggle Preview ─────────────────────────────────
        async togglePreview(item) {
            if (this.expandedOrderId === item.orderId) {
                this.expandedOrderId = null;
                this.previewData = null;
                return;
            }
            this.expandedOrderId = item.orderId;
            this.previewLoading = true;
            this.previewData = null;
            try {
                const res = await this.$axios.get(`/order/orderDetails/${item.orderId}`);
                const d = res.data;
                const orders = d.orderdata || [];
                const subtotal = orders.reduce((sum, o) => sum + Number(o.total || 0), 0);
                this.previewData = {
                    orderId: item.orderId,
                    customername: d.customername,
                    customerphone: d.customerphone,
                    customeremail: d.customeremail,
                    shipper_address: d.shipper_address,
                    create_at: d.create_at,
                    orderstatus: d.orderrow,
                    delivery_type: d.delivery_type,
                    coupon_code: d.coupon_code,
                    coupon_discount: d.coupon_discount || 0,
                    delivery_charge: d.delivery_charge || 0,
                    subtotal: subtotal,
                    grandTotal: subtotal - Number(d.coupon_discount || 0) + Number(d.delivery_charge || 0),
                    orders: orders,
                };
            } catch (error) {
                console.error('Failed to load order details:', error);
                this.previewData = null;
            } finally {
                this.previewLoading = false;
            }
        },
        // ─── API: Fetch Orders ─────────────────────────────
        async checkPathaoStatus(orderId) {
            try {
                const res = await this.$axios.get('/deliveryAssign/checkPathaoResponseOrder', {
                    params: { id: orderId }
                });
                if (res.data.success) {
                    this.pathaoData = res.data.orderResonse;
                    this.showPathaoModal = true;
                } else {
                    alert(res.data.message || "Something went wrong");
                }
            } catch (error) {
                console.error(error);
                alert(error?.response?.data?.message || "Request failed. Please try again.");
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
            this.saveStatusToStorage('');
            this.expandedOrderId = null;
            this.previewData = null;
        },
        previousPage() {
            if (this.currentPage > 1) this.currentPage--;
        },
        nextPage() {
            if (this.currentPage < this.totalPages) this.currentPage++;
        },
        goToPage(page) {
            if (page >= 1 && page <= this.totalPages) {
                this.currentPage = page;
            }
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
