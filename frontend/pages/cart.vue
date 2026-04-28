<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />

        <section class="main_content" style="min-height: 50vh;">
            <div class="container">
                <div class="row">

                    <!-- LEFT: Cart Items -->
                    <div class="col-xl-8 col-lg-8 col-md-12">
                        <div class="cart" v-if="itemCount !== 0">
                            <div class="side_title">
                                <h5>Cart ({{ itemCount }})</h5>
                            </div>

                            <!-- Loading indicator -->
                            <div class="loading-indicator text-center" v-if="loading">
                                <div class="lodcontainer">
                                    <center class="loader-text">Loading...</center>
                                    <img src="/loader/loader.gif" alt="Loader" />
                                </div>
                            </div>

                            <div class="card_porduct">
                                <ul>
                                    <li v-for="item in cart" :key="item.product.id">
                                        <div class="row">
                                            <div class="col-8">
                                                <div class="img_title">
                                                    <img :src="item.product.thumnail_img" class="img-fluid" alt=""
                                                        style="border:1px solid #ddd; padding:3px; border-radius:6px;">
                                                    <div>
                                                        <h1 class="mb-0">
                                                            <Nuxt-Link
                                                                :to="`/product-details/${item.product.pro_slug}`">
                                                                {{ item.product.product_name }}
                                                            </Nuxt-Link>
                                                        </h1>
                                                        <p>{{ item.product.name }}</p>
                                                        <p class="m-0" v-if="item.product.warranty_id">
                                                            Warranty: {{ item.product.warranty_name }}
                                                        </p>
                                                        <span class="mt-0 text-danger d-block"
                                                            v-if="item.product.stock_qty < 1">
                                                            Out of stock
                                                        </span>
                                                        <p class="mt-0 freeBadge" v-if="item.product.freeshopping == 1">
                                                            Free Shipping
                                                        </p>
                                                        <p class="mt-0 freeBadge" v-else>Free Shipping</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="cart_price">
                                                    <small>(Qty: {{ item.quantity }})</small> x
                                                    <strong>BDT {{ parseFloat(item.product.last_price).toFixed(2)
                                                        }}</strong>
                                                    <span style="font-size:14px;" v-if="item.product.warranty_id">
                                                        Warranty: BDT {{ item.product.warrantyamt.toFixed(2) }}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-end">
                                            <div class="me-1">
                                                <Button class="btn_cart" style="visibility:unset;"
                                                    @click="removeFromCart(item.product)">
                                                    <i class="fa-solid fa-trash-can"></i> Remove
                                                </Button>
                                            </div>
                                            <div style="display:flex; align-items:center; gap:10px;">
                                                <div class="number">
                                                    <input v-model="item.quantity" :max="item.product.stock_qty"
                                                        @change="checkqty(item.product.stock_qty, item.quantity)"
                                                        class="quantity" type="number" @keypress="allowOnlyNumbers" />
                                                </div>
                                                <Button class="btn_cart"
                                                    :disabled="item.quantity >= item.product.stock_qty"
                                                    style="visibility:unset; background-color:#0C356A; margin-top:0;"
                                                    @click="updateQuantity(item.product.id, item.quantity)">
                                                    Update
                                                </Button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <nuxt-link class="btn btn_edit" style="width:fit-content;" to="/">
                                        Continue Shopping
                                    </nuxt-link>
                                    <button class="btn_cart" style="width:fit-content;" v-if="itemCount !== 0"
                                        @click="clearCart()">
                                        Clear Cart
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Empty cart -->
                        <div class="cart d-flex justify-content-center align-items-center" style="min-height:95%;"
                            v-else>
                            <div class="blank_data text-center">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                                <p>No Data</p>
                            </div>
                        </div>
                    </div>

                    <!-- RIGHT: Cart Summary -->
                    <div class="col-xl-4 col-lg-4 col-md-12" style="position:sticky; top:60px; height:fit-content;">
                        <div class="cart_summary">
                            <div class="side_title">
                                <h5>Card Summary</h5>
                            </div>

                            <!-- ✅ Promo Code Section — top of summary -->
                            <div class="promo-box mb-3">
                                <label class="promo-label">Promo Code</label>
                                <div class="input-group">
                                    <input type="text" class="form-control promo-input" placeholder="Enter promo code"
                                        v-model="couponCode" :disabled="couponApplied"
                                        style="text-transform:uppercase;" />
                                    <button type="button" class="promo-apply-btn"
                                        @click="couponApplied ? removeCoupon() : applyCoupon()"
                                        :disabled="couponLoading" :class="couponApplied ? 'btn-remove' : 'btn-apply'">
                                        <span v-if="couponLoading">
                                            <span class="spinner-border spinner-border-sm"></span>
                                        </span>
                                        <span v-else-if="couponApplied">Remove</span>
                                        <span v-else>Apply</span>
                                    </button>
                                </div>
                                <!-- ✅ Success message -->
                                <p v-if="couponApplied" class="promo-success mt-1 mb-0">
                                    ✅ Saved BDT {{ typeof couponDiscount === 'number' ? couponDiscount.toFixed(2) : ''
                                    }}
                                </p>
                                <!-- ✅ Error message -->
                                <p v-if="couponError" class="promo-error mt-1 mb-0">
                                    ❌ {{ couponError }}
                                </p>
                            </div>

                            <!-- Price Breakdown -->
                            <div class="summary-row d-flex justify-content-between mb-1">
                                <span class="summary-label">Items Total</span>
                                <span class="summary-value">BDT {{ subtotal.toFixed(2) }}</span>
                            </div>

                            <!-- ✅ Discount row — only visible after coupon applied -->
                            <div class="summary-row d-flex justify-content-between mb-1" v-if="couponApplied">
                                <span class="summary-label text-success">Coupon Discount</span>
                                <span class="summary-value text-success">
                                    - BDT {{ typeof couponDiscount === 'number' ? couponDiscount.toFixed(2) : '' }}
                                </span>
                            </div>

                            <hr class="my-2">

                            <div class="d-flex justify-content-between mb-1">
                                <h3>Subtotal</h3>
                                <h2>BDT {{ finalSubtotal.toFixed(2) }}</h2>
                            </div>

                            <p style="font-size:12px; color:#888;">Delivery fees not included yet.</p>

                            <a class="btn_cart" style="visibility:unset; width:100%; display:block; text-align:center;"
                                @click="gotoCheckOut">
                                CheckOut (BDT {{ finalSubtotal.toFixed(2) }})
                            </a>
                        </div>

                        <div class="de_returns">
                            <h3>Returns are easy</h3>
                            <p>Free return within 15 days for Official Store items and 7 days for other eligible items.
                                <Nuxt-link to="/refund">See more</Nuxt-link>
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <div class="back_top">
            <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
        </div>
        <Footer />
        <login_popup />
    </div>
</template>

<script>
import $ from 'jquery';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';
import RecentView from '~/components/RecentView.vue';
import NavbarSecond from '../components/NavbarSecond.vue';
import login_popup from '~/components/loginCartpage.vue';

export default {
    components: {
        login_popup,
        Common_MobileSidebar,
        Common_MiniTabNavbar,
        Common_MobileSearchProduct,
        RecentView,
        NavbarSecond,
    },
    head: {
        title: 'Cart',
    },
    data() {
        return {
            loading: false,
            cart: [],
            itemCount: 0,
            subtotal: 0,
            errors: {},
            finalPrice: '',

            // ✅ Coupon state
            couponCode: '',
            couponApplied: false,
            couponLoading: false,
            couponError: '',
            couponDiscount: 0,
            coupon_id: null,
        };
    },
    computed: {
        loggedIn() {
            return this.$auth.loggedIn;
        },
        // ✅ Final subtotal after discount
        finalSubtotal() {
            if (this.couponApplied && typeof this.couponDiscount === 'number') {
                const result = this.subtotal - this.couponDiscount;
                return result > 0 ? result : 0;
            }
            return this.subtotal;
        },
    },
    mounted() {
        if (process.client) {
            this.loadCart();
            this.cartItemCount();
            this.subtotal = this.calculateSubtotal();
            $(document).ready(function () {
                $(".filter_btn").on('click', function () { $(".filter_modal").show(); });
                $(".filter_close").on('click', function () { $(".filter_modal").hide(); });
            });
        }
        this.calculateSubtotal();
    },
    methods: {

        // ✅ Apply promo code — calls API and reduces subtotal
        async applyCoupon() {
            if (!this.couponCode.trim()) {
                this.couponError = 'Please enter a promo code.';
                return;
            }

            this.couponLoading = true;
            this.couponError = '';

            try {
                console.log("workign promocode");

                const response = await this.$axios.post('/unauthenticate/couponDiscount', {
                    couponCode: this.couponCode.trim().toUpperCase(),
                    price: this.subtotal,

                });

                const couponData = response.data.coupon_data;
                this.couponDiscount = couponData.discount;
                this.coupon_id = couponData.id;

                this.couponApplied = true;
                this.couponError = '';


                // Save to sessionStorage — auto-clears when tab/browser closes
                sessionStorage.setItem('appliedCoupon', JSON.stringify({
                    coupon_id: couponData.id,
                    couponCode: couponData.promocode,
                    couponDiscount: couponData.discount,
                    originalPrice: couponData.original_price,
                    subtotal: (couponData.original_price - couponData.discount) || 0, // comma not semicolon
                }));



            } catch (error) {
                this.couponApplied = false;
                this.couponDiscount = 0;
                this.couponError = error?.response?.data?.message
                    || (error?.response?.data?.errors
                        ? Object.values(error.response.data.errors).flat().join(' ')
                        : 'Invalid or expired promo code.');
            } finally {
                this.couponLoading = false;
            }
        },

        // Remove promo code — restores original subtotal
        removeCoupon() {
            this.couponCode = '';
            this.couponApplied = false;
            this.couponDiscount = 0;
            this.couponError = '';
            this.coupon_id = null;
        },

        checkqty(sqty, s_qty) {
            if (s_qty >= sqty) {
                const Toast = Swal.mixin({
                    toast: true, position: "top-end",
                    showConfirmButton: false, timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "error", title: "You've reached the stock limit" });
            }
        },

        gotoCheckOut() {
            this.$router.push('/checkout');
        },

        openLoginModal() {
            $(".login_popup_two").fadeIn();
        },

        allowOnlyNumbers(event) {
            const charCode = event.which ? event.which : event.keyCode;
            if (String.fromCharCode(charCode).match(/[^0-9]/g)) {
                event.preventDefault();
            }
        },

        clearCart() {
            this.loading = true;
            localStorage.removeItem('cart');
            this.cart = [];
            this.cartItemCount();
            this.removeCoupon(); // ✅ also clear coupon when cart is cleared
            this.loading = false;
        },

        updateQuantity(productId, newQuantity) {
            this.loading = true;
            const index = this.cart.findIndex((item) => item.product.id === productId);
            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
                this.calculateSubtotal();

                // ✅ Re-apply coupon discount after quantity update
                if (this.couponApplied) {
                    this.couponApplied = false;
                    this.couponError = 'Cart updated — please re-apply your promo code.';
                    this.couponDiscount = 0;
                }

                const Toast = Swal.mixin({
                    toast: true, position: "top-end",
                    showConfirmButton: false, timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "success", title: "Quantity updated successfully" });
            }
            this.loading = false;
        },

        loadCart() {
            this.loading = true;
            const savedCart = localStorage.getItem('cart');
            if (savedCart) {
                this.cart = JSON.parse(savedCart);
            }
            let itemCount = 0;
            this.cart.forEach((item) => {
                if (item.product) itemCount += parseInt(item.quantity);
            });
            this.itemCount = itemCount;
            this.loading = false;
        },

        removeFromCart(product) {
            this.loading = true;
            const index = this.cart.findIndex((item) => item.product.id === product.id);
            if (index !== -1) {
                if (this.cart[index].quantity > 1) {
                    this.cart[index].quantity -= 1;
                } else {
                    this.cart.splice(index, 1);
                }
                this.saveCart();
                this.calculateSubtotal();
                this.cartItemCount();

                // ✅ Invalidate coupon when cart changes
                if (this.couponApplied) {
                    this.couponApplied = false;
                    this.couponDiscount = 0;
                    this.couponError = 'Cart changed — please re-apply your promo code.';
                }
            }
            this.loading = false;
        },

        saveCart() {
            localStorage.setItem('cart', JSON.stringify(this.cart));
        },

        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => { itemCount += parseInt(item.quantity); });
            this.itemCount = itemCount;
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);
        },

        calculateSubtotal() {
            let subtotal = 0;
            this.cart.forEach((item) => {
                const product = item.product;
                const warrAmt = parseFloat(product.warrantyamt || 0);
                const last_price = typeof product.last_price === 'string'
                    ? parseFloat(product.last_price.replace(/,/g, ''))
                    : parseFloat(product.last_price);

                if (!isNaN(item.quantity) && !isNaN(last_price)) {
                    subtotal += item.quantity * (last_price + warrAmt);
                }
            });
            this.subtotal = subtotal;
            return subtotal;
        },
    },
};
</script>

<style>
.freeBadge {
    font-size: 10px !important;
    color: #ff9901 !important;
}

/* ✅ Promo code box */
.promo-box {
    background: #f8f9fa;
    border: 1px dashed #0C356A;
    border-radius: 8px;
    padding: 12px;
}

.promo-label {
    font-size: 13px;
    font-weight: 600;
    color: #222;
    display: block;
    margin-bottom: 6px;
}

.promo-input {
    font-size: 13px;
    border: 1px solid #ddd;
    border-radius: 6px 0 0 6px !important;
    height: 38px;
}

.promo-input:focus {
    border-color: #0C356A;
    box-shadow: 0 0 0 0.1rem rgba(12, 53, 106, 0.15);
}

.promo-apply-btn {
    font-size: 13px;
    padding: 0 16px;
    height: 38px;
    border: none;
    border-radius: 0 6px 6px 0;
    cursor: pointer;
    font-weight: 500;
    transition: opacity 0.2s;
}

.promo-apply-btn:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.btn-apply {
    background: #0C356A;
    color: #fff;
}

.btn-apply:hover {
    opacity: 0.88;
}

.btn-remove {
    background: #dc3545;
    color: #fff;
}

.btn-remove:hover {
    opacity: 0.88;
}

.promo-success {
    font-size: 12px;
    color: #198754;
}

.promo-error {
    font-size: 12px;
    color: #dc3545;
}

.summary-label {
    font-size: 14px;
    color: #444;
}

.summary-value {
    font-size: 14px;
    font-weight: 500;
}
</style>
