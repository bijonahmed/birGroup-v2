<template>
    <div>
        <!-- product grid part start here  -->
        <div class="row">
            <div class="col-12">
                <div class="loading-indicator" v-if="loading">
                    <div class="loader-container">
                        <center class="loader-text">Loading...</center>
                        <img src="/loader/loader.gif" alt="Loader" />
                    </div>
                </div>
                <div class="product_section">
                    <div class="row px-2">
                        <div class="col-md-3 mt-3">
                            <div class="category-menu">
                                <!-- Root Category -->
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary text-center root-category">
                                        <!-- {{ categories }} -->
                                        <div @click.prevent="onClickCategory(categories.id, categories.slug, categories.name)"
                                            :class="{ active_item: selectedCategory === categories.id }">
                                            {{ categoryname }}
                                        </div>
                                    </li>
                                    <!-- Child Categories -->
                                    <div v-for="child in categories" :key="child.id">
                                        <!-- Parent Category -->
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center child-category">
                                            <!-- LEFT SIDE (FILTER LINK) -->
                                            <a href="#" @click.prevent="filterByCategory(child.slug)"
                                                :class="['category-link', { active_item: selectedCategory === child.id }]">
                                                {{ child.name }}
                                            </a>
                                            <!-- RIGHT SIDE (TOGGLE ICON) -->
                                            <svg v-if="child.children && child.children.length" @click.stop="toggle(child.id)"
                                                :class="{ rotated: isOpen(child.id) }"
                                                xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"
                                                stroke-linecap="round" stroke-linejoin="round" class="chevron">
                                                <polyline points="6 9 12 15 18 9"></polyline>
                                            </svg>
                                        </li>
                                        <!-- Subcategories -->
                                        <div v-if="child.children && child.children.length && isOpen(child.id)"
                                            class="sub-category-container">
                                            <li v-for="sub in child.children" :key="sub.id"
                                                class="list-group-item sub-child-category">
                                                <a href="#" @click.prevent="filterByCategory(sub.slug)"
                                                    :class="{ active_item: selectedCategory === sub.id }">
                                                    {{ sub.name }}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                </ul>
                            </div>
                        </div>
                        <!-- PRODUCT LIST -->
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
                                    <!-- ========== Loop ==============  -->
                                    <!-- {{ prouducts }} -->
                                    <div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-1-5" v-for="item in prouducts"
                                        :key="item.id">
                                        <div class="product_grid text-center" v-if="prouducts.length > 0">
                                            <nuxt-link :to="`/product-details/${item.pro_slug}`">
                                                <img :src="item.thumnail_img" class="img-fluid product_img"
                                                    loading="lazy" />
                                            </nuxt-link>
                                            <span v-if="item.free_shopping == 1" class="free_delivery">Free
                                                Delivery</span>
                                            <!-- <strong>{{ item.seller_name || 'Admin Seller' }}</strong> -->
                                            <h1 class="mt-1">{{ item.product_name }}</h1>
                                            <!-- Price & Discount -->
                                            <div class="text-center">
                                                <div class="d-flex justify-content-center align-items-center mb-1"
                                                    v-if="item.discount_status == 1">
                                                    <p class="me-2 mb-0" v-if="item.discount !== 0">BDT {{
                                                        item.percent_discount.toFixed(2) }}</p>
                                                    <p class="me-2 mb-0" v-else>BDT {{ item.price.toFixed(2) }}</p>
                                                    <p class="mb-0" v-if="item.discount !== 0 && item.discount !== ''">
                                                        <strike>BDT {{ item.price }}</strike>
                                                        <span>{{ item.discount }}%</span>
                                                    </p>
                                                </div>

                                                <div class="d-flex justify-content-center align-items-center mb-1"
                                                    v-else-if="item.discount_status == 2">
                                                    <p class="me-2 mb-0" v-if="item.discount !== 0">BDT {{
                                                        item.fixed_discount.toFixed(2) }}</p>
                                                    <p class="me-2 mb-0" v-else>BDT {{ item.price.toFixed(2) }}</p>
                                                    <p class="mb-0" v-if="item.discount !== 0 && item.discount !== ''">
                                                        <strike>BDT {{ item.price }}</strike>
                                                        <span>{{ item.discount }}</span>
                                                    </p>
                                                </div>

                                                <p v-else class="mb-0">BDT {{ item.price.toFixed(2) }}</p>
                                            </div>
                                            <!-- Rating -->
                                            <div class="d-flex align-items-center d-none">
                                                <div class="rating">
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h6>(200)</h6>
                                            </div>
                                            <!-- Buttons -->
                                            <button v-if="item.stock_qty >= 1" type="button" class="btn_cart"
                                                @click="addToCart(item.id)">
                                                Add to cart
                                            </button>
                                            <button v-else type="button" class="btn_sold">SoldOut</button>
                                        </div>
                                    </div>
                                    <!-- ================= Loop ===================  -->
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
            selectedCategory: null, // <-- added this
            limit: 9,
        };
    },
    watch: {
        // Watch URL query change for sub_slug
        '$route.query.sub_slug': {
            immediate: true,
            handler(newSubSlug) {
                if (newSubSlug) {
                    this.activeSlug = newSubSlug;
                    this.selectedCategory = null;
                    this.loadSidebarAndProducts(newSubSlug);
                }
            }
        }
    },
    async mounted() {
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
        const paramSlug = this.$route.query.slug;
        const paramSubSlug = this.$route.query.sub_slug;
        this.activeSlug = paramSlug;
        this.fetchDataCategory();
        // 1 Load products for main category
        await this.fetchData(paramSubSlug);
    },
    methods: {
        // Click subcategory from sidebar
        async onClickSubCategory(categoryId, slug) {
            this.selectedCategory = categoryId;
            this.activeSlug = slug;
            // Update URL without reloading page
            this.$router.push({
                path: this.$route.path,
                query: { sub_slug: slug }
            }).catch(() => { }); // ignore duplicate navigation error
            // Fetch sidebar & products
            await this.loadSidebarAndProducts(slug);
        },
        // Fetch both sidebar categories and products dynamically
        async loadSidebarAndProducts(slug) {
            this.loading = true;
            try {
                // Products
                const productResp = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                this.prouducts = productResp.data.result.reverse();
                this.pro_count = productResp.data.pro_count;
                this.categoryname = productResp.data.categoryname;
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        async filterByCategory(slug) {
            this.selectedCategory = slug;
            console.log("Filtering by category slug:", slug);
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                //        console.log("Products for main category:", response.data);
                this.prouducts = response.data.result;
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        // Original product fetch (for main category)
        async fetchData(slug) {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                // console.log("Products for main category:", response.data);
                this.prouducts = response.data.result;
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        // Fetch sidebar categories
        async fetchDataCategory() {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/filterAllSubCategorys`);
                this.categories = response.data;
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        // Other helper methods
        selectCategory(slug) {
            this.activeSlug = slug;
            this.fetchSubCategoryData(slug);
        },
        async fetchSubCategoryData(slug) {
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`);
                this.prouducts = response.data.result.reverse();
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
            } catch (err) {
                console.error(err);
            } finally {
                this.loading = false;
            }
        },
        onClickCategory(categoryId, slug, name) {
            this.selectedCategory = categoryId
            this.activeSlug = slug
            this.categoryname = name
            this.loading = true
            // Fetch products for this category
            this.fetchData(slug)
        },
        // Cart methods (unchanged)
        cartItemCount() { /* ... */ },
        loadCart() { /* ... */ },
        saveCart() { /* ... */ },
        calculateSubtotal() { return 0; },
        addToCart(productId) { /* ... */ },
        removeFromCart(product) { /* ... */ },
        updateQuantity(productId, newQuantity) { /* ... */ },
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

/* Product grid card */
.product_grid {
    border: 1px solid var(--color_Primary);
    border-radius: 8px;
    padding: 10px;
    margin-bottom: 15px;
    background: #fff;
    transition: 0.3s ease;
}

/* Hover effect */
.product_grid:hover {
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    transform: translateY(-3px);
    border-color: var(--color_Primary);
    /* highlight border on hover */
}

/* Image styling */
.product_img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 6px;
}

/* Free delivery badge */
.free_delivery {
    display: inline-block;
    margin-top: 5px;
    margin-bottom: 5px;
    font-size: 12px;
    color: var(--color_Primary);
    font-weight: bold;
}

/* CATEGORY STYLE */
.category_item {
    position: relative;
    padding: 12px 15px;
    margin-bottom: 10px;
    border: 1px solid #e5e5e5;
    border-radius: 6px;
    cursor: pointer;
    background: #fff;
    transition: 0.3s ease;
    font-size: 14px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.category_item:hover {
    background: #f8f9fa;
    border-color: #350303;
    color: #0d6efd;
}

/* ACTIVE */
.active_item {
    background: var(--color_Primary);
    color: #fff;
    border-color: var(--color_Primary);
}

/* TOOLTIP */
.custom_tooltip {
    position: absolute;
    bottom: 110%;
    left: 50%;
    transform: translateX(-50%);
    background: #000;
    color: #fff;
    padding: 6px 10px;
    border-radius: 4px;
    font-size: 13px;
    white-space: nowrap;
    opacity: 0;
    visibility: hidden;
    transition: 0.2s ease;
    z-index: 999;
}

.category_item:hover .custom_tooltip {
    opacity: 1;
    visibility: visible;
}

/* LOADER */
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
</style>