<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div v-for="(category, index) in categories" :key="index" class="top_selling">
                    <div class="row mb-2">
                        <div class="sell_title stock_deals">
                            <div>
                                <h5>{{ category.name }}</h5>
                            </div>
                            <div>
                                <nuxt-link :to="'category/category-grid?sub_slug=' + category.slug" class="catLink">
                                    See All<i class="fas fa-arrow-right"></i>
                                </nuxt-link>
                            </div>
                        </div>
                    </div>

                    <div class="container text-center my-3">
                        <div class="swiper mySwiper pro_slider">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide" v-for="(item, index) in category.products"
                                    :key="item.product_id + '-' + index">

                                    <div class="product_grid text-start"
                                        style="border: 1px solid var(--color_Primary); border-radius: 8px; padding: 10px;">

                                        <nuxt-link :to="`/product-details/${item.slug}`" class="text-center d-block">

                                            <!-- ── Image Wrapper with Skeleton ── -->
                                            <div class="img-wrapper">
                                                <div class="img-skeleton"
                                                    v-if="!imageLoaded[item.product_id + '-' + index]">
                                                </div>
                                                <img
                                                    :src="item.thumnail"
                                                    class="img-fluid mx-auto d-block product-img"
                                                    :class="{ 'img-hidden': !imageLoaded[item.product_id + '-' + index] }"
                                                    @load="onImageLoad(item.product_id + '-' + index)"
                                                    @error="onImageLoad(item.product_id + '-' + index)"
                                                />
                                                <span v-if="item.free_shopping == 1" class="free-delivery-badge">
                                                    Free Delivery
                                                </span>
                                            </div>

                                            <!-- ── Text Skeleton while image loading ── -->
                                            <template v-if="!imageLoaded[item.product_id + '-' + index]">
                                                <div class="text-skeleton name-skeleton"></div>
                                                <div class="text-skeleton price-skeleton"></div>
                                            </template>

                                            <template v-else>
                                                <p class="mt-2 mb-1" style="font-size: 15px;">{{ item.name }}</p>

                                                <div v-if="item.discount_status == 1"
                                                    class="d-flex justify-content-center align-items-center gap-2">
                                                    <p class="mb-0">Tk.{{ Number(item.last_price) }}</p>
                                                    <p class="mb-0" v-if="item.discount !== 0">
                                                        <strike>Tk.{{ item.price.toFixed(2) }}</strike>
                                                        <span>{{ item.discount }}%</span>
                                                    </p>
                                                </div>

                                                <div v-else-if="item.discount_status == 2"
                                                    class="d-flex justify-content-center align-items-center gap-2">
                                                    <p class="mb-0">Tk.{{ item.last_price.toFixed(2) }}</p>
                                                    <p class="mb-0" v-if="item.discount !== 0">
                                                        <strike>Tk.{{ item.price.toFixed(2) }}</strike>
                                                        <span>Tk.{{ item.discount.toFixed(2) }}</span>
                                                    </p>
                                                </div>

                                                <div v-else>
                                                    <p class="mb-0">Tk.{{ item.last_price.toFixed(2) }}</p>
                                                </div>
                                            </template>

                                        </nuxt-link>

                                        <!-- ── Rating & Button Skeleton ── -->
                                        <template v-if="!imageLoaded[item.product_id + '-' + index]">
                                            <div class="text-skeleton rating-skeleton mx-auto mt-2"></div>
                                            <div class="text-skeleton btn-skeleton mt-2"></div>
                                        </template>

                                        <template v-else>
                                            <div class="d-flex align-items-center justify-content-center mt-1">
                                                <div class="rating">
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <button type="button" class="btn_cart" @click="addToCart(item)">
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
    </div>
</template>

<script>
export default {
    data() {
        return {
            loading: false,
            categoryname: '',
            currentSlide: 0,
            category_slug: '',
            categories: [],
            cart: [],
            products_details: [],
            products: [],
            pro_count: 0,
            imageLoaded: {},  // tracks per-image load state
        };
    },
    async mounted() {
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
        await this.fetchDefaultProduct();
        this.ssliderTest();
    },

    methods: {

        // Flip image state to loaded
        onImageLoad(key) {
            this.$set(this.imageLoaded, key, true);
        },

        ssliderTest() {
            const swiper = new Swiper('.pro_slider', {
                slidesPerView: 6,
                breakpoints: {
                    0:   { slidesPerView: 2 },
                    320: { slidesPerView: 2 },
                    480: { slidesPerView: 3 },
                    640: { slidesPerView: 3 },
                    768: { slidesPerView: 4 },
                    992: { slidesPerView: 6 },
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

        addToCart(product) {
            const existingCartItemIndex = this.cart.findIndex(item => item.product.id === product.id);
            const Toast = Swal.mixin({
                toast: true, position: "top-end",
                showConfirmButton: false, timer: 3000, timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
            });
            if (existingCartItemIndex !== -1) {
                this.cart[existingCartItemIndex].quantity++;
            } else {
                this.cart.push({ product: product, quantity: 1 });
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
            const category_id = 25;
            await this.$axios.get('/unauthenticate/searchProductCategory', {
                params: { category_id }
            })
            .then(response => {
                this.products_details = response.data.result;
                this.products         = response.data.products;
                this.categories       = response.data.result;

                // Initialize imageLoaded keys for every product in every category
                const state = {};
                response.data.result.forEach(category => {
                    category.products.forEach((item, index) => {
                        state[item.product_id + '-' + index] = false;
                    });
                });
                this.imageLoaded = state;
            })
            .catch(error => { /* handle error */ })
            .finally(() => { this.loading = false; });
        },
    },
};
</script>

<style>
.catLink          { font-size: 14px; }
.catLink i        { margin-left: 5px; }

/* ── Image wrapper ── */
.img-wrapper {
    position: relative;
    width: 100%;
    aspect-ratio: 1 / 1;
    overflow: hidden;
    border-radius: 6px;
}

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

/* ── Shimmer animation ── */
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

/* Image skeleton fills the wrapper absolutely */
.img-skeleton {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
}

/* Text skeletons */
.name-skeleton {
    height: 14px;
    width: 80%;
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