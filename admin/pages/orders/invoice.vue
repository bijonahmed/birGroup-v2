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
                    <button class="btn btn-outline-secondary btn-sm me-2" @click="printInvoice">
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
            <div v-else class="row" id="invoice-print-area">
                <div class="col-xl-12 mx-auto">
                    <div class="card border-top border-0 border-4 border-info print-card">
                        <div class="card-body">
                            <div class="invoice-wrapper border p-4 rounded">

                                <!-- Title -->
                                <div class="text-center mb-3">
                                    <h3 class="fw-bold text-decoration-underline letter-spacing-wide">INVOICE</h3>
                                </div>

                                <!-- Header Grid -->
                                <div class="border border-dark">
                                    <div class="row g-0">

                                        <!-- Left: Company + Buyer -->
                                        <div class="col-6 border-end border-dark">
                                            <div class="p-2 border-bottom border-dark fw-bold">
                                                {{ companyName }}
                                            </div>
                                            <div class="p-2">
                                                <div class="text-muted small mb-1">Buyer (Bill to)</div>
                                                <!-- billing_name from orderData, fallback to customername -->
                                                <div class="fw-semibold">{{ orderData.billing_name || customername }}
                                                </div>
                                                <!-- full address from orderData -->
                                                <div v-if="orderData.billing_address">{{ orderData.billing_address }}
                                                </div>
                                                <div v-else-if="orderData.shipper_address">{{ orderData.shipper_address
                                                }}</div>
                                                <!-- city / country -->
                                                <div v-if="orderData.billing_city || orderData.billing_country">
                                                    {{ [orderData.billing_city,
                                                    orderData.billing_country].filter(Boolean).join(', ') }}
                                                </div>
                                                <!-- phones -->
                                                <div>{{ orderData.billing_phone_number || customerphone }}</div>
                                                <div>{{ orderData.billing_email || customeremail }}</div>
                                            </div>
                                        </div>

                                        <!-- Right: Invoice Meta -->
                                        <div class="col-6">
                                            <table class="w-100 meta-table">
                                                <tbody>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Invoice No.</div>
                                                            <div class="fw-bold">{{ orderData.orderId }}</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Dated</div>
                                                            <div class="fw-bold">{{ orderDate }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Delivery Note</div>
                                                            <div class="fw-bold">{{ orderData.orderId }}</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Mode/Terms of Payment</div>
                                                            <!-- payment_type: "cod" => display as "Cash on Delivery" -->
                                                            <div class="text-capitalize">{{
                                                                formatPaymentType(orderData.payment_type) }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark" colspan="2">
                                                            <div class="label">Reference No. &amp; Date</div>
                                                            <div class="fw-bold">{{ orderData.orderId }} &nbsp; dt. {{
                                                                orderDate }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Buyer's Order No.</div>
                                                            <div class="fw-bold">{{ orderData.orderId }}</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">&nbsp;</div>
                                                            <div class="fw-bold">{{ orderDate }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Dispatch Doc No.</div>
                                                            <div>&nbsp;</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Delivery Note Date</div>
                                                            <!-- devliveryDate has a typo in API — keep as-is -->
                                                            <div class="fw-bold">{{ devliveryDate || orderDate }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Dispatched through</div>
                                                            <div>&nbsp;</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Destination</div>
                                                            <div>{{ orderData.shipper_city || orderData.billing_city ||
                                                                '' }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr class="border-bottom border-dark">
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">Vessel/Flight No.</div>
                                                            <div>&nbsp;</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">Place of receipt by shipper:</div>
                                                            <div>{{ orderData.shipper_address || '' }}</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="p-2 border-end border-dark">
                                                            <div class="label">City/Port of Loading</div>
                                                            <div>&nbsp;</div>
                                                        </td>
                                                        <td class="p-2">
                                                            <div class="label">City/Port of Discharge</div>
                                                            <div>{{ orderData.shipper_city || orderData.shipper_country
                                                                || '' }}</div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>

                                <!-- Items Table -->
                                <!-- Mapped from response.data.orderdata[] -->
                                <table class="table table-bordered border-dark mt-0 mb-0 invoice-items">
                                    <thead>
                                        <tr>
                                            <th class="border-dark text-center" style="width:44px;">Sl No.</th>
                                            <th class="border-dark text-start">Description of Goods</th>
                                            <th class="border-dark text-center" style="width:110px;">Quantity</th>
                                            <th class="border-dark text-end" style="width:80px;">Rate</th>
                                            <th class="border-dark text-center" style="width:52px;">per</th>
                                            <th class="border-dark text-end" style="width:110px;">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- order.product_name, order.size, order.quantity, order.last_price, order.total -->
                                        <tr v-for="(order, index) in orders" :key="order.order_id || index">
                                            <td class="text-center border-dark">{{ index + 1 }}</td>
                                            <td class="border-dark fw-semibold">
                                                {{ order.product_name }}
                                                <span v-if="order.size" class="text-muted fw-normal small"> - {{
                                                    order.size }}</span>
                                            </td>
                                            <td class="text-center border-dark">{{ order.quantity }} Pcs</td>
                                            <!-- last_price is price after discount; fall back to price -->
                                            <td class="text-end border-dark">{{ formatDecimal(order.last_price ||
                                                order.price) }}</td>
                                            <td class="text-center border-dark">Pcs</td>
                                            <td class="text-end border-dark">{{ formatAmount(order.total) }}</td>
                                        </tr>

                                        <!-- Dynamic filler rows so table always has MIN_ROWS rows -->
                                        <tr v-for="n in fillerRowCount" :key="'filler-' + n" class="filler-row">
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                        </tr>

                                        <!-- Total Row -->
                                        <tr class="total-row fw-bold">
                                            <td class="border-dark" colspan="2"></td>
                                            <td class="text-center border-dark">Total {{ totalQuantity }} Pcs</td>
                                            <td class="border-dark"></td>
                                            <td class="border-dark"></td>
                                            <td class="text-end border-dark">Tk {{ formatAmount(totalAmount) }}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <!-- Amount in Words + Balance Summary -->
                                <!-- orderData.total = net total, orderData.subtotal = before discount -->
                                <div class="row g-0 border border-top-0 border-dark p-2 balance-row">
                                    <div class="col-7">
                                        <div class="label">Amount Chargeable (in words)</div>
                                        <div class="fw-bold fst-italic mt-1">
                                            Taka {{ numberToWords(Number(orderData.total || totalAmount)) }} Only
                                        </div>
                                    </div>
                                    <div class="col-5 text-end small">
                                        <div class="text-muted fst-italic mb-2">E. &amp; O.E</div>
                                        <div class="d-flex justify-content-between"
                                            v-if="orderData.subtotal && orderData.subtotal !== orderData.total">
                                            <span>Subtotal:</span>
                                            <span>Tk {{ formatAmount(orderData.subtotal) }}</span>
                                        </div>
                                        <div class="d-flex justify-content-between border-top border-dark mt-1 pt-1">
                                            <span>Bill Amt.:</span>
                                            <span class="fw-bold">Tk {{ formatAmount(orderData.total || totalAmount) }}
                                                Dr</span>
                                        </div>
                                        <div class="d-flex justify-content-between border-top border-dark mt-1 pt-1">
                                            <span>Net Balance:</span>
                                            <span class="fw-bold">Tk {{ formatAmount(orderData.total || totalAmount) }}
                                                Dr</span>
                                        </div>
                                    </div>
                                </div>

                                <!-- Remarks / Declaration / Signature -->
                                <div class="row mt-4">
                                    <div class="col-8">
                                        <div class="mb-2">
                                            <strong>Remarks:</strong><br />
                                            <!-- shipper_name + shipper_phone from orderData -->
                                            Ref: {{ orderData.shipper_name || customername }},
                                            Mob:- {{ orderData.shipper_phone_number || customerphone }}
                                        </div>
                                        <div>
                                            <strong>Declaration</strong><br />
                                            <span class="small">
                                                We declare that this invoice shows the actual price of the goods
                                                described
                                                and that all particulars are true and correct.
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-4 text-end">
                                        <div class="fw-bold">for {{ companyName }}</div>
                                        <div style="height:60px;"></div>
                                        <div class="border-top border-dark pt-2">Authorised Signatory</div>
                                    </div>
                                </div>

                                <!-- Footer -->
                                <div class="text-center mt-3 border-top border-dark pt-2">
                                    <small class="text-muted fst-italic">This is a Computer Generated Invoice</small>
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

            companyName: '',  // change to your company name or fetch from settings

            // ── Flat fields from API response ──────────────────────────────────────
            orderid: '',
            customername: '',
            customeremail: '',
            customerphone: '',
            orderstatus: '',   // data.orderrow   e.g. "Order Placed"
            orderDate: '',   // data.create_at  e.g. "31st March, 2026"
            devliveryDate: '',   // data.devliveryDate (note: API typo preserved)

            // ── Arrays / Objects from API response ─────────────────────────────────
            orders: [],    // data.orderdata   — the items array
            orderData: {},    // data.orderData   — full order object with billing/shipper/totals
            order_status: [],    // data.OrderStatus — dropdown list

            // ── Tracking statuses from API (top-level fields) ───────────────────────
            trackStatus: {
                packed: '',   // data.packed_status
                dispatched: '',   // data.dispatched_status
                outForDelivery: '',   // data.outForDelivery_status
                deliverd: '',   // data.delivered_status  (API typo preserved)
                canceled: '',   // data.cancel_status
                returned: '',   // data.return_status
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
        /* ─────────────────────────────────────────────────────────────────────────
         * defaultLoading
         * Fetches from GET /order/orderDetails/:orderId
         * Maps every field from your actual JSON response to component state.
         * ───────────────────────────────────────────────────────────────────────── */
        async defaultLoading() {
            this.loading = true
            this.error = null

            try {
                const orderId = this.$route.query.orderId
                this.orderid = orderId

                const response = await this.$axios.get(`/order/orderDetails/${orderId}`)
                const data = response.data

                // ── Customer info (top-level) ──────────────────────────────────────
                this.customername = data.customername || ''
                this.customeremail = data.customeremail || ''
                this.customerphone = data.customerphone || ''

                // ── Order info (top-level) ─────────────────────────────────────────
                this.orderstatus = data.orderrow || ''    // "Order Placed"
                this.orderDate = data.create_at || ''    // "31st March, 2026"
                this.devliveryDate = data.devliveryDate || ''    // "" in your response

                // ── Items array: data.orderdata ────────────────────────────────────
                // Each item: { order_id, orderId, product_id, product_name, size,
                //              thumbnail_img, quantity, price, discount_status,
                //              discount, vat_status, vat, last_price, total }
                this.orders = data.orderdata || []

                // ── Full order object: data.orderData ──────────────────────────────
                // Contains: id, orderId, customer_id, total, subtotal,
                //           billing_name, billing_email, billing_phone_number,
                //           billing_address, billing_country, billing_city,
                //           shipper_name, shipper_email, shipper_phone_number,
                //           shipper_address, shipper_country, shipper_city,
                //           payment_type, packed_status, dispatched_status,
                //           outForDelivery_status, delivered_status,
                //           cancel_status, return_status,
                //           created_at, updated_at, orderstatus, orderstatus_id
                this.orderData = data.orderData || {}

                // ── Status dropdown: data.OrderStatus ─────────────────────────────
                this.order_status = data.OrderStatus || []

                // ── Tracking flags (top-level in response) ─────────────────────────
                // Your response has these at root level AND inside orderData
                this.trackStatus.packed = data.packed_status || ''
                this.trackStatus.dispatched = data.dispatched_status || ''
                this.trackStatus.outForDelivery = data.outForDelivery_status || ''
                this.trackStatus.deliverd = data.delivered_status || ''  // API typo kept
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

        // "cod" → "Cash on Delivery", others just capitalise
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

        printInvoice() {
            const invoiceEl = document.getElementById('invoice-print-area')
            if (!invoiceEl) return

            const printContents = invoiceEl.innerHTML

            const printWindow = window.open('', '_blank', 'width=900,height=700')
            printWindow.document.write(`
        <!DOCTYPE html>
        <html>
          <head>
            <meta charset="utf-8" />
            <title>Invoice - ${this.orderData.orderId || ''}</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
            <style>
              * { box-sizing: border-box; margin: 0; padding: 0; }

              body {
                font-family: 'Times New Roman', Times, serif;
                font-size: 13px;
                color: #000;
                background: #fff;
                padding: 20px;
              }

              /* Remove card/col wrappers — only invoice-wrapper content matters */
              .col-xl-12, .card, .card-body { all: unset; display: block; }

              .invoice-wrapper {
                font-family: 'Times New Roman', Times, serif;
                font-size: 13px;
                color: #000;
                background: #fff;
                max-width: 100%;
                margin: 0 auto;
              }

              .letter-spacing-wide { letter-spacing: 2px; }

              .meta-table { border-collapse: collapse; width: 100%; }
              .meta-table td { vertical-align: top; font-size: 13px; }

              .label { font-size: 11px; color: #666; margin-bottom: 2px; }

              .table { width: 100%; border-collapse: collapse; }
              .table th, .table td {
                border: 1px solid #000 !important;
                padding: 5px 8px;
                font-size: 13px;
              }
              .table thead th {
                background-color: #f5f5f5 !important;
                font-weight: bold;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
              }
              .table-bordered { border: 1px solid #000 !important; }

              .border        { border: 1px solid #000 !important; }
              .border-dark   { border-color: #000 !important; }
              .border-top    { border-top: 1px solid #000 !important; }
              .border-bottom { border-bottom: 1px solid #000 !important; }
              .border-end    { border-right: 1px solid #000 !important; }
              .border-top-0  { border-top: none !important; }

              .row   { display: flex; flex-wrap: wrap; }
              .g-0   { margin: 0; }
              .col-6 { width: 50%; flex: 0 0 50%; }
              .col-7 { width: 58.333%; flex: 0 0 58.333%; }
              .col-5 { width: 41.666%; flex: 0 0 41.666%; }
              .col-4 { width: 33.333%; flex: 0 0 33.333%; }
              .col-8 { width: 66.666%; flex: 0 0 66.666%; }

              .p-2   { padding: 0.5rem; }
              .p-4   { padding: 1.5rem; }
              .mt-1  { margin-top: 0.25rem; }
              .mt-2  { margin-top: 0.5rem; }
              .mt-3  { margin-top: 1rem; }
              .mt-4  { margin-top: 1.5rem; }
              .mb-1  { margin-bottom: 0.25rem; }
              .mb-2  { margin-bottom: 0.5rem; }
              .pt-1  { padding-top: 0.25rem; }
              .pt-2  { padding-top: 0.5rem; }
              .ms-1  { margin-left: 0.25rem; }

              .text-center   { text-align: center; }
              .text-end      { text-align: right; }
              .text-start    { text-align: left; }
              .text-muted    { color: #666; }
              .text-capitalize { text-transform: capitalize; }
              .fw-bold       { font-weight: bold; }
              .fw-semibold   { font-weight: 600; }
              .fst-italic    { font-style: italic; }
              .small         { font-size: 11px; }
              .w-100         { width: 100%; }
              .h-100         { height: 100%; }
              .text-decoration-underline { text-decoration: underline; }

              .d-flex                { display: flex; }
              .justify-content-between { justify-content: space-between; }

              .filler-row td { height: 26px; }
              .total-row td  { background-color: #fafafa; }
              .balance-row   { font-size: 13px; }

              .rounded { border-radius: 4px; }

              h3 { font-size: 18px; }
              h5 { font-size: 14px; }
              p  { margin-bottom: 4px; }

              @page {
                size: A4;
                margin: 15mm;
              }
            </style>
          </head>
          <body>
            ${printContents}
          </body>
        </html>
      `)
            printWindow.document.close()
            printWindow.focus()
            setTimeout(() => {
                printWindow.print()
                printWindow.close()
            }, 500)
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
    font-family: 'Times New Roman', Times, serif;
    font-size: 13px;
    color: #000;
    background: #fff;
    max-width: 900px;
    margin: 0 auto;
}

.letter-spacing-wide {
    letter-spacing: 2px;
}

.meta-table {
    border-collapse: collapse;
}

.meta-table td {
    vertical-align: top;
    font-size: 13px;
}

.label {
    font-size: 11px;
    color: #666;
    margin-bottom: 2px;
}

.invoice-items th,
.invoice-items td {
    font-size: 13px;
    vertical-align: middle;
    padding: 5px 8px;
}

.invoice-items thead th {
    background-color: #f5f5f5;
    font-weight: bold;
}

.filler-row td {
    height: 26px;
}

.total-row td {
    background-color: #fafafa;
}

.balance-row {
    font-size: 13px;
}

/* ─── Print fallback (if popup blocked, Ctrl+P isolates invoice area) ─── */
@media print {
    * {
        visibility: hidden;
    }

    #invoice-print-area,
    #invoice-print-area * {
        visibility: visible;
    }

    #invoice-print-area {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        padding: 20px;
    }

    .no-print {
        display: none !important;
    }

    .print-card {
        border: none !important;
        box-shadow: none !important;
    }

    .invoice-wrapper {
        border: none !important;
        max-width: 100% !important;
    }

    body {
        -webkit-print-color-adjust: exact;
        print-color-adjust: exact;
    }
}
</style>