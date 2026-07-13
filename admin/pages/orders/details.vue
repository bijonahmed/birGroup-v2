<template>
    <div>
        <div class="page-wrapper">
            <div class="page-content">

                <!-- Breadcrumb -->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Order Details</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <!-- Top Header -->
                <div class="detail-header mb-3">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                        <div class="d-flex align-items-center gap-3">
                            <div class="header-icon">
                                <i class="bx bx-receipt"></i>
                            </div>
                            <div>
                                <h4 class="mb-0 text-white">Order #{{ orderid }}</h4>
                                <small class="text-white">{{ orderDate }}</small>
                            </div>
                            <span class="badge status-badge ms-2" :class="statusClass">{{ orderstatus }}</span>
                        </div>
                        <div class="d-flex gap-2 flex-wrap">
                            <button v-if="role_id == 1" class="btn btn-danger btn-sm" @click="deleteOrder">
                                <i class="bx bx-trash me-1"></i> Delete
                            </button>
                            <router-link to="/orders/order-list" class="btn btn-primary btn-sm">
                                <i class="bx bx-arrow-back me-1"></i> Back
                            </router-link>
                        </div>
                    </div>
                </div>

                <!-- Info Cards Row -->
                <div class="row g-3 mb-3">
                    <!-- Customer Card -->
                    <div class="col-12 col-lg-4">
                        <div class="info-card">
                            <div class="info-card-header">
                                <i class="bx bx-user"></i> Customer
                            </div>
                            <div class="info-card-body">
                                <div class="info-row">
                                    <span class="info-label">Name</span>
                                    <span class="info-value fw-semibold">{{ customername }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Phone</span>
                                    <span class="info-value">{{ customerphone }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Email</span>
                                    <span class="info-value text-truncate">{{ customeremail }}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Delivery Card -->
                    <div class="col-12 col-lg-4">
                        <div class="info-card">
                            <div class="info-card-header">
                                <i class="bx bx-map"></i> Delivery Info
                            </div>
                            <div class="info-card-body">
                                <div class="info-row">
                                    <span class="info-label">Type</span>
                                    <span class="info-value">{{ delivery_type || 'N/A' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Address</span>
                                    <span class="info-value text-break">{{ insertdata.shipper_address || 'N/A' }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Phone</span>
                                    <span class="info-value">{{ insertdata.shipper_phone_number || 'N/A' }}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Card -->
                    <div class="col-12 col-lg-4">
                        <div class="info-card">
                            <div class="info-card-header">
                                <i class="bx bx-dollar"></i> Payment Summary
                            </div>
                            <div class="info-card-body">
                                <div class="info-row">
                                    <span class="info-label">Subtotal</span>
                                    <span class="info-value">{{ formatCurrency(subtotalAmount) }}</span>
                                </div>
                                <div class="info-row" v-if="coupon_code">
                                    <span class="info-label">Discount ({{ coupon_code }})</span>
                                    <span class="info-value text-danger">- {{ formatCurrency(coupon_discount) }}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Delivery Charge</span>
                                    <span class="info-value">{{ formatCurrency(delivery_charge) }}</span>
                                </div>
                                <hr class="my-2">
                                <div class="info-row">
                                    <span class="info-label fw-bold">Grand Total</span>
                                    <span class="info-value fw-bold text-primary fs-5">{{ formatCurrency(grandTotal) }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order Items -->
                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-header bg-white d-flex justify-content-between align-items-center py-3">
                        <h6 class="mb-0 fw-bold"><i class="bx bx-package me-2 text-primary"></i>Order Items ({{ orders.length }})</h6>
                        <button class="btn btn-sm btn-primary" @click="showAddProductModal = true">
                            <i class="bx bx-plus me-1"></i> Add Product
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th style="width:50px">#</th>
                                    <th class="d-none d-sm-table-cell" style="width:70px">Image</th>
                                    <th class="text-start">Product</th>
                                    <th class="text-center">Qty</th>
                                    <th class="d-none d-md-table-cell text-end">Unit Price</th>
                                    <th class="text-end">Total</th>
                                    <th class="text-center" style="width:100px">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(order, index) in orders" :key="index"
                                    :class="{ 'table-light': order.cancel_status }">
                                    <td>{{ index + 1 }}</td>
                                    <td class="d-none d-sm-table-cell">
                                        <img :src="order.thumbnail_img" class="rounded" width="45" height="45" style="object-fit:cover;">
                                    </td>
                                    <td class="text-start">
                                        <span :class="{ 'text-decoration-line-through text-muted': order.cancel_status }">
                                            {{ order.product_name }}
                                        </span>
                                        <span v-if="order.cancel_status" class="badge bg-danger ms-1" style="font-size:0.65rem;">Cancelled</span>
                                    </td>
                                    <td class="text-center">
                                        <span class="badge bg-light text-dark border">{{ order.quantity }}</span>
                                    </td>
                                    <td class="d-none d-md-table-cell text-end">{{ formatCurrency(order.price) }}</td>
                                    <td class="text-end fw-bold" :class="order.cancel_status ? 'text-muted' : 'text-primary'">
                                        {{ formatCurrency(order.total) }}
                                    </td>
                                    <td class="text-center">
                                        <button v-if="!order.cancel_status" class="btn btn-outline-danger btn-sm"
                                            @click="cancelItem(order)" title="Cancel Item">
                                            <i class="bx bx-x"></i>
                                        </button>
                                        <button v-else class="btn btn-outline-success btn-sm"
                                            @click="undoCancelItem(order)" title="Restore Item">
                                            <i class="bx bx-undo"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr v-if="orders.length === 0">
                                    <td colspan="7" class="text-center text-muted py-4">
                                        <i class="bx bx-package fs-1 d-block mb-2"></i>
                                        No items in this order.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Update Order Form -->
                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-header bg-white py-3">
                        <h6 class="mb-0 fw-bold"><i class="bx bx-edit me-2 text-primary"></i>Update Order</h6>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="saveData">
                            <div class="row g-3">
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold">Recipient Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bx bx-phone"></i></span>
                                        <input type="number" class="form-control" v-model="insertdata.shipper_phone_number">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold">Recipient Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bx bx-map"></i></span>
                                        <input type="text" class="form-control" v-model="insertdata.shipper_address">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold">Delivery Charge</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bx bx-dollar"></i></span>
                                        <input type="number" class="form-control" v-model="delivery_charge">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold">Order Status</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="bx bx-select-multiple"></i></span>
                                        <select v-model="insertdata.orderstatus" class="form-select">
                                            <option v-for="(option, index) in order_status" :key="index" :value="option.id">
                                                {{ option.name }}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button class="btn btn-primary mt-3" :disabled="loading">
                                <span v-if="loading" class="spinner-border spinner-border-sm me-1"></span>
                                <i v-else class="bx bx-check me-1"></i> Update Order
                            </button>
                        </form>
                    </div>
                </div>

                <!-- Transfer to Pathao -->
                <div class="card border-0 shadow-sm mb-3">
                    <div class="card-body">
                        <form @submit.prevent="handleSendToDelivery">
                            <button class="btn btn-gradient-primary w-100 py-3 rounded-3 fw-semibold d-flex justify-content-center align-items-center gap-2"
                                type="submit" :disabled="pathaoLoading">
                                <span v-if="pathaoLoading" class="spinner-border spinner-border-sm"></span>
                                <i v-else class="bx bx-truck"></i>
                                {{ pathaoLoading ? 'Processing...' : 'Transfer to Pathao' }}
                            </button>
                        </form>
                    </div>
                </div>

                <div id="invoice-print" style="display:none"></div>
            </div>
        </div>

        <!-- ADD PRODUCT MODAL -->
        <div v-if="showAddProductModal" class="modal-overlay" @click.self="showAddProductModal = false">
            <div class="modal-box shadow-lg">
                <div class="modal-header-custom">
                    <h5 class="mb-0"><i class="bx bx-cart-add me-2"></i>Add Product</h5>
                    <button class="btn-close-custom" @click="showAddProductModal = false">
                        <i class="bx bx-x"></i>
                    </button>
                </div>
                <div class="modal-body-custom">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Search Product</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bx bx-search"></i></span>
                            <input type="text" class="form-control" v-model="productSearch"
                                placeholder="Type product name..." @input="searchProducts">
                        </div>
                    </div>

                    <div v-if="productSearching" class="text-center py-3">
                        <div class="spinner-border spinner-border-sm text-primary"></div>
                        <span class="ms-2 text-muted">Searching...</span>
                    </div>

                    <div v-if="productList.length > 0" class="product-list">
                        <div v-for="product in productList" :key="product.id" class="product-item"
                            @click="selectProduct(product)">
                            <div class="d-flex align-items-center gap-2">
                                <img :src="product.image" class="rounded" width="40" height="40" style="object-fit:cover;"
                                    v-if="product.image">
                                <div class="flex-grow-1">
                                    <div class="fw-semibold small">{{ product.name }}</div>
                                    <small class="text-muted">{{ formatCurrency(product.price) }}</small>
                                </div>
                                <i class="bx bx-plus-circle text-primary fs-5"></i>
                            </div>
                        </div>
                    </div>

                    <div v-if="selectedProduct" class="selected-product mt-3">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="fw-bold">{{ selectedProduct.name }}</div>
                                <small class="text-muted">{{ formatCurrency(selectedProduct.price) }}</small>
                            </div>
                            <button class="btn btn-sm btn-outline-danger" @click="selectedProduct = null">
                                <i class="bx bx-x"></i>
                            </button>
                        </div>
                        <div class="mt-2">
                            <label class="form-label fw-semibold small">Quantity</label>
                            <input type="number" class="form-control form-control-sm" v-model="addProductQty" min="1">
                        </div>
                    </div>
                </div>
                <div class="modal-footer-custom">
                    <button class="btn btn-secondary" @click="closeAddProductModal">Cancel</button>
                    <button class="btn btn-primary" @click="addProductToOrder"
                        :disabled="!selectedProduct || addProductQty < 1 || addingProduct">
                        <span v-if="addingProduct" class="spinner-border spinner-border-sm me-1"></span>
                        <i v-else class="bx bx-plus me-1"></i> Add to Order
                    </button>
                </div>
            </div>
        </div>

        <!-- PATHAO MODAL -->
        <div v-if="showModal" class="modal fade show d-block" tabindex="-1" style="background: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-dialog-centered modal-xl modal-fullscreen-lg-down modal-scrollable">
                <div class="modal-content rounded-4 border-0 shadow">
                    <div class="modal-header py-2 py-md-3">
                        <h5 class="modal-title fs-6 fs-md-5">
                            <i class="bx bx-truck me-2"></i>Send Request Pathao
                        </h5>
                        <button type="button" class="btn-close" @click="showModal = false"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3 d-flex flex-wrap gap-2">
                            <span class="badge bg-light text-dark border p-2">Store: {{ selectedStoreId || 'Not selected' }}</span>
                            <span class="badge bg-light text-dark border p-2">City: {{ selectedCity || 'Not selected' }}</span>
                            <span class="badge bg-light text-dark border p-2">Zone: {{ selectedZoneId || 'Not selected' }}</span>
                            <span class="badge bg-light text-dark border p-2">Area: {{ selectedAreaId || 'Not selected' }}</span>
                        </div>

                        <div class="card shadow-sm mb-3 border-primary">
                            <div class="card-header bg-primary text-white fw-bold py-2">
                                <i class="bx bx-user me-1"></i> Customer Information
                            </div>
                            <div class="card-body py-2">
                                <div class="row g-2">
                                    <div class="col-6 col-md-3">
                                        <small class="text-muted">Name</small>
                                        <div class="text-truncate">{{ customername }}</div>
                                    </div>
                                    <div class="col-6 col-md-3">
                                        <small class="text-muted">Phone</small>
                                        <div>{{ customerphone }}</div>
                                    </div>
                                    <div class="col-6 col-md-3">
                                        <small class="text-muted">Email</small>
                                        <div class="text-truncate">{{ customeremail }}</div>
                                    </div>
                                    <div class="col-6 col-md-3">
                                        <small class="text-muted">Address</small>
                                        <div style="word-break:break-word; white-space:normal;">{{ insertdata.shipper_address || 'N/A' }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div v-if="errorMessage" class="alert alert-danger">
                            <ul class="mb-0">
                                <li v-for="(line, i) in errorMessage.split('\n')" :key="i">{{ line }}</li>
                            </ul>
                        </div>

                        <div class="row g-3">
                            <div class="col-12 col-lg-6">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <h5 class="fw-bold mb-3">Store List</h5>
                                        <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
                                            <table class="table table-hover table-striped align-middle text-center mb-0">
                                                <thead class="table-primary">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Store Name</th>
                                                        <th class="d-none d-sm-table-cell">Address</th>
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
                                                        <td class="text-start d-none d-sm-table-cell">{{ item.store_address }}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div v-if="pricePlanLoading" class="d-inline-flex align-items-center ms-2 mt-2">
                                            <div class="spinner-border spinner-border-sm text-primary" role="status"></div>
                                        </div>

                                        <div v-if="!pricePlanLoading && pricePlan"
                                            class="mt-2 p-2 d-flex flex-wrap gap-1 align-items-center rounded-3"
                                            style="font-size:12px; background: linear-gradient(135deg, #f8f9ff 0%, #eef1ff 100%); border: 1px solid #d0d7ff;">
                                            <span class="text-muted">Price: <strong style="color:#4f46e5;">৳{{ pricePlan?.price ?? 0 }}</strong></span>
                                            <span class="text-muted border-start ps-2">Discount: <strong style="color:#16a34a;">৳{{ pricePlan?.discount ?? 0 }}</strong></span>
                                            <span class="text-muted border-start ps-2">Promo: <strong style="color:#d97706;">৳{{ pricePlan?.promo_discount ?? 0 }}</strong></span>
                                            <span class="text-muted border-start ps-2">Extra: <strong style="color:#dc2626;">৳{{ pricePlan?.additional_charge ?? 0 }}</strong></span>
                                            <span class="text-muted border-start ps-2">COD: <strong style="color:#0891b2;">{{ ((pricePlan?.cod_percentage ?? 0) * 100).toFixed(1) }}%</strong></span>
                                            <span class="border-start ps-2 fw-bold" style="color:#fff; background: linear-gradient(135deg, #4f46e5, #7c3aed); padding: 3px 10px; border-radius: 20px;">৳{{ pricePlan?.final_price ?? 0 }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 col-lg-6">
                                <div class="card shadow-sm h-100">
                                    <div class="card-body">
                                        <label for="citySelect" class="form-label fw-bold">Select City</label>
                                        <select id="citySelect" class="form-select" v-model="selectedCity" @change="handleCityClick(selectedCity)">
                                            <option value="" disabled>-- Select a city --</option>
                                            <option v-for="city in filteredCityList" :key="city.city_id" :value="city.city_id">
                                                {{ city.city_name }} (ID: {{ city.city_id }})
                                            </option>
                                            <option v-if="filteredCityList.length === 0" value="" disabled>No cities found</option>
                                        </select>

                                        <hr class="my-2" />
                                        <label for="zoneSelect" class="form-label fw-bold">Select Zone</label>
                                        <select id="zoneSelect" class="form-select" v-model="selectedZoneId" @change="handleZoneClick(selectedZoneId)">
                                            <option value="" disabled>-- Select a zone --</option>
                                            <option v-for="zone in zoneList" :key="zone.zone_id" :value="zone.zone_id">
                                                {{ zone.zone_name }} (ID: {{ zone.zone_id }})
                                            </option>
                                            <option v-if="zoneList.length === 0" value="" disabled>No zones available</option>
                                        </select>

                                        <hr class="my-2" />
                                        <label for="areaSelect" class="form-label fw-bold">Select Area</label>
                                        <select id="areaSelect" class="form-select" v-model="selectedAreaId" @change="handleAreaClick(selectedAreaId)">
                                            <option value="" disabled>-- Select Area --</option>
                                            <option v-for="area in filteredAreaList" :key="area.area_id" :value="area.area_id">
                                                {{ area.area_name }} (ID: {{ area.area_id }})
                                                | Home: {{ area.home_delivery_available ? 'Yes' : 'No' }}
                                                | Pickup: {{ area.pickup_available ? 'Yes' : 'No' }}
                                            </option>
                                            <option v-if="filteredAreaList.length === 0" value="" disabled>No areas found</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card shadow-sm mb-3 mt-3">
                            <div class="card-body">
                                <label class="form-label fw-bold">Pathao Delivery Charge</label>
                                <input type="text" class="form-control" name="pathao_delivery_fee"
                                    v-model="pricePlan.price" @input="pricePlan.price = pricePlan.price.replace(/[^0-9]/g, '')" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer flex-column flex-sm-row gap-2 py-2 py-md-3">
                        <button class="btn btn-secondary w-100 w-sm-auto" @click="showModal = false">Close</button>
                        <button class="btn btn-success w-100 w-sm-auto" @click="sendToPathaoMerchant"
                            :disabled="!selectedStoreId || !selectedCity || !selectedAreaId">
                            <i class="bx bx-send me-1"></i> Send to Pathao Merchant
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.detail-header {
    background: linear-gradient(135deg, #4f46e5, #7c3aed);
    border-radius: 12px;
    padding: 16px 20px;
    color: #fff;
}
.header-icon {
    background: rgba(255,255,255,0.2);
    border-radius: 10px;
    padding: 10px 12px;
    display: flex;
    align-items: center;
    font-size: 1.3rem;
}
.status-badge {
    padding: 6px 12px;
    border-radius: 20px;
    font-weight: 600;
    font-size: 0.75rem;
}

.info-card {
    background: #fff;
    border-radius: 12px;
    border: 1px solid #e9ecef;
    overflow: hidden;
    height: 100%;
}
.info-card-header {
    background: #f8f9fa;
    padding: 10px 16px;
    font-weight: 600;
    font-size: 0.85rem;
    color: #495057;
    border-bottom: 1px solid #e9ecef;
    display: flex;
    align-items: center;
    gap: 8px;
}
.info-card-body {
    padding: 14px 16px;
}
.info-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding: 6px 0;
    gap: 8px;
}
.info-row + .info-row {
    border-top: 1px solid #f0f0f0;
}
.info-label {
    color: #6c757d;
    font-size: 0.8rem;
    flex-shrink: 0;
}
.info-value {
    font-size: 0.85rem;
    text-align: right;
    word-break: break-word;
    overflow-wrap: break-word;
}

.btn-gradient-primary {
    background: linear-gradient(135deg, #4f46e5, #7c3aed);
    color: #fff;
    border: none;
    transition: all 0.3s;
}
.btn-gradient-primary:hover {
    background: linear-gradient(135deg, #4338ca, #6d28d9);
    color: #fff;
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(79,70,229,0.4);
}

/* Add Product Modal */
.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999;
    backdrop-filter: blur(4px);
}
.modal-box {
    background: #fff;
    width: 480px;
    max-width: 95vw;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 20px 60px rgba(0,0,0,0.2);
}
.modal-header-custom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 20px;
    border-bottom: 1px solid #e9ecef;
    background: #f8f9fa;
}
.modal-header-custom h5 {
    font-size: 1rem;
    font-weight: 600;
}
.btn-close-custom {
    background: none;
    border: none;
    font-size: 1.2rem;
    cursor: pointer;
    color: #6c757d;
    padding: 4px 8px;
    border-radius: 6px;
}
.btn-close-custom:hover {
    background: #e9ecef;
    color: #333;
}
.modal-body-custom {
    padding: 20px;
    max-height: 60vh;
    overflow-y: auto;
}
.modal-footer-custom {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
    padding: 14px 20px;
    border-top: 1px solid #e9ecef;
    background: #f8f9fa;
}

.product-list {
    max-height: 250px;
    overflow-y: auto;
    border: 1px solid #e9ecef;
    border-radius: 8px;
}
.product-item {
    padding: 10px 14px;
    cursor: pointer;
    border-bottom: 1px solid #f0f0f0;
    transition: background 0.15s;
}
.product-item:last-child {
    border-bottom: none;
}
.product-item:hover {
    background: #f0f4ff;
}
.selected-product {
    background: #f0f4ff;
    border: 1px solid #d0d7ff;
    border-radius: 10px;
    padding: 12px 14px;
}

@media (max-width: 575.98px) {
    .detail-header {
        padding: 12px 14px;
    }
    .header-icon {
        padding: 8px 10px;
        font-size: 1.1rem;
    }
    .detail-header h4 {
        font-size: 0.95rem;
    }
    .info-card-header {
        font-size: 0.8rem;
    }
    .info-card-body {
        padding: 10px 12px;
    }
}
</style>

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
            // Add Product
            showAddProductModal: false,
            productSearch: '',
            productSearching: false,
            productList: [],
            selectedProduct: null,
            addProductQty: 1,
            addingProduct: false,
            role_id: '',
        };
    },
    async mounted() {
        this.defaultLoading();
        this.fetchUserRole();
    },
    computed: {
        totalQuantity() {
            return this.orders.filter(o => !o.cancel_status).reduce((t, o) => t + Number(o.quantity), 0);
        },
        subtotalAmount() {
            return this.orders.filter(o => !o.cancel_status).reduce((t, o) => t + Number(o.total), 0);
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
        filteredCityList() {
            return this.cityList;
        },
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
        fetchUserRole() {
            this.$axios.get('/auth/showProfileData').then(response => {
                this.role_id = response.data.data.role_id;
            });
        },
        async deleteOrder() {
            if (!confirm('Are you sure you want to delete this order?')) return;
            try {
                await this.$axios.post('/order/deleteOrder', { order_id: this.insertdata.orderId });
                alert('Order deleted successfully!');
                this.$router.push('/orders/order-list');
            } catch (error) {
                console.error(error);
                alert('Failed to delete order. Please try again.');
            }
        },
        async cancelItem(order) {
            if (!confirm('Are you sure you want to cancel this item?')) return;
            try {
                const payload = {
                    order_id: order.order_id,
                    product_id: order.product_id,
                };
                await this.$axios.post('/order/cancelOrderItem', payload);
                alert('Item cancelled successfully!');
                this.defaultLoading();
            } catch (error) {
                console.error(error);
                alert('Failed to cancel item. Please try again.');
            }
        },
        async undoCancelItem(order) {
            if (!confirm('Are you sure you want to restore this item?')) return;
            try {
                const payload = {
                    order_id: order.order_id,
                    product_id: order.product_id,
                };
                await this.$axios.post('/order/undoCancelOrderItem', payload);
                alert('Item restored successfully!');
                this.defaultLoading();
            } catch (error) {
                console.error(error);
                alert('Failed to restore item. Please try again.');
            }
        },
        printInvoice() {
            window.print();
        },
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
                })
                .catch((error) => {
                    console.error("FULL ERROR:", error);
                    let message = "Something went wrong!";
                    if (error.response && error.response.data) {
                        const res = error.response.data;
                        if (res.errors) {
                            message = Object.values(res.errors).flat().join('\n');
                        } else if (res.message) {
                            message = res.message;
                        }
                    }
                    alert(message);
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
            this.insertdata.shipper_phone_number = res.data.shipper_phone_number;
            this.insertdata.shipper_address = res.data.shipper_address;
            this.order_status = res.data.OrderStatus;
            this.orderDate = res.data.create_at;
            this.coupon_discount = res.data.coupon_discount || 0;
            this.coupon_code = res.data.coupon_code;
            this.delivery_charge = res.data.delivery_charge || 0;
            this.delivery_type = res.data.delivery_type;
            this.insertdata.orderstatus = res.data.orderstatus_id;
            this.modalDeliveryCharge = res.data.delivery_charge || 0;
            this.receiptAddress = res.data.address || '';
        },
        // ─── Add Product ─────────────────────────────────────────
        async searchProducts() {
            if (!this.productSearch || this.productSearch.length < 2) {
                this.productList = [];
                return;
            }
            this.productSearching = true;
            try {
                const res = await this.$axios.get(`/order/searchProducts`, {
                    params: { q: this.productSearch }
                });
                this.productList = res.data.products || [];
            } catch (error) {
                console.error('Product search failed:', error);
                this.productList = [];
            } finally {
                this.productSearching = false;
            }
        },
        selectProduct(product) {
            this.selectedProduct = product;
            this.addProductQty = 1;
        },
        closeAddProductModal() {
            this.showAddProductModal = false;
            this.productSearch = '';
            this.productList = [];
            this.selectedProduct = null;
            this.addProductQty = 1;
        },
        async addProductToOrder() {
            if (!this.selectedProduct || this.addProductQty < 1) return;
            this.addingProduct = true;
            try {
                const payload = {
                    order_id: this.insertdata.orderId,
                    product_id: this.selectedProduct.id,
                    quantity: this.addProductQty,
                };
                await this.$axios.post('/order/addOrderItem', payload);
                alert('Product added successfully!');
                this.closeAddProductModal();
                this.defaultLoading();
            } catch (error) {
                console.error('Failed to add product:', error);
                let message = 'Failed to add product. Please try again.';
                if (error.response?.data?.message) {
                    message = error.response.data.message;
                }
                alert(message);
            } finally {
                this.addingProduct = false;
            }
        },
        // ─── Pathao ─────────────────────────────────────────────
        async handleSendToDelivery(e) {
            e.preventDefault();
            await this.checkFirstStore();
        },
        async checkFirstStore() {
            try {
                this.pathaoLoading = true;
                const res = await this.$axios.post('/deliveryAssign/checkInitialized', {});
                const data = res.data;
                this.storeList = data.responseData?.store || [];
                this.cityList = data.responseData?.city || [];
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
        async handleCityClick(cityId) {
            if (!cityId) return;
            this.selectedZoneId = '';
            this.selectedAreaId = '';
            this.zoneList = [];
            this.areaList = [];
            try {
                const res = await this.$axios.post('/deliveryAssign/checkZone', { cityId: cityId });
                this.zoneList = res.data?.responseData?.zone || [];
            } catch (error) {
                console.error('Failed to load zones:', error);
                alert("Failed to load zones. Please try again.");
            }
        },
        async handleZoneClick(zoneId) {
            this.selectedAreaId = '';
            this.areaList = [];
            try {
                const res = await this.$axios.post('/deliveryAssign/checkZoneWiseArea', { zoneId: zoneId });
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
            try {
                const res = await this.$axios.post('/deliveryAssign/checkPricingPlanAreaWise', {
                    store_id, area_id, zone_id, city_id,
                });
                this.pricePlan = res.data.pricePlan;
            } catch (error) {
                console.error('Failed to load areas:', error);
                alert("Failed to load areas. Please try again.");
            }
        },
        async sendToPathaoMerchant() {
            this.errorMessage = "";
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
                            const jsonStart = res.error.indexOf('{');
                            const jsonString = res.error.substring(jsonStart);
                            const parsed = JSON.parse(jsonString);
                            if (parsed.errors) {
                                message = Object.values(parsed.errors).flat().join('\n');
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
