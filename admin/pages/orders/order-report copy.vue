<template>
    <div>
        <div class="page-wrapper">
            <div class="page-content">

                <!-- Breadcrumb -->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-4">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item">
                                <router-link to="/"><i class="bx bx-home-alt"></i></router-link>
                            </li>
                            <li class="breadcrumb-item active">Order Report</li>
                        </ol>
                    </nav>
                </div>

                <!-- Summary Stats -->
                <div class="row g-3 mb-4" v-if="!loading && filteredData.length">
                    <div class="col-md-3">
                        <div class="stat-card">
                            <div class="stat-icon blue"><i class="bx bx-receipt"></i></div>
                            <div>
                                <div class="stat-value">{{ filteredData.length }}</div>
                                <div class="stat-label">Total Orders</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card">
                            <div class="stat-icon green"><i class="bx bx-store"></i></div>
                            <div>
                                <div class="stat-value">{{ groupedBySeller.length }}</div>
                                <div class="stat-label">Active Sellers</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card">
                            <div class="stat-icon purple"><i class="bx bx-money"></i></div>
                            <div>
                                <div class="stat-value">{{ totalSum.toLocaleString() }}</div>
                                <div class="stat-label">Total Revenue (TK)</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stat-card">
                            <div class="stat-icon orange"><i class="bx bx-trending-up"></i></div>
                            <div>
                                <div class="stat-value">{{ filteredData.length ? Math.round(totalSum /
                                    filteredData.length).toLocaleString() : 0 }}</div>
                                <div class="stat-label">Avg Order Value (TK)</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Filter Card -->
                <div class="report-card filter-card mb-4">
                    <div class="card-header-custom">
                        <i class="bx bx-filter-alt me-2"></i>
                        <span>Filter Orders</span>
                    </div>
                    <div class="card-body-custom">
                        <div class="row g-3 align-items-end">
                            <div class="col-md-2">
                                <label class="form-label-custom">From Date</label>
                                <input type="date" class="form-control form-control-custom" v-model="filters.fromDate">
                            </div>
                            <div class="col-md-2">
                                <label class="form-label-custom">To Date</label>
                                <input type="date" class="form-control form-control-custom" v-model="filters.toDate">
                            </div>
                            <div class="col-md-2">
                                <label class="form-label-custom">Seller</label>
                                <select class="form-control form-control-custom" v-model="filters.sellerId">
                                    <option value="">All Sellers</option>
                                    <option v-for="seller in allsellers" :key="seller.id" :value="seller.id">{{
                                        seller.name }}</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label-custom">Order Status</label>
                                <select class="form-control form-control-custom" v-model="filters.orderStatus">
                                    <option value="">All Statuses</option>
                                    <option v-for="status in order_status" :key="status.id" :value="status.id">{{
                                        status.name }}</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label-custom">Search</label>
                                <input type="text" class="form-control form-control-custom" v-model="searchQuery"
                                    placeholder="Order ID / Product...">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-filter w-100" @click="fetchData">
                                    <i class="bx bx-search-alt me-1"></i> Apply Filter
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Card -->
                <div class="report-card">
                    <div class="card-header-custom d-flex justify-content-between align-items-center flex-wrap gap-2">
                        <div class="d-flex align-items-center gap-2">
                            <i class="bx bx-receipt me-1"></i>
                            <span>Order Report</span>
                            <span class="record-count" v-if="!loading">{{ filteredData.length }} records</span>
                        </div>
                        <div class="d-flex align-items-center gap-2">
                            <!-- View Toggle -->
                            <div class="view-toggle">
                                <button :class="['toggle-btn', viewMode === 'flat' ? 'active' : '']"
                                    @click="viewMode = 'flat'" title="Flat Table View">
                                    <i class="bx bx-table"></i> Flat
                                </button>
                                <button :class="['toggle-btn', viewMode === 'grouped' ? 'active' : '']"
                                    @click="viewMode = 'grouped'" title="Grouped by Seller">
                                    <i class="bx bx-layer"></i> By Seller
                                </button>
                            </div>
                            <!-- Actions -->
                            <button class="btn btn-action" @click="exportCSV" title="Export CSV">
                                <i class="bx bx-download me-1"></i> CSV
                            </button>
                            <button class="btn btn-action" @click="printReport" title="Print">
                                <i class="bx bx-printer me-1"></i> Print
                            </button>
                        </div>
                    </div>

                    <div class="card-body-custom" id="printable-area">

                        <!-- Loader -->
                        <div v-if="loading" class="loader-wrap">
                            <div class="custom-spinner"></div>
                            <p class="loader-text">Loading orders...</p>
                        </div>

                        <!-- FLAT VIEW -->
                        <div v-else-if="viewMode === 'flat'">
                            <div class="table-responsive">
                                <table class="table report-table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Order ID</th>
                                            <th>Order Date</th>
                                            <th>Product Name</th>
                                            <th>Seller Name</th>
                                            <th class="text-end">Total (TK)</th>
                                            <th class="text-center">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-if="filteredData.length === 0">
                                            <td colspan="7" class="text-center no-data">
                                                <i class="bx bx-folder-open"></i>
                                                <p>No orders found</p>
                                            </td>
                                        </tr>
                                        <tr v-for="(item, index) in filteredData" :key="index">
                                            <td class="row-num">{{ index + 1 }}</td>
                                            <td class="order-id">{{ item.orderId }}</td>
                                            <td>{{ item.created_at.split('T')[0] }}</td>
                                            <td>{{ item.product_name }}</td>
                                            <td>{{ item.seller_name }}</td>
                                            <td class="text-end amount-cell">{{ Number(item.total).toLocaleString() }}
                                            </td>
                                            <td class="text-center"><span
                                                    :class="['status-badge', statusClass(item.status_name)]">{{
                                                        item.status_name }}</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="total-row" v-if="filteredData.length">
                                <span class="total-label">Grand Total</span>
                                <span class="total-amount">{{ totalSum.toLocaleString() }} TK.</span>
                            </div>
                        </div>

                        <!-- GROUPED BY SELLER VIEW -->
                        <div v-else-if="viewMode === 'grouped'">
                            <div v-if="filteredData.length === 0" class="text-center no-data py-5">
                                <i class="bx bx-folder-open"></i>
                                <p>No orders found</p>
                            </div>
                            <div v-for="(group, gIndex) in groupedBySeller" :key="gIndex" class="seller-group mb-4">
                                <!-- Seller Header -->
                                <div class="seller-header" @click="toggleGroup(gIndex)">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="seller-avatar">{{ group.sellerName.charAt(0).toUpperCase() }}</div>
                                        <div>
                                            <div class="seller-name">{{ group.sellerName }}</div>
                                            <div class="seller-meta">{{ group.orders.length }} orders &bull; {{
                                                group.subtotal.toLocaleString() }} TK.</div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center gap-3">
                                        <span class="seller-subtotal">{{ group.subtotal.toLocaleString() }} TK.</span>
                                        <i
                                            :class="['bx', collapsedGroups.includes(gIndex) ? 'bx-chevron-down' : 'bx-chevron-up', 'toggle-icon']"></i>
                                    </div>
                                </div>
                                <!-- Seller Orders Table -->
                                <div v-show="!collapsedGroups.includes(gIndex)" class="seller-table-wrap">
                                    <table class="table report-table seller-inner-table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Order ID</th>
                                                <th>Order Date</th>
                                                <th>Product Name</th>
                                                <th class="text-end">Total (TK)</th>
                                                <th class="text-center">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(item, idx) in group.orders" :key="idx">
                                                <td class="row-num">{{ idx + 1 }}</td>
                                                <td class="order-id">{{ item.orderId }}</td>
                                                <td>{{ item.created_at.split('T')[0] }}</td>
                                                <td>{{ item.product_name }}</td>
                                                <td class="text-end amount-cell">{{ Number(item.total).toLocaleString()
                                                }}</td>
                                                <td class="text-center"><span
                                                        :class="['status-badge', statusClass(item.status_name)]">{{
                                                            item.status_name }}</span></td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr class="subtotal-row">
                                                <td colspan="4" class="text-end"><strong>Subtotal</strong></td>
                                                <td class="text-end"><strong>{{ group.subtotal.toLocaleString() }}
                                                        TK.</strong></td>
                                                <td></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>

                            <!-- Grand Total -->
                            <div class="total-row mt-3" v-if="filteredData.length">
                                <span class="total-label">Grand Total ({{ groupedBySeller.length }} Sellers)</span>
                                <span class="total-amount">{{ totalSum.toLocaleString() }} TK.</span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    head: { title: "Order Report" },
    data() {
        return {
            data: [],
            order_status: [],
            allsellers: [],
            loading: false,
            viewMode: 'flat',
            collapsedGroups: [],
            searchQuery: '',
            filters: {
                fromDate: this.getDefaultFromDate(),
                toDate: this.getDefaultToDate(),
                sellerId: '',
                orderStatus: ''
            }
        };
    },
    async mounted() {
        await this.fetchData();
        await this.alleSellerList();
    },
    computed: {
        filteredData() {
            let result = this.data;
            if (this.searchQuery) {
                const q = this.searchQuery.toLowerCase();
                result = result.filter(item =>
                    (item.orderId && item.orderId.toLowerCase().includes(q)) ||
                    (item.product_name && item.product_name.toLowerCase().includes(q))
                );
            }
            return result;
        },
        totalSum() {
            return this.filteredData.reduce((sum, item) => sum + Number(item.total || 0), 0);
        },
        groupedBySeller() {
            const map = {};
            this.filteredData.forEach(item => {
                const key = item.seller_name || 'Unknown Seller';
                if (!map[key]) map[key] = { sellerName: key, orders: [], subtotal: 0 };
                map[key].orders.push(item);
                map[key].subtotal += Number(item.total || 0);
            });
            return Object.values(map).sort((a, b) => b.subtotal - a.subtotal);
        }
    },
    methods: {
        getDefaultFromDate() {
            const d = new Date();
            d.setDate(d.getDate() - 15);
            return d.toISOString().split('T')[0];
        },
        getDefaultToDate() {
            return new Date().toISOString().split('T')[0];
        },
        async fetchData() {
            this.loading = true;
            try {
                const response = await this.$axios.get('/order/orderFilterReport', {
                    params: {
                        fromDate: this.filters.fromDate,
                        toDate: this.filters.toDate,
                        sellerId: this.filters.sellerId,
                        orderStatus: this.filters.orderStatus
                    }
                });
                this.data = response.data.orderdata.reverse();
            } catch (error) {
                console.error(error);
            } finally {
                this.loading = false;
            }
        },
        async alleSellerList() {
            try {
                const response = await this.$axios.get('/unauthenticate/allsellerListadmin');
                this.allsellers = response.data.data;
                this.order_status = response.data.orderstatus;
            } catch (error) {
                console.error(error);
            }
        },
        toggleGroup(index) {
            const i = this.collapsedGroups.indexOf(index);
            if (i === -1) this.collapsedGroups.push(index);
            else this.collapsedGroups.splice(i, 1);
        },
        statusClass(status) {
            if (!status) return '';
            const s = status.toLowerCase();
            if (s.includes('deliver') || s.includes('complet')) return 'status-success';
            if (s.includes('cancel') || s.includes('reject')) return 'status-danger';
            if (s.includes('pending') || s.includes('process')) return 'status-warning';
            return 'status-default';
        },
        exportCSV() {
            const headers = ['Order ID', 'Date', 'Product Name', 'Seller Name', 'Total', 'Status'];
            const rows = this.filteredData.map(item => [
                item.orderId,
                item.created_at.split('T')[0],
                item.product_name,
                item.seller_name,
                item.total,
                item.status_name
            ]);
            const csv = [headers, ...rows].map(r => r.map(v => `"${v || ''}"`).join(',')).join('\n');
            const blob = new Blob([csv], { type: 'text/csv' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = `order-report-${this.filters.fromDate}-to-${this.filters.toDate}.csv`;
            a.click();
            URL.revokeObjectURL(url);
        },
        printReport() {
            window.print();
        }
    }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600&family=Sora:wght@600;700&display=swap');

* {
    font-family: 'DM Sans', sans-serif;
}

/* ── Stat Cards ── */
.stat-card {
    background: #fff;
    border: 1px solid #e8edf2;
    border-radius: 14px;
    padding: 18px 20px;
    display: flex;
    align-items: center;
    gap: 16px;
    box-shadow: 0 2px 10px rgba(15, 30, 60, 0.05);
    transition: transform 0.15s;
}

.stat-card:hover {
    transform: translateY(-2px);
}

.stat-icon {
    width: 46px;
    height: 46px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.3rem;
    flex-shrink: 0;
}

.stat-icon.blue {
    background: #eaf1ff;
    color: #3d6be4;
}

.stat-icon.green {
    background: #e8f9f1;
    color: #1aad68;
}

.stat-icon.purple {
    background: #f3eeff;
    color: #7c4dff;
}

.stat-icon.orange {
    background: #fff4e8;
    color: #f07b00;
}

.stat-value {
    font-family: 'Sora', sans-serif;
    font-size: 1.25rem;
    font-weight: 700;
    color: #1a2b4a;
}

.stat-label {
    font-size: 0.75rem;
    color: #8a9bb5;
    font-weight: 500;
}

/* ── Cards ── */
.report-card {
    background: #fff;
    border: 1px solid #e8edf2;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 2px 12px rgba(15, 30, 60, 0.06);
}

.card-header-custom {
    font-family: 'Sora', sans-serif;
    font-size: 0.85rem;
    font-weight: 600;
    letter-spacing: 0.03em;
    color: #1a2b4a;
    background: #f4f7fb;
    border-bottom: 1px solid #e8edf2;
    padding: 14px 22px;
    display: flex;
    align-items: center;
}

.card-body-custom {
    padding: 22px;
}

/* ── Record count ── */
.record-count {
    font-size: 0.75rem;
    font-weight: 500;
    color: #6b7c96;
    background: #eaf0f9;
    padding: 3px 10px;
    border-radius: 20px;
}

/* ── Form ── */
.form-label-custom {
    font-size: 0.75rem;
    font-weight: 600;
    color: #5a6a80;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: 5px;
    display: block;
}

.form-control-custom {
    border: 1.5px solid #dde4ef;
    border-radius: 8px;
    padding: 8px 11px;
    font-size: 0.875rem;
    color: #1a2b4a;
    background: #fafcff;
    transition: border-color 0.2s, box-shadow 0.2s;
}

.form-control-custom:focus {
    border-color: #3d6be4;
    box-shadow: 0 0 0 3px rgba(61, 107, 228, 0.1);
    background: #fff;
    outline: none;
}

/* ── Buttons ── */
.btn-filter {
    background: linear-gradient(135deg, #3d6be4, #2550c7);
    color: #fff;
    border: none;
    border-radius: 8px;
    padding: 9px 16px;
    font-size: 0.875rem;
    font-weight: 600;
    transition: transform 0.15s, box-shadow 0.15s;
}

.btn-filter:hover {
    transform: translateY(-1px);
    box-shadow: 0 5px 16px rgba(61, 107, 228, 0.3);
    color: #fff;
}

.btn-action {
    background: #fff;
    border: 1.5px solid #dde4ef;
    color: #5a6a80;
    border-radius: 8px;
    padding: 6px 13px;
    font-size: 0.8rem;
    font-weight: 600;
    transition: all 0.15s;
}

.btn-action:hover {
    border-color: #3d6be4;
    color: #3d6be4;
    background: #f0f5ff;
}

/* ── View Toggle ── */
.view-toggle {
    display: flex;
    background: #f0f3f8;
    border-radius: 8px;
    padding: 3px;
    gap: 2px;
}

.toggle-btn {
    border: none;
    background: transparent;
    font-size: 0.78rem;
    font-weight: 600;
    color: #8a9bb5;
    padding: 5px 12px;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.15s;
}

.toggle-btn.active {
    background: #fff;
    color: #3d6be4;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
}

/* ── Table ── */
.report-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    font-size: 0.875rem;
}

.report-table thead th {
    background: #f4f7fb;
    color: #5a6a80;
    font-size: 0.72rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 11px 14px;
    border-bottom: 2px solid #dde4ef;
    white-space: nowrap;
}

.report-table tbody tr {
    transition: background 0.12s;
}

.report-table tbody tr:hover {
    background: #f7f9fd;
}

.report-table tbody td {
    padding: 11px 14px;
    color: #2c3e58;
    border-bottom: 1px solid #f0f3f8;
    vertical-align: middle;
}

.row-num {
    color: #aab4c4;
    font-size: 0.75rem;
    font-weight: 600;
    width: 36px;
}

.order-id {
    font-family: 'Sora', sans-serif;
    font-size: 0.78rem;
    font-weight: 600;
    color: #3d6be4;
}

.amount-cell {
    font-weight: 600;
    color: #1a2b4a;
}

/* ── Status Badges ── */
.status-badge {
    display: inline-block;
    padding: 3px 11px;
    border-radius: 20px;
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 0.03em;
    white-space: nowrap;
}

.status-success {
    background: #e6f9f0;
    color: #1aad68;
}

.status-danger {
    background: #ffeaea;
    color: #e03b3b;
}

.status-warning {
    background: #fff4e0;
    color: #d97706;
}

.status-default {
    background: #eaf1ff;
    color: #3d6be4;
}

/* ── Total Row ── */
.total-row {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 16px;
    margin-top: 16px;
    padding: 14px 18px;
    background: linear-gradient(135deg, #f0f5ff, #eaf1ff);
    border-radius: 10px;
    border: 1px solid #d4e2fb;
}

.total-label {
    font-size: 0.8rem;
    font-weight: 600;
    color: #5a6a80;
    text-transform: uppercase;
    letter-spacing: 0.05em;
}

.total-amount {
    font-family: 'Sora', sans-serif;
    font-size: 1.2rem;
    font-weight: 700;
    color: #1e42b8;
}

/* ── Seller Grouped View ── */
.seller-group {
    border: 1px solid #e8edf2;
    border-radius: 12px;
    overflow: hidden;
}

.seller-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 20px;
    background: linear-gradient(135deg, #f4f7fb, #eef2fb);
    cursor: pointer;
    transition: background 0.15s;
    border-bottom: 1px solid #e8edf2;
}

.seller-header:hover {
    background: #e8effa;
}

.seller-avatar {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    background: linear-gradient(135deg, #3d6be4, #2550c7);
    color: #fff;
    font-family: 'Sora', sans-serif;
    font-size: 1rem;
    font-weight: 700;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}

.seller-name {
    font-family: 'Sora', sans-serif;
    font-size: 0.9rem;
    font-weight: 700;
    color: #1a2b4a;
}

.seller-meta {
    font-size: 0.75rem;
    color: #8a9bb5;
    margin-top: 2px;
}

.seller-subtotal {
    font-family: 'Sora', sans-serif;
    font-size: 0.95rem;
    font-weight: 700;
    color: #1e42b8;
}

.toggle-icon {
    font-size: 1.1rem;
    color: #8a9bb5;
    transition: transform 0.2s;
}

.seller-table-wrap {
    padding: 0;
}

.seller-inner-table {
    margin-bottom: 0;
}

.seller-inner-table thead th {
    background: #fafcff;
}

.subtotal-row td {
    background: #f4f7fb;
    border-top: 2px solid #dde4ef;
}

/* ── Loader ── */
.loader-wrap {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 60px 0;
    gap: 14px;
}

.custom-spinner {
    width: 36px;
    height: 36px;
    border: 3px solid #dde4ef;
    border-top-color: #3d6be4;
    border-radius: 50%;
    animation: spin 0.75s linear infinite;
}

@keyframes spin {
    to {
        transform: rotate(360deg);
    }
}

.loader-text {
    font-size: 0.85rem;
    color: #8a9bb5;
    margin: 0;
}

/* ── No Data ── */
.no-data {
    padding: 60px 0 !important;
    color: #aab4c4;
}

.no-data i {
    font-size: 2.5rem;
    display: block;
    margin-bottom: 8px;
}

.no-data p {
    font-size: 0.9rem;
    margin: 0;
}

/* ── Print ── */
@media print {

    .filter-card,
    .btn-filter,
    .btn-action,
    .view-toggle {
        display: none !important;
    }

    .report-card {
        box-shadow: none;
        border: 1px solid #ccc;
    }

    .stat-card {
        box-shadow: none;
    }
}
</style>