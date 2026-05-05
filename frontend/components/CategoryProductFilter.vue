<template>
    <div>
        <div class="row">
            <div class="col-12">

                <!-- Full-page loader during API call -->
                <div class="loading-indicator" v-if="loading">
                    <div class="loader-container">
                        <img src="/loader/loader.gif" alt="Loader" />
                        <p class="loader-text">Loading...</p>
                    </div>
                </div>

                <!-- ── Product Section (no v-show so skeletons are visible) ── -->
                <div class="product_section">
                    <div class="row px-2">

                        <!-- ── Sidebar ── -->
                        <div class="col-md-4 desktop_view">
                            <div class="left_side_product">
                                <div class="category_list">
                                    <h6>Category</h6>
                                    <ul>
                                        <li v-for="category in categories" :key="category.id">
                                            <a href="#" @click.prevent="fetchData(category.slug)">
                                                {{ category.name }}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- ── Product List ── -->
                        <div class="col-md-8">
                            <div class="product_list">

                                <div class="title_product">
                                    <div>
                                        <h6>{{ categoryname }}</h6>
                                    </div>
                                </div>

                                <div class="grid_list">
                                    <div>
                                        <p>{{ pro_count }} product found</p>
                                    </div>
                                    <div class="d-flex">
                                        <Nuxt-Link to="/category/category-list" class="active">
                                            <i class="fa-solid fa-list"></i>
                                        </Nuxt-Link>
                                    </div>
                                </div>

                                <!-- No products -->
                                <div v-if="!loading && prouducts.length === 0" class="text-center py-4">
                                    <p>No products found.</p>
                                </div>

                                <!-- ── Product Loop ── -->
                                <div class="row" v-for="(item, index) in prouducts" :key="item.id + '-' + index">
                                    <div class="col-12" :id="item.id">
                                        <div class="products_list">

                                            <!-- ── Col 1: Image ── -->
                                            <div class="col">
                                                <nuxt-link :to="`/product-details/${item.pro_slug}`">
                                                    <div class="list-img-wrapper">

                                                        <!-- Shimmer shown while image loading -->
                                                        <div class="img-skeleton"
                                                            v-if="!imageLoaded[item.id + '-' + index]"></div>

                                                        <!-- Real image hidden until loaded -->
                                                        <img :src="item.thumnail_img" class="list-product-img"
                                                            :class="{ 'img-hidden': !imageLoaded[item.id + '-' + index] }"
                                                            @load="onImageLoad(item.id + '-' + index)"
                                                            @error="onImageLoad(item.id + '-' + index)" alt="" />

                                                        <span v-if="item.free_shopping == 1" class="free-badge">Free
                                                            Delivery</span>

                                                    </div>
                                                </nuxt-link>
                                            </div>

                                            <!-- ── Col 2: Info ── -->
                                            <div class="col pad_ding">
                                                <template v-if="!imageLoaded[item.id + '-' + index]">
                                                    <div class="text-skeleton seller-skeleton mb-2"></div>
                                                    <div class="text-skeleton title-skeleton mb-2"></div>
                                                    <div class="text-skeleton title-skeleton mb-2" style="width:55%">
                                                    </div>
                                                    <div class="text-skeleton rating-skeleton mb-2"></div>
                                                    <div class="text-skeleton desc-skeleton mb-1"></div>
                                                    <div class="text-skeleton desc-skeleton mb-1" style="width:70%">
                                                    </div>
                                                    <div class="text-skeleton desc-skeleton mb-1" style="width:85%">
                                                    </div>
                                                </template>
                                                <template v-else>
                                                    <strong v-if="item.seller_name">{{ item.seller_name }}</strong>
                                                    <strong v-else>Admin Seller</strong>
                                                    <h5>{{ item.product_name }}</h5>
                                                    <div class="d-flex align-items-center">
                                                        <div class="ratings m-0">
                                                            <i class="fa fa-star checked"></i>
                                                            <i class="fa fa-star checked"></i>
                                                            <i class="fa fa-star checked"></i>
                                                            <i class="fa fa-star checked"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <h6 class="m-0">(200)</h6>
                                                    </div>
                                                    <div class="short_des">
                                                        <p class="mt-0" v-html="item.short_description"></p>
                                                    </div>
                                                </template>
                                            </div>

                                            <!-- ── Col 3: Price & Button ── -->
                                            <div class="col pad_ding">
                                                <template v-if="!imageLoaded[item.id + '-' + index]">
                                                    <div class="text-skeleton price-skeleton mb-2"></div>
                                                    <div class="text-skeleton old-price-skeleton mb-3"></div>
                                                    <div class="text-skeleton btn-skeleton"></div>
                                                </template>
                                                <template v-else>

                                                    <!-- discount_status == 1 : percentage discount -->
                                                    <div v-if="item.discount_status == 1">
                                                        <h4 class="me-1">
                                                            Tk.{{ Number(item.last_price).toFixed(2) }}
                                                        </h4>
                                                        <h4 class="disabled"
                                                            v-if="item.discount !== 0 && item.discount !== ''">
                                                            <strike>Tk.{{ Number(item.price).toFixed(2) }}</strike>
                                                            <span class="discount-badge">
                                                                {{ Number(item.discount) }}%
                                                            </span>
                                                        </h4>
                                                    </div>

                                                    <!-- discount_status == 2 : fixed discount -->
                                                    <div v-else-if="item.discount_status == 2">
                                                        <h4 class="me-1">
                                                            Tk.{{ Number(item.last_price).toFixed(2) }}
                                                        </h4>
                                                        <h4 class="disabled"
                                                            v-if="item.discount !== 0 && item.discount !== ''">
                                                            <strike>Tk.{{ Number(item.price).toFixed(2) }}</strike>
                                                            <span class="discount-badge">
                                                                Tk.{{ Number(item.discount).toFixed(2) }} off
                                                            </span>
                                                        </h4>
                                                    </div>

                                                    <!-- no discount -->
                                                    <div v-else>
                                                        <h4 class="me-1">
                                                            Tk.{{ Number(item.last_price).toFixed(2) }}
                                                        </h4>
                                                    </div>

                                                    <button v-if="item.stock_qty >= 1" type="button" class="btn_cart"
                                                        style="display:block; visibility:unset;"
                                                        @click="addToCart(item.id)">Add to cart</button>

                                                    <button v-else type="button" disabled class="btn_sold"
                                                        style="display:block; visibility:unset;">Sold Out</button>

                                                </template>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- ── End Product Loop ── -->

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
    props: ['category_slug'],
    data() {
        return {
            loading: false,
            cart: [],
            updatedQuantity: 0,
            prouducts: [],
            product: [],
            subtotal: 0,
            categories: [],
            pro_count: 0,
            itemCount: 0,
            quantity: 1,
            categoryname: '',
            imageLoaded: {},        // per-image skeleton state
        };
    },

    async mounted() {
        // reset any scroll locks
        document.documentElement.style.overflow = '';
        document.documentElement.style.height = '';
        document.body.style.overflow = '';
        document.body.style.height = '';
        document.body.style.position = '';
        document.body.style.width = '';
        document.body.style.top = '';

        this.loadCart();
        this.calculateSubtotal();
        this.cartItemCount();

        const paramSlug = this.$route.query.slug;
        await Promise.all([
            this.fetchData(paramSlug),
            this.fetchDataCategory(),
        ]);

        this.$nextTick(() => {
            window.scrollTo(0, 0);
            window.dispatchEvent(new Event('resize'));
        });
    },

    beforeDestroy() {
        document.documentElement.style.overflow = '';
        document.documentElement.style.height = '';
        document.body.style.overflow = '';
        document.body.style.height = '';
        document.body.style.position = '';
        document.body.style.width = '';
        document.body.style.top = '';
    },

    methods: {

        /* ── Image skeleton helpers ── */
        onImageLoad(key) {
            this.$set(this.imageLoaded, key, true);
        },
        initImageLoaded(products) {
            const state = {};
            products.forEach((item, index) => {
                state[item.id + '-' + index] = false;
            });
            this.imageLoaded = state;
        },

        /* ── Cart ── */
        loadCart() {
            try {
                const saved = localStorage.getItem('cart');
                if (saved) { this.cart = JSON.parse(saved); }
            } catch (e) { this.cart = []; }
        },

        saveCart() {
            this.loading = true;
            try {
                localStorage.setItem('cart', JSON.stringify(this.cart));
            } catch (e) { console.error('Cart save error:', e); }
            setTimeout(() => { this.loading = false; }, 2000);
        },

        cartItemCount() {
            let count = 0;
            this.cart.forEach(item => { count += item.quantity; });
            this.itemCount = count;
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);
        },

        updateQuantity(productId, newQuantity) {
            const index = this.cart.findIndex(i => i.product.id === productId);
            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
                this.calculateSubtotal();
            }
        },

        addToCart(productId) {
            const productToAdd = this.prouducts.find(p => p.id === productId);
            const existingItem = this.cart.find(i => i.product.id === productId);
            if (!existingItem) {
                this.cart.push({ product: productToAdd, quantity: 1 });
                if (typeof Swal !== 'undefined') {
                    Swal.mixin({
                        toast: true, position: 'top-end',
                        showConfirmButton: false, timer: 3000, timerProgressBar: true,
                        didOpen: toast => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    }).fire({ icon: 'success', title: 'Product successfully Added to cart' });
                }
            }
            this.saveCart();
            this.cartItemCount();
            this.calculateSubtotal();
        },

        removeFromCart(product) {
            const index = this.cart.findIndex(i => i.product.id === product.id);
            if (index !== -1) {
                this.cart[index].quantity > 1
                    ? this.cart[index].quantity--
                    : this.cart.splice(index, 1);
                this.saveCart();
                this.calculateSubtotal();
                this.cartItemCount();
            }
        },

        calculateSubtotal() { return 0; },

        truncateText(text, limit) {
            return text.length > limit ? text.substring(0, limit) + '...' : text;
        },

        categoryGrid() {
            this.$router.push({
                path: '/category/category-grid',
                query: { slug: this.$route.query.slug }
            });
        },

        redirectCategory(slug) {
            this.$router.push({ path: '/category/category-list', query: { slug } });
        },

        /* ── API ── */
        async fetchData(slug) {
            if (!slug) return;
            this.loading = true;
            try {
                const res = await this.$axios.get(`/unauthenticate/findCategorys/${slug}`);
                this.prouducts = res.data.result.reverse();
                this.pro_count = res.data.pro_count;
                this.categoryname = res.data.categoryname;
                this.initImageLoaded(this.prouducts);   // reset skeletons for new data
            } catch (err) {
                console.error('fetchData error:', err);
            } finally {
                this.loading = false;
                this.$nextTick(() => {
                    document.documentElement.style.overflow = '';
                    document.body.style.overflow = '';
                    document.body.style.position = '';
                    document.body.style.height = '';
                    window.dispatchEvent(new Event('resize'));
                });
            }
        },

        async fetchDataCategory() {
            try {
                const res = await this.$axios.get(`/unauthenticate/filterCategorys`);
                this.categories = res.data;
            } catch (err) {
                console.error('fetchDataCategory error:', err);
            }
        },
    },
};
</script>

<style scoped>
/* ── List image wrapper ── */
.list-img-wrapper {
    position: relative;
    width: 120px;
    height: 120px;
    flex-shrink: 0;
    border-radius: 6px;
    overflow: hidden;
}

.img-hidden {
    display: none !important;
}

.list-product-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    border-radius: 6px;
}

/* Free delivery badge */
.free-badge {
    position: absolute;
    top: 4px;
    left: 4px;
    background: var(--color_Primary, #f60);
    color: #fff;
    font-size: 10px;
    padding: 2px 5px;
    border-radius: 4px;
}

/* Discount badge */
.discount-badge {
    font-size: 12px;
    color: #fff;
    background: var(--color_Primary, #f60);
    padding: 1px 5px;
    border-radius: 3px;
    margin-left: 4px;
}

/* ── Shimmer ── */
@keyframes shimmer {
    0% {
        background-position: 200% 0;
    }

    100% {
        background-position: -200% 0;
    }
}

.img-skeleton,
.text-skeleton {
    background: linear-gradient(90deg, #e0e0e0 25%, #f5f5f5 50%, #e0e0e0 75%);
    background-size: 200% 100%;
    animation: shimmer 1.5s infinite;
    border-radius: 6px;
}

.img-skeleton {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
}

/* Skeleton sizes */
.seller-skeleton {
    height: 12px;
    width: 80px;
}

.title-skeleton {
    height: 16px;
    width: 90%;
}

.rating-skeleton {
    height: 12px;
    width: 100px;
}

.desc-skeleton {
    height: 12px;
    width: 100%;
}

.price-skeleton {
    height: 22px;
    width: 90px;
}

.old-price-skeleton {
    height: 14px;
    width: 120px;
}

.btn-skeleton {
    height: 36px;
    width: 120px;
    border-radius: 6px;
}

/* Full-page loader */
.loading-indicator {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255, 255, 255, 0.85);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

.loader-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}

.loader-text {
    margin: 0;
    font-size: 14px;
    color: #555;
}

/* Two-line clamp */
.two-line {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.4em;
    height: calc(1.4em * 2);
}
</style>