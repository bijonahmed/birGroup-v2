<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="top_selling">
                    <div class="container-fluid d-flex justify-content-center">
                        <div class="sell_title text-center">
                            <h5 class="fw-bold mb-0">Top Selling items</h5>
                        </div>
                    </div>

                    <div class="swiper mySwiper pro_slider">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide" v-for="item in toproducts" :key="item.id">
                                <div class="product_grid text-start"
                                    style="border: 1px solid var(--color_Primary); border-radius: 8px; padding: 10px;">

                                    <nuxt-link :to="`/product-details/${item.slug}`">

                                        <!-- Image Wrapper -->
                                        <div class="img-wrapper">
                                            <!-- Skeleton shown while image loading -->
                                            <div class="img-skeleton" v-if="!imageLoaded[item.id]"></div>
                                            <!-- Actual image hidden until loaded -->
                                            <img
                                                :src="item.thumnail_img"
                                                class="img-fluid product-img"
                                                :class="{ 'img-hidden': !imageLoaded[item.id] }"
                                                @load="onImageLoad(item.id)"
                                                @error="onImageLoad(item.id)"
                                            />
                                            <span v-if="item.free_shopping == 1" class="free-delivery-badge">
                                                Free Delivery
                                            </span>
                                        </div>

                                        <!-- Text Skeleton while loading -->
                                        <template v-if="!imageLoaded[item.id]">
                                            <div class="text-skeleton title-skeleton"></div>
                                            <div class="text-skeleton price-skeleton"></div>
                                        </template>

                                        <template v-else>
                                            <p class="text-center product-name two-line" style="font-size: 16px;">
                                                {{ truncateText(item.name, 40) }}
                                            </p>

                                            <div v-if="item.discount_status == 1"
                                                class="d-flex align-items-center justify-content-center text-center">
                                                <p>Tk.{{ Number(item.last_price) }}</p>
                                                <p class="ms-1" v-if="item.discount !== 0">
                                                    <strike>Tk.{{ Number(item.price) }}</strike>
                                                    <span>{{ item.discount }}%</span>
                                                </p>
                                            </div>

                                            <div v-else-if="item.discount_status == 2"
                                                class="d-flex align-items-center justify-content-center">
                                                <p>Tk.{{ Number(item.last_price).toFixed(2) }}</p>
                                                <p class="ms-1" v-if="item.discount !== 0">
                                                    <strike>Tk.{{ Number(item.price) }}</strike>
                                                    <span>Tk.{{ Number(item.discount) }}</span>
                                                </p>
                                            </div>

                                            <div v-else class="text-center">
                                                <p>BDT {{ Number(item.last_price) }}</p>
                                            </div>
                                        </template>

                                    </nuxt-link>

                                    <!-- Rating & Button skeleton -->
                                    <template v-if="!imageLoaded[item.id]">
                                        <div class="text-skeleton rating-skeleton mx-auto mt-1"></div>
                                        <div class="text-skeleton btn-skeleton mt-2"></div>
                                    </template>

                                    <template v-else>
                                        <div class="d-flex align-items-center justify-content-center gap-2">
                                            <div class="rating">
                                                <i class="fa fa-star checked"></i>
                                                <i class="fa fa-star checked"></i>
                                                <i class="fa fa-star checked"></i>
                                                <i class="fa fa-star checked"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                        <button type="button" class="btn_cart" @click="addToCart(item.id)">
                                            Add to cart
                                        </button>
                                    </template>

                                </div>
                            </div>

                        </div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Swal from 'sweetalert2'
export default {
    data() {
        return {
            autoplayInterval: null,
            loading: false,
            toproducts: [],
            products: [],
            product: [],
            cart: [],
            imageLoaded: {},  // tracks per-item image load state
        };
    },
    async mounted() {
        await this.fetchDefaultProduct();
        await this.ssliderTest();
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
    },

    methods: {
        // Called when each image finishes loading (or errors)
        onImageLoad(id) {
            this.$set(this.imageLoaded, id, true);
        },

        ssliderTest() {
            const swiper = new Swiper('.pro_slider', {
                slidesPerView: 5,
                breakpoints: {
                    0:   { slidesPerView: 2 },
                    320: { slidesPerView: 2 },
                    480: { slidesPerView: 3 },
                    640: { slidesPerView: 3 },
                    768: { slidesPerView: 4 },
                    992: { slidesPerView: 5 },
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
            });
        },

        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => { itemCount += item.quantity; });
            this.itemCount = itemCount;
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);
        },

        updateQuantity(productId, newQuantity) {
            const index = this.cart.findIndex((item) => item.product.id === productId);
            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
                this.calculateSubtotal();
            }
        },

        addToCart(productId) {
            const productToAdd = this.products.find((product) => product.id === productId);
            const existingItem = this.cart.find((item) => item.product.id === productId);
            const Toast = Swal.mixin({
                toast: true, position: "top-end",
                showConfirmButton: false, timer: 3000, timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
            });
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                this.cart.push({ product: productToAdd, quantity: 1 });
            }
            Toast.fire({ icon: "success", title: "Product successfully Added to cart" });
            this.saveCart();
            this.cartItemCount();
            this.calculateSubtotal();
        },

        removeFromCart(product) {
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
            }
        },

        truncateText(text, limit) {
            return text.length > limit ? text.substring(0, limit) + '...' : text;
        },

        loadCart() {
            const savedCart = localStorage.getItem('cart');
            if (savedCart) { this.cart = JSON.parse(savedCart); }
        },

        saveCart() {
            this.loading = true;
            localStorage.setItem('cart', JSON.stringify(this.cart));
            setTimeout(() => { this.loading = false; }, 2000);
        },

        calculateSubtotal() { return 0; },

        async fetchDefaultProduct() {
            this.loading = true;
            await this.$axios.get(`/unauthenticate/topSellingProducts`)
                .then(response => {
                    this.toproducts = response.data;
                    this.products  = response.data;
                    this.product   = response.data;

                    // Initialize all images as not-yet-loaded
                    const state = {};
                    response.data.forEach(item => { state[item.id] = false; });
                    this.imageLoaded = state;
                })
                .catch(error => { /* handle error */ })
                .finally(() => { this.loading = false; });
        },
    },
};
</script>

<style>
.two-line {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.4em;
    height: calc(1.4em * 2);
}

/* ── Image wrapper ── */
.img-wrapper {
    position: relative;
    width: 100%;
    aspect-ratio: 1 / 1;
    overflow: hidden;
    border-radius: 6px;
}

/* Hide real image until loaded */
.img-hidden {
    display: none !important;
}

.product-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

/* Free delivery badge */
.free-delivery-badge {
    position: absolute;
    top: 6px;
    left: 6px;
    background: var(--color_Primary, #f60);
    color: #fff;
    font-size: 10px;
    padding: 2px 6px;
    border-radius: 4px;
}

/* ── Shimmer base ── */
@keyframes shimmer {
    0%   { background-position: 200% 0; }
    100% { background-position: -200% 0; }
}

.img-skeleton,
.text-skeleton {
    background: linear-gradient(90deg, #e0e0e0 25%, #f5f5f5 50%, #e0e0e0 75%);
    background-size: 200% 100%;
    animation: shimmer 1.5s infinite;
    border-radius: 6px;
}

/* Image skeleton fills the wrapper */
.img-skeleton {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
}

/* Text skeletons */
.title-skeleton {
    height: 14px;
    width: 85%;
    margin: 8px auto 4px;
}

.price-skeleton {
    height: 12px;
    width: 55%;
    margin: 4px auto;
}

.rating-skeleton {
    height: 12px;
    width: 70px;
    border-radius: 4px;
}

.btn-skeleton {
    height: 34px;
    width: 100%;
    border-radius: 6px;
}
</style>