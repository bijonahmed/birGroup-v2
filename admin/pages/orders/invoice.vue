<template>
    <div class="page-wrapper">
        <div class="page-content">

            <!-- Breadcrumb + Actions -->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3 no-print">
                <div class="ps-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item">
                                <router-link to="/"><i class="bx bx-home-alt"></i></router-link>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">
                                <router-link to="/orders/order-list">Orders</router-link>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Invoice</li>
                        </ol>
                    </nav>
                </div>
                <div class="ms-auto pe-3">
                    <button class="btn btn-outline-secondary btn-sm me-2" @click="printInvoice" :disabled="loading">
                        <i class="bx bx-printer me-1"></i> Print
                    </button>
                    <router-link to="/orders/order-list" class="btn btn-outline-dark btn-sm">
                        <i class="bx bx-arrow-back me-1"></i> Back
                    </router-link>
                </div>
            </div>

            <!-- Loading -->
            <div v-if="loading" class="text-center py-5">
                <div class="spinner-border text-info" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <p class="mt-2 text-muted">Loading invoice...</p>
            </div>

            <!-- Error -->
            <div v-else-if="error" class="alert alert-danger mx-3 no-print" role="alert">
                <i class="bx bx-error-circle me-2"></i>{{ error }}
                <button class="btn btn-sm btn-danger ms-3" @click="defaultLoading">Retry</button>
            </div>

            <!-- Invoice Content -->
            <div v-else class="row position-relative" id="invoice-print-area">

                <!-- WATERMARK -->
                <div class="inv-watermark">INVOICE</div>

                <div class="col-xl-12 mx-auto">
                    <div class="card border-0 shadow-sm print-card">
                        <div class="card-body">
                            <div class="invoice-wrapper border rounded p-3">

                                <!-- Title -->
                                <div class="text-center mb-2">
                                    <h3 class="fw-bold letter-spacing-wide mb-0">INVOICE</h3>
                                    <small class="text-muted">Original Copy</small>
                                </div>

                                <!-- Header Grid -->
                                <div class="border border-dark inv-header-box">
                                    <div class="row g-0">

                                        <!-- Company + Buyer -->
                                        <div class="col-6 border-end border-dark">
                                            <div
                                                class="p-2 border-bottom border-dark fw-bold d-flex justify-content-between">
                                                <span>{{ companyName }}</span>
                                                <span class="text-muted small">GST INVOICE</span>
                                            </div>

                                            <div class="p-2">
                                                <div class="text-muted small mb-1">Bill To</div>
                                                <div class="fw-semibold">{{ orderData.billing_name || customername }}
                                                </div>

                                                <div class="small text-muted">
                                                    <div v-if="orderData.billing_address">{{ orderData.billing_address
                                                        }}</div>
                                                    <div v-else-if="orderData.shipper_address">{{
                                                        orderData.shipper_address }}</div>

                                                    <div v-if="orderData.billing_city || orderData.billing_country">
                                                        {{ [orderData.billing_city,
                                                        orderData.billing_country].filter(Boolean).join(', ') }}
                                                    </div>

                                                    <div>{{ orderData.billing_phone_number || customerphone }}</div>
                                                    <div>{{ orderData.billing_email || customeremail }}</div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Meta -->
                                        <div class="col-6">
                                            <table class="w-100 meta-table">
                                                <tbody>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Invoice No</div>
                                                            <div class="fw-bold">{{ orderData.orderId }}</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Date</div>
                                                            <div class="fw-bold">{{ orderDate }}</div>
                                                        </td>
                                                    </tr>

                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Payment</div>
                                                            <div>{{ formatPaymentType(orderData.payment_type) }}</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Delivery</div>
                                                            <div>{{ devliveryDate || orderDate }}</div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Destination</div>
                                                            <div>{{ orderData.shipper_city || orderData.billing_city }}
                                                            </div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Reference</div>
                                                            <div>{{ orderData.orderId }}</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>

                                <!-- Items -->
                                <table class="table table-bordered border-dark mt-0 mb-0 invoice-items">
                                    <thead>
                                        <tr>
                                            <th class="text-center">#</th>
                                            <th>Description</th>
                                            <th class="text-center">Qty</th>
                                            <th class="text-end">Rate</th>
                                            <th class="text-center">Unit</th>
                                            <th class="text-end">Amount</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr v-for="(order, index) in orders" :key="index">
                                            <td class="text-center">{{ index + 1 }}</td>
                                            <td>
                                                <strong>{{ order.product_name }}</strong>
                                                <div v-if="order.size" class="text-muted small">
                                                    {{ order.size }}
                                                </div>
                                            </td>
                                            <td class="text-center">{{ order.quantity }}</td>
                                            <td class="text-end mono">
                                                {{ formatDecimal(order.last_price || order.price) }}
                                            </td>
                                            <td class="text-center">Pcs</td>
                                            <td class="text-end mono fw-semibold">
                                                {{ formatAmount(order.total) }}
                                            </td>
                                        </tr>

                                        <!-- total -->
                                        <tr class="total-row fw-bold">
                                            <td colspan="2"></td>
                                            <td class="text-center">{{ totalQuantity }}</td>
                                            <td colspan="2" class="text-end">Total</td>
                                            <td class="text-end">Tk {{ formatAmount(totalAmount) }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Summary -->
                                <div class="row g-0 border border-top-0 border-dark p-2 balance-row">
                                    <div class="col-7">
                                        <div class="label">Amount in Words</div>
                                        <div class="fw-bold fst-italic">
                                            Taka {{ numberToWords(Number(orderData.total || totalAmount)) }} Only
                                        </div>
                                    </div>

                                    <div class="col-5 text-end">
                                        <div class="d-flex justify-content-between">
                                            <span>Bill:</span>
                                            <span class="fw-bold">Tk {{ formatAmount(orderData.total || totalAmount)
                                                }}</span>
                                        </div>

                                        <div class="d-flex justify-content-between border-top pt-1 mt-1">
                                            <span>Net Payable:</span>
                                            <span class="fw-bold text-dark fs-6">
                                                Tk {{ formatAmount(orderData.total || totalAmount) }}
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Footer -->
                                <div class="row mt-3">
                                    <div class="col-8 small">
                                        <strong>Remarks:</strong><br>
                                        {{ orderData.shipper_name || customername }} ({{ orderData.shipper_phone_number
                                            || customerphone }})
                                    </div>

                                    <div class="col-4 text-end">
                                        <div class="fw-bold">{{ companyName }}</div>
                                        <div style="height:50px;"></div>
                                        <div class="border-top pt-1">Authorized Signatory</div>
                                    </div>
                                </div>

                                <div class="text-center mt-2 border-top pt-1">
                                    <small class="text-muted">Computer Generated Invoice</small>
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
    name: 'InvoiceView',

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

            MIN_ROWS: 10,
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
        fillerRowCount() {
            const needed = this.MIN_ROWS - this.orders.length
            return needed > 0 ? needed : 0
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

                this.customername = data.customername || ''
                this.customeremail = data.customeremail || ''
                this.customerphone = data.customerphone || ''

                this.orderstatus = data.orderrow || ''
                this.orderDate = data.create_at || ''
                this.devliveryDate = data.devliveryDate || ''

                this.orders = data.orderdata || []
                this.orderData = data.orderData || {}
                this.order_status = data.OrderStatus || []

                this.trackStatus.packed = data.packed_status || ''
                this.trackStatus.dispatched = data.dispatched_status || ''
                this.trackStatus.outForDelivery = data.outForDelivery_status || ''
                this.trackStatus.deliverd = data.delivered_status || ''
                this.trackStatus.canceled = data.cancel_status || ''
                this.trackStatus.returned = data.return_status || ''

            } catch (err) {
                console.error('Invoice load error:', err)
                this.error =
                    err?.response?.data?.message ||
                    err.message ||
                    'Failed to load invoice. Please try again.'
            } finally {
                this.loading = false
            }
        },

        /* ── Print ONLY #invoice-print-area ─────────────────────────────────── */
        printInvoice() {
            const invoiceEl = document.getElementById('invoice-print-area')
            if (!invoiceEl) return

            // Grab all stylesheets and <style> tags already loaded on the page
            // so Bootstrap, scoped styles, and globals all transfer correctly
            const styles = Array.from(
                document.querySelectorAll('link[rel="stylesheet"], style')
            ).map(el => el.outerHTML).join('\n')

            const printWindow = window.open('', '_blank', 'width=900,height=700')

            if (!printWindow) {
                alert('Popup blocked! Please allow popups for this site to enable printing.')
                return
            }

            printWindow.document.write(`
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Invoice</title>
    ${styles}
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #fff;
            margin: 0;
            padding: 16px;
            -webkit-print-color-adjust: exact;
            print-color-adjust: exact;
        }
        .invoice-wrapper {
            font-family: 'Segoe UI', Arial, sans-serif;
            font-size: 12.5px;
            color: #000;
            background: #fff;
            max-width: 900px;
            margin: auto;
        }
        .inv-watermark {
            position: absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(-25deg);
            font-size: 90px;
            color: rgba(0, 0, 0, 0.05);
            font-weight: bold;
            pointer-events: none;
            user-select: none;
        }
        .letter-spacing-wide { letter-spacing: 3px; }
        .meta-table td { font-size: 12px; }
        .label { font-size: 10px; color: #666; }
        .invoice-items th {
            background: #111 !important;
            color: #fff !important;
            font-size: 11px;
        }
        .invoice-items td { font-size: 12.5px; padding: 6px; }
        .invoice-items tbody tr:nth-child(even) { background: #fafafa; }
        .mono { font-family: 'Courier New', monospace; }
        .total-row { background: #f5f5f5; }
        .balance-row { background: #f9f9f9; }
        .print-card { border: none !important; box-shadow: none !important; }
        .table { width: 100%; border-collapse: collapse; }
        .table th, .table td { border: 1px solid #000; padding: 6px; }
        .text-end   { text-align: right !important; }
        .text-center { text-align: center !important; }
        @page { size: A4; margin: 10mm; }
    </style>
</head>
<body onload="window.print(); window.close();">
    ${invoiceEl.innerHTML}
</body>
</html>`)

            printWindow.document.close()
        },

        /* ── Formatting helpers ─────────────────────────────────────────────── */
        formatAmount(value) {
            const num = Number(value)
            if (isNaN(num)) return '0.00'
            return num.toLocaleString('en-IN', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2,
            })
        },

        formatDecimal(value) {
            const num = Number(value)
            if (isNaN(num)) return '0.00'
            return num.toFixed(2)
        },

        formatPaymentType(type) {
            if (!type) return ''
            const map = {
                cod: 'Cash on Delivery',
                online: 'Online Payment',
                bank: 'Bank Transfer',
                card: 'Card Payment',
            }
            return map[type.toLowerCase()] || type.replace(/_/g, ' ')
        },

        /* ── Number to Words (Bangladeshi — up to Crore) ────────────────────── */
        numberToWords(amount) {
            const num = Math.floor(Number(amount))
            if (isNaN(num) || num === 0) return 'Zero'

            const ones = [
                '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
                'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen',
                'Seventeen', 'Eighteen', 'Nineteen',
            ]
            const tens = [
                '', '', 'Twenty', 'Thirty', 'Forty', 'Fifty',
                'Sixty', 'Seventy', 'Eighty', 'Ninety',
            ]

            const toWords = (n) => {
                if (n === 0) return ''
                if (n < 20) return ones[n] + ' '
                if (n < 100) return tens[Math.floor(n / 10)] + (n % 10 ? ' ' + ones[n % 10] : '') + ' '
                if (n < 1000) return ones[Math.floor(n / 100)] + ' Hundred ' + toWords(n % 100)
                if (n < 100000) return toWords(Math.floor(n / 1000)) + 'Thousand ' + toWords(n % 1000)
                if (n < 10000000) return toWords(Math.floor(n / 100000)) + 'Lakh ' + toWords(n % 100000)
                return toWords(Math.floor(n / 10000000)) + 'Crore ' + toWords(n % 10000000)
            }

            return toWords(num).replace(/\s+/g, ' ').trim()
        },
    },
}
</script>

<style scoped>
.invoice-wrapper {
    font-family: 'Segoe UI', Arial, sans-serif;
    font-size: 12.5px;
    color: #000;
    background: #fff;
    max-width: 900px;
    margin: auto;
}

.inv-watermark {
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%) rotate(-25deg);
    font-size: 90px;
    color: rgba(0, 0, 0, 0.05);
    font-weight: bold;
    pointer-events: none;
    user-select: none;
}

.letter-spacing-wide {
    letter-spacing: 3px;
}

.meta-table td {
    font-size: 12px;
}

.label {
    font-size: 10px;
    color: #666;
}

.invoice-items th {
    background: #111;
    color: #fff;
    font-size: 11px;
}

.invoice-items td {
    font-size: 12.5px;
    padding: 6px;
}

.invoice-items tbody tr:nth-child(even) {
    background: #fafafa;
}

.mono {
    font-family: 'Courier New', monospace;
}

.total-row {
    background: #f5f5f5;
}

.balance-row {
    background: #f9f9f9;
}
</style>