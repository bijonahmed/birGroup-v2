<template>
    <client-only>
        <div>
            <div class="row">
                <div class="col-12">
                    <div class="product_section">
                        <div class="row px-2">
                            <!-- ── Sidebar (unchanged) ── -->
                            <div class="col-md-3 mt-3 d-none d-md-block">
                                <div class="category-menu">
                                    <ul class="list-group">
                                        <li v-if="activeCategory"
                                            class="list-group-item list-group-item-primary text-center root-category">
                                            <span style="cursor:pointer; font-weight:600;">
                                                {{ activeCategory.name }}
                                            </span>
                                        </li>
                                        <div v-if="activeCategory && activeCategory.children && activeCategory.children.length"
                                            class="mt-2 mb-3">
                                            <ul class="subcategory-list">
                                                <li v-for="child in activeCategory.children" :key="child.id">
                                                    <a :href="`/category/category-filter?slug=${child.slug}`"
                                                        :class="{ 'active': child.slug === activeSubSlug }">
                                                        {{ child.name }}
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="mt-2">
                                            <div class="category-wrapper" v-for="category in categories"
                                                :key="category.id">
                                                <h6 class="category-title">{{ category.name }}</h6>
                                                <ul class="subcategory-list">
                                                    <li v-for="childCategory in category.children"
                                                        :key="childCategory.id">
                                                        <a :href="`/category/category-filter?slug=${childCategory.slug}`"
                                                            :class="{ 'active': childCategory.slug === activeSubSlug }">
                                                            {{ childCategory.name }}
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </ul>
                                </div>
                            </div>
                            <!-- ── Product List ── -->
                            <div class="col-md-9">
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
                                    </div>
                                    <div class="row">
                                        <div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-1-5"
                                            v-for="(item, index) in prouducts" :key="item.id + '-' + index">
                                            <div class="product_grid text-center" v-if="prouducts.length > 0">
                                                <!-- ── Image Wrapper with Skeleton ── -->
                                                <nuxt-link :to="`/product-details/${item.pro_slug}`">
                                                    <div class="img-wrapper">
                                                        <!-- Shimmer skeleton -->
                                                        <div class="img-skeleton" v-if="!imageLoaded[item.id]">
                                                        </div>
                                                        <!-- Real image, hidden until loaded -->
                                                        <img :src="item.thumnail_img" class="img-fluid product_img"
                                                            :class="{ 'img-hidden': !imageLoaded[item.id] }"
                                                            @load="onImageLoad(item.id)"
                                                            @error="onImageLoad(item.id)" />
                                                    </div>
                                                </nuxt-link>
                                                <!-- ── Skeleton for text/buttons while image loading ── -->
                                                <template v-if="!imageLoaded[item.id]">
                                                    <div class="text-skeleton badge-skeleton mt-1"></div>
                                                    <div class="text-skeleton name-skeleton mt-2"></div>
                                                    <div class="text-skeleton name-skeleton mt-1" style="width:60%">
                                                    </div>
                                                    <div class="text-skeleton price-skeleton mt-2"></div>
                                                    <div class="text-skeleton btn-skeleton mt-2"></div>
                                                </template>
                                                <!-- ── Real content once image loaded ── -->
                                                <template v-else>
                                                    <span v-if="item.free_shopping == 1" class="free_delivery">
                                                        Free Delivery
                                                    </span>
                                                    <div class="text-center product-name two-line"
                                                        style="font-size: 16px;">
                                                        {{ truncateText(item.product_name, 40) }}
                                                    </div>
                                                    <!-- Price & Discount -->
                                                    <div class="text-center">
                                                        <div class="d-flex justify-content-center align-items-center mb-1"
                                                            v-if="item.discount_status == 1">
                                                            <p class="me-2 mb-0" v-if="item.discount !== 0">
                                                                Tk.{{ Number(item.percent_discount).toFixed(2) }}
                                                            </p>
                                                            <p class="me-2 mb-0" v-else>
                                                                Tk.{{ Number(item.price).toFixed(2) }}
                                                            </p>
                                                            <p class="mb-0"
                                                                v-if="item.discount !== 0 && item.discount !== ''">
                                                                <strike>Tk.{{ Number(item.price).toFixed(2) }}</strike>
                                                                <span>{{ Number(item.discount) }}%</span>
                                                            </p>
                                                        </div>
                                                        <div class="d-flex justify-content-center align-items-center mb-1"
                                                            v-else-if="item.discount_status == 2">
                                                            <p class="me-2 mb-0" v-if="item.discount !== 0">
                                                                Tk.{{ Number(item.fixed_discount).toFixed(2) }}
                                                            </p>
                                                            <p class="me-2 mb-0" v-else>
                                                                Tk.{{ Number(item.price).toFixed(2) }}
                                                            </p>
                                                            <p class="mb-0"
                                                                v-if="item.discount !== 0 && item.discount !== ''">
                                                                <strike>Tk.{{ Number(item.price).toFixed(2) }}</strike>
                                                                <span>{{ Number(item.discount) }}%</span>
                                                            </p>
                                                        </div>
                                                        <p v-else class="mb-0">Tk.{{ Number(item.price).toFixed(2) }}
                                                        </p>
                                                    </div>
                                                    <!-- Buttons -->
                                                    <button v-if="item.stock_qty >= 1" type="button" class="btn_cart"
                                                        @click="addToCart(item.id)">
                                                        Add to cart
                                                    </button>
                                                    <button v-else type="button" class="btn_sold">SoldOut</button>
                                                </template>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </client-only>
</template>
<script>
export default {
    props: {
        receivedSlug: String,
    },
    data() {
        return {
            loading: false,
            cart: [],
            prouducts: [],
            categories: [],
            pro_count: 0,
            categoryname: '',
            activeSlug: null,
            selectedCategory: null,
            activeCategory: null,
            activeSubSlug: null,
            limit: 9,
            imageLoaded: {},  // tracks per-image load state
        };
    },
    watch: {
        '$route.query.sub_slug': {
            immediate: true,
            handler(newSubSlug) {
                if (newSubSlug) {
                    this.activeSlug = newSubSlug;
                    this.selectedCategory = null;
                    this.loadSidebarAndProducts(newSubSlug);
                }
            }
        },
    },
    async mounted() {
        this.activeSubSlug = this.$route.query.sub_slug || null;
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
        const paramSlug = this.$route.query.slug;
        const paramSubSlug = this.$route.query.sub_slug;
        this.activeSlug = paramSlug;
        this.fetchDataCategory();
        await this.fetchData(paramSubSlug);
    },
    methods: {
        // ── Skeleton: flip image state to loaded ──
        onImageLoad(id) {
            this.$set(this.imageLoaded, id, true);
        },
        // ── Helper: init imageLoaded for a products array ──
        initImageLoaded(products) {
            const state = {};
            products.forEach(item => { state[item.id] = false; });
            this.imageLoaded = state;
        },
        async onClickSubCategory(categoryId, slug) {
            this.selectedCategory = categoryId;
            this.activeSlug = slug;
            if (this.$route.query.sub_slug !== slug) {
                this.$router.push({ path: this.$route.path, query: { sub_slug: slug } });
            }
            await this.loadSidebarAndProducts(slug);
        },
        async loadSidebarAndProducts(slug) {
            this.loading = true;
            try {
                const productResp = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                this.prouducts = productResp.data.result.reverse();
                this.pro_count = productResp.data.pro_count;
                this.categoryname = productResp.data.categoryname;
                this.initImageLoaded(this.prouducts);  // ← reset skeletons
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        async filterByCategory(slug) {
            this.selectedCategory = slug;
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/filterbySubcategorys/${slug}`);
                this.prouducts = response.data.result;
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
                this.initImageLoaded(this.prouducts);  // ← reset skeletons
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        async fetchData(slug) {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/filterbySubcategorys/${slug}`);
                this.prouducts = response.data.result;
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
                this.initImageLoaded(this.prouducts);  // ← reset skeletons
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        async fetchDataCategory() {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/getCategoryListFilter`, {
                    params: { sub_slug: this.activeSubSlug }
                });
                this.activeCategory = response.data.activeCategory || null;
                this.categories = response.data.categories || [];
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        async fetchSubCategoryData(slug) {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                this.prouducts = response.data.result.reverse();
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
                this.initImageLoaded(this.prouducts);  // ← reset skeletons
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        onClickCategory(categoryId, slug, name) {
            this.selectedCategory = categoryId;
            this.activeSlug = slug;
            this.categoryname = name;
            this.loading = true;
            this.fetchData(slug);
        },
        selectCategory(slug) {
            this.activeSlug = slug;
            this.fetchSubCategoryData(slug);
        },
        truncateText(text, limit) {
            return text.length > limit ? text.substring(0, limit) + '...' : text;
        },
        // ── Cart methods (unchanged) ──
        loadCart() {
            if (process.client) {
                const saved = localStorage.getItem('cart');
                if (saved) { this.cart = JSON.parse(saved); }
            }
        },
        saveCart() {
            this.loading = true;
            localStorage.setItem('cart', JSON.stringify(this.cart));
            setTimeout(() => { this.loading = false; }, 2000);
        },
        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => { itemCount += item.quantity; });
            this.itemCount = itemCount;
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);
        },
        calculateSubtotal() { return 0; },
        updateQuantity(productId, newQuantity) {
            const index = this.cart.findIndex((item) => item.product.id === productId);
            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
                this.calculateSubtotal();
            }
        },
        addToCart(productId) {
            const productToAdd = this.prouducts.find((product) => product.id === productId);
            const existingItem = this.cart.find((item) => item.product.id === productId);
            if (!existingItem) {
                this.cart.push({ product: productToAdd, quantity: 1 });
                const Toast = Swal.mixin({
                    toast: true, position: "top-end",
                    showConfirmButton: false, timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "success", title: "Product successfully Added to cart" });
            }
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
    },
}
</script>
<style scoped>
@media (min-width: 1200px) {
    .col-xl-1-5 {
        flex: 0 0 20%;
        max-width: 20%;
    }
}
a {
    text-decoration: none;
    color: #292929;
}
.category-wrapper {
    margin-bottom: 20px;
}
.category-title {
    font-weight: 600;
    font-size: 16px;
    margin-bottom: 10px;
    padding-bottom: 5px;
    border-bottom: 2px solid #f1f1f1;
    color: #222;
}
.subcategory-list {
    list-style: none;
    padding-left: 15px;
    margin: 0;
}
.subcategory-list li {
    margin-bottom: 6px;
}
.subcategory-list li a {
    text-decoration: none;
    font-size: 14px;
    color: #555;
    transition: all 0.3s ease;
}
.subcategory-list li a:hover {
    color: #0d6efd;
    padding-left: 5px;
}
.product_grid {
    border: 1px solid var(--color_Primary);
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 15px;
    background: #fff;
    transition: 0.3s ease;
}
.product_grid:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    transform: translateY(-3px);
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
.product_img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
    border-radius: 6px;
}
/* ── Shimmer animation ── */
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
/* Image skeleton fills wrapper absolutely */
.img-skeleton {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
}
/* Text skeletons */
.badge-skeleton {
    height: 12px;
    width: 60px;
    margin: 0 auto;
}
.name-skeleton {
    height: 13px;
    width: 85%;
    margin: 0 auto;
}
.price-skeleton {
    height: 13px;
    width: 50%;
    margin: 0 auto;
}
.btn-skeleton {
    height: 34px;
    width: 100%;
    border-radius: 6px;
}
.free_delivery {
    display: inline-block;
    margin-top: 5px;
    margin-bottom: 5px;
    font-size: 12px;
    color: var(--color_Primary);
    font-weight: bold;
}
.loading-indicator {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.8);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}
.loader-container {
    display: flex;
    flex-direction: column;
    align-items: center;
}
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