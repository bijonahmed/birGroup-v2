<template>
    <div class="page-wrapper">
        <div class="page-content">

            <!-- Breadcrumb + Actions -->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                <div class="ps-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item">
                                <NuxtLink to="/"><i class="bx bx-home-alt"></i></NuxtLink>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">
                                <NuxtLink to="/orders/order-list">Orders</NuxtLink>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Delivery Note</li>
                        </ol>
                    </nav>
                </div>
                <div class="ms-auto pe-3">
                    <button class="btn btn-outline-secondary btn-sm me-2" @click="printDeliveryNote" :disabled="loading">
                        <i class="bx bx-printer me-1"></i> Print
                    </button>
                    <NuxtLink to="/orders/order-list" class="btn btn-outline-dark btn-sm">
                        <i class="bx bx-arrow-back me-1"></i> Back
                    </NuxtLink>
                </div>
            </div>

            <!-- Loading -->
            <div v-if="loading" class="text-center py-5">
                <div class="spinner-border text-info" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2 text-muted">Loading delivery note...</p>
            </div>

            <!-- Error -->
            <div v-else-if="error" class="alert alert-danger mx-3" role="alert">
                <i class="bx bx-error-circle me-2"></i>{{ error }}
                <button class="btn btn-sm btn-danger ms-3" @click="defaultLoading">Retry</button>
            </div>

            <!-- Delivery Note Content -->
            <div v-else class="row" id="delivery-note-print-area">
                <div class="col-xl-10 mx-auto">
                    <div>
                        <div>
                            <div class="dn-wrapper">

                                <!-- Title -->
                                <div class="text-center dn-title">
                                    <strong>DELIVERY NOTE</strong>
                                </div>

                                <!-- Top Header Grid -->
                                <table class="dn-table w-100">
                                    <tbody>
                                        <!-- Row 1: Company name | Delivery Note No. | Dated -->
                                        <tr>
                                            <td class="dn-company-cell" rowspan="4">
                                                <strong>{{ companyName }}</strong>
                                            </td>
                                            <td class="dn-label-cell">Delivery Note No.</td>
                                            <td class="dn-label-cell">Dated</td>
                                        </tr>
                                        <tr>
                                            <td class="dn-value-cell"><strong>{{ orderData.deliveryNoteNo || orderData.orderId }}</strong></td>
                                            <td class="dn-value-cell"><strong>{{ formattedDate }}</strong></td>
                                        </tr>

                                        <!-- Row 2: Mode/Terms of Payment -->
                                        <tr>
                                            <td colspan="2" class="dn-label-cell">Mode/Terms of Payment</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="dn-value-cell">{{ formatPaymentType(orderData.payment_type) }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Reference Row -->
                                <table class="dn-table w-100">
                                    <tbody>
                                        <tr>
                                            <td class="dn-company-cell-spacer"></td>
                                            <td class="dn-label-cell">Reference No. &amp; Date.</td>
                                            <td class="dn-label-cell">Other References</td>
                                        </tr>
                                        <tr>
                                            <td class="dn-company-cell-spacer"></td>
                                            <td class="dn-value-cell">
                                                {{ orderData.orderId }} dt. {{ formattedDate }}
                                            </td>
                                            <td class="dn-value-cell">{{ orderData.other_references || '' }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Buyer Row -->
                                <table class="dn-table w-100">
                                    <tbody>
                                        <tr>
                                            <td class="dn-buyer-col" rowspan="6">
                                                <div class="dn-label mb-1">Buyer (Bill to)</div>
                                                <div><strong>{{ orderData.billing_name || customername }}</strong></div>
                                                <div class="small">{{ orderData.billing_address || orderData.shipper_address }}</div>
                                                <div class="small">
                                                    {{ [orderData.billing_city, orderData.billing_country].filter(Boolean).join(', ') }}
                                                </div>
                                                <div class="small">{{ orderData.billing_name || customername }}</div>
                                                <div class="small">{{ orderData.billing_phone_number || customerphone }}</div>
                                            </td>
                                            <td class="dn-label-cell">Buyer's Order No.</td>
                                            <td class="dn-label-cell">Dated</td>
                                        </tr>
                                        <tr>
                                            <td class="dn-value-cell"><strong>{{ orderData.orderId }}</strong></td>
                                            <td class="dn-value-cell"><strong>{{ formattedDate }}</strong></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="dn-label-cell">Dispatch Doc No.</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="dn-value-cell">{{ orderData.dispatch_doc_no || '' }}</td>
                                        </tr>
                                        <tr>
                                            <td class="dn-label-cell">Dispatched through</td>
                                            <td class="dn-label-cell">Destination</td>
                                        </tr>
                                        <tr>
                                            <td class="dn-value-cell">{{ orderData.dispatched_through || '' }}</td>
                                            <td class="dn-value-cell">{{ orderData.shipper_city || orderData.billing_city }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Terms of Delivery -->
                                <table class="dn-table w-100">
                                    <tbody>
                                        <tr>
                                            <td class="dn-terms-cell">
                                                <div class="dn-label">Terms of Delivery</div>
                                                <div class="dn-terms-space">{{ orderData.terms_of_delivery || '' }}</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Items Table -->
                                <table class="dn-table w-100 dn-items-table">
                                    <thead>
                                        <tr>
                                            <th class="dn-sl-col text-center">Sl<br>No.</th>
                                            <th class="text-center">Description of Goods</th>
                                            <th class="dn-qty-col text-center">Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(order, index) in orders" :key="index">
                                            <td class="text-center dn-sl-col">{{ index + 1 }}</td>
                                            <td class="dn-desc-cell">
                                                <strong>{{ order.product_name }}</strong>
                                                <span v-if="order.size" class="text-muted small ms-1">({{ order.size }})</span>
                                            </td>
                                            <td class="text-end dn-qty-col">{{ order.quantity }} {{ order.unit || 'pcs' }}</td>
                                        </tr>

                                        <!-- Filler rows to fill space like the image -->
                                        
                                    </tbody>

                                    <!-- Total Row -->
                                    <tfoot>
                                        <tr class="dn-total-row">
                                            <td colspan="2" class="text-end pe-2"><strong>Total</strong></td>
                                            <td class="text-end dn-qty-col">
                                                <strong>{{ totalQuantityWithUnit }}</strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" class="text-end dn-eoe">
                                                <em>E. &amp; O.E</em>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>

                                <!-- Signature / Footer Area -->
                                <div class="dn-footer-space"></div>

                                <!-- Remarks -->
                                <div class="dn-remarks">
                                    <strong>Remarks:</strong><br>
                                    <span v-if="orderData.remarks">{{ orderData.remarks }}</span>
                                    <span v-else>
                                        {{ orderData.shipper_name || customername }}
                                        <span v-if="orderData.shipper_phone_number || customerphone">
                                            Mob:- {{ orderData.shipper_phone_number || customerphone }}
                                        </span>
                                    </span>
                                </div>

                                <!-- Bottom Sign Row -->
                                <table class="dn-table w-100 dn-sign-table">
                                    <tbody>
                                        <tr>
                                            <td class="dn-received-cell">
                                                Recd. in Good Condition
                                            </td>
                                            <td class="dn-auth-cell">
                                                <div class="mb-1">for {{ companyName }}</div>
                                                <div class="dn-sign-space"></div>
                                                <div>Authorised Signatory</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Computer Generated -->
                                <div class="text-center dn-footer-note">
                                    This is a Computer Generated Document
                                </div>

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
    name: 'DeliveryNote',

    data() {
        return {
            loading: true,
            error: null,

            companyName: '',

            orderid: '',
            customername: '',
            customeremail: '',
            customerphone: '',
            orderstatus: '',
            orderDate: '',
            devliveryDate: '',

            orders: [],
            orderData: {},
            order_status: [],

            trackStatus: {
                packed: '',
                dispatched: '',
                outForDelivery: '',
                deliverd: '',
                canceled: '',
                returned: '',
            },

            MIN_ROWS: 12,
        }
    },

    async mounted() {
        await this.defaultLoading()
    },

    computed: {
        totalQuantity() {
            return this.orders.reduce((sum, o) => sum + Number(o.quantity || 0), 0)
        },
        totalAmount() {
            return this.orders.reduce((sum, o) => sum + Number(o.total || 0), 0)
        },
        // e.g. "24 can" — if all items share the same unit, show it; else just count
        totalQuantityWithUnit() {
            const units = [...new Set(this.orders.map(o => o.unit).filter(Boolean))]
            const unit = units.length === 1 ? units[0] : 'pcs'
            return `${this.totalQuantity} ${unit}`
        },
        fillerRowCount() {
            const needed = this.MIN_ROWS - this.orders.length
            return needed > 0 ? needed : 0
        },
        formattedDate() {
            return this.orderDate || this.devliveryDate || ''
        },
    },

    methods: {
        async defaultLoading() {
            this.loading = true
            this.error = null

            try {
                const orderId = this.$route.query.orderId
                this.orderid = orderId

                const response = await this.$axios.get(`/order/orderDetails/${orderId}`)
                const data = response.data

                this.customername  = data.customername  || ''
                this.customeremail = data.customeremail || ''
                this.customerphone = data.customerphone || ''

                this.orderstatus   = data.orderrow      || ''
                this.orderDate     = data.create_at     || ''
                this.devliveryDate = data.devliveryDate || ''

                this.orders       = data.orderdata  || []
                this.orderData    = data.orderData  || {}
                this.order_status = data.OrderStatus || []

                this.trackStatus.packed         = data.packed_status        || ''
                this.trackStatus.dispatched      = data.dispatched_status    || ''
                this.trackStatus.outForDelivery  = data.outForDelivery_status || ''
                this.trackStatus.deliverd        = data.delivered_status     || ''
                this.trackStatus.canceled        = data.cancel_status        || ''
                this.trackStatus.returned        = data.return_status        || ''

            } catch (err) {
                console.error('Delivery note load error:', err)
                this.error =
                    err?.response?.data?.message ||
                    err.message ||
                    'Failed to load delivery note. Please try again.'
            } finally {
                this.loading = false
            }
        },

        /* ── Print ONLY #delivery-note-print-area ───────────────────────────── */
        printDeliveryNote() {
            const el = document.getElementById('delivery-note-print-area')
            if (!el) return

            const styles = Array.from(
                document.querySelectorAll('link[rel="stylesheet"], style')
            ).map(node => node.outerHTML).join('\n')

            const printWindow = window.open('', '_blank', 'width=900,height=700')

            if (!printWindow) {
                alert('Popup blocked! Please allow popups for this site to enable printing.')
                return
            }

            printWindow.document.write(`
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Delivery Note</title>
    ${styles}
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            background: #fff;
            margin: 0;
            padding: 20px;
            color: #000;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
        }
        .dn-wrapper { max-width: 860px; margin: auto; }
        .dn-title {
            font-size: 15px;
            font-weight: bold;
            text-align: center;
            border: 1px solid #000;
            border-bottom: none;
            padding: 4px;
            letter-spacing: 1px;
        }
        .dn-table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #000;
            border-top: none;
        }
        .dn-table td, .dn-table th {
            border: 1px solid #000;
            padding: 4px 6px;
            font-size: 11.5px;
            vertical-align: top;
        }
        .dn-label { font-size: 10px; color: #333; }
        .dn-label-cell { font-size: 10.5px; color: #333; padding: 3px 6px !important; border-bottom: none !important; }
        .dn-value-cell { font-size: 12px; padding: 2px 6px 5px !important; }
        .dn-company-cell { width: 38%; font-size: 13px; vertical-align: top; padding: 8px !important; }
        .dn-company-cell-spacer { width: 38%; border: none !important; }
        .dn-buyer-col { width: 38%; vertical-align: top; padding: 6px !important; }
        .dn-terms-cell { padding: 4px 6px !important; height: 70px; vertical-align: top; }
        .dn-terms-space { min-height: 50px; }
        .dn-items-table thead th { background: #fff; font-weight: bold; font-size: 11.5px; text-align: center; }
        .dn-sl-col { width: 50px; }
        .dn-qty-col { width: 100px; text-align: right; }
        .dn-desc-cell { padding: 4px 8px !important; }
        .dn-filler-row td { height: 22px; }
        .dn-total-row td { border-top: 1px solid #000 !important; font-size: 12px; }
        .dn-eoe { font-style: italic; font-size: 10.5px; border: none !important; padding: 1px 4px !important; }
        .dn-footer-space { height: 60px; }
        .dn-remarks { font-size: 11px; margin: 6px 0; padding: 0 4px; }
        .dn-sign-table { border-top: 1px solid #000; margin-top: 4px; }
        .dn-received-cell { width: 50%; padding: 6px 8px !important; font-size: 11.5px; }
        .dn-auth-cell { width: 50%; text-align: right; padding: 6px 8px !important; font-size: 11.5px; }
        .dn-sign-space { height: 40px; }
        .dn-footer-note { font-size: 11px; margin-top: 8px; font-style: italic; }
        .text-end { text-align: right !important; }
        .text-center { text-align: center !important; }
        .pe-2 { padding-right: 8px; }
        .w-100 { width: 100%; }
        @page { size: A4; margin: 10mm; }
    </style>
</head>
<body onload="window.print(); window.close();">
    ${el.innerHTML}
</body>
</html>`)

            printWindow.document.close()
        },

        formatPaymentType(type) {
            if (!type) return ''
            const map = {
                cod:    'Cash on Delivery',
                online: 'Online Payment',
                bank:   'Bank Transfer',
                card:   'Card Payment',
            }
            return map[type.toLowerCase()] || type.replace(/_/g, ' ')
        },
    },
}
</script>

<style scoped>
.dn-wrapper {
    font-family: Arial, sans-serif;
    font-size: 12px;
    color: #000;
    background: #fff;
    max-width: 860px;
    margin: auto;
}

/* ── Title ──────────────────────────────────────────────────────────────── */
.dn-title {
    font-size: 15px;
    font-weight: bold;
    text-align: center;
    border: 1px solid #000;
    border-bottom: none;
    padding: 4px;
    letter-spacing: 1px;
}

/* ── All tables share the same collapsed border ─────────────────────────── */
.dn-table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #000;
    border-top: none;
}

.dn-table td,
.dn-table th {
    border: 1px solid #000;
    padding: 4px 6px;
    font-size: 11.5px;
    vertical-align: top;
}

.dn-label {
    font-size: 10px;
    color: #444;
}

.dn-label-cell {
    font-size: 10.5px;
    color: #333;
    padding: 3px 6px !important;
    border-bottom: none !important;
}

.dn-value-cell {
    font-size: 12px;
    padding: 2px 6px 6px !important;
}

/* Company name cell (tall left column in top section) */
.dn-company-cell {
    width: 38%;
    font-size: 13px;
    vertical-align: top;
    padding: 8px !important;
}

/* Invisible spacer to align reference row with right columns */
.dn-company-cell-spacer {
    width: 38%;
    border-left: 1px solid #000 !important;
    border-right: 1px solid #000 !important;
    border-top: none !important;
    border-bottom: none !important;
    background: transparent;
}

/* Buyer column */
.dn-buyer-col {
    width: 38%;
    vertical-align: top;
    padding: 6px !important;
}

/* Terms of delivery row */
.dn-terms-cell {
    padding: 4px 6px !important;
    height: 70px;
    vertical-align: top;
}

.dn-terms-space {
    min-height: 50px;
}

/* ── Items table ────────────────────────────────────────────────────────── */
.dn-items-table thead th {
    background: #fff;
    font-weight: bold;
    font-size: 11.5px;
    text-align: center;
}

.dn-sl-col  { width: 50px; }
.dn-qty-col { width: 110px; text-align: right; }

.dn-desc-cell {
    padding: 4px 8px !important;
}

.dn-filler-row td {
    height: 22px;
}

.dn-total-row td {
    border-top: 1px solid #000 !important;
    font-size: 12px;
}

.dn-eoe {
    font-style: italic;
    font-size: 10.5px;
    border: none !important;
    padding: 1px 4px !important;
    text-align: right;
}

/* ── Footer ─────────────────────────────────────────────────────────────── */
.dn-footer-space {
    height: 60px;
}

.dn-remarks {
    font-size: 11px;
    margin: 6px 0;
    padding: 0 4px;
}

.dn-sign-table {
    border-top: 1px solid #000;
    margin-top: 4px;
}

.dn-received-cell {
    width: 50%;
    padding: 6px 8px !important;
    font-size: 11.5px;
    vertical-align: top;
}

.dn-auth-cell {
    width: 50%;
    text-align: right;
    padding: 6px 8px !important;
    font-size: 11.5px;
    vertical-align: bottom;
}

.dn-sign-space {
    height: 40px;
}

.dn-footer-note {
    font-size: 11px;
    margin-top: 8px;
    font-style: italic;
    text-align: center;
}
</style>