<template>
    <client-only>
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
                        <div class="row">
                            <div class="col-md-3 mt-3">
                                <div class="category-menu">
                                    <!-- Root Category -->
                                    <ul class="list-group" v-if="categories && categories.childrens">

                                        <!-- Root -->
                                        <li v-if="categories.id"
                                            class="list-group-item list-group-item-primary text-center root-category">

                                            <span
                                                @click="onClickCategory(categories.id, categories.slug, categories.name)"
                                                :class="{ active_item: selectedCategory === categories.id }"
                                                style="cursor:pointer">
                                                {{ categoryname }}
                                            </span>

                                        </li>

                                        <!-- Children -->
                                        <li v-for="child in categories.childrens" :key="'child-' + child.id"
                                            class="list-group-item">

                                            <div
                                                class="d-flex justify-content-between align-items-center child-category">

                                                <span @click="filterByCategory(child.id)"
                                                    :class="{ active_item: selectedCategory === child.id }"
                                                    style="cursor:pointer">
                                                    {{ child.name }}
                                                </span>

                                                <svg v-if="child.children && child.children.length"
                                                    @click.stop="toggle(child.id)"
                                                    :class="{ rotated: isOpen(child.id) }" width="14" height="14"
                                                    viewBox="0 0 24 24" class="chevron">
                                                    <polyline points="6 9 12 15 18 9"></polyline>
                                                </svg>

                                            </div>

                                            <ul v-if="child.children && child.children.length && isOpen(child.id)"
                                                class="sub-category-container">

                                                <li v-for="sub in child.children" :key="'sub-' + sub.id"
                                                    class="list-group-item sub-child-category">

                                                    <span @click="filterByCategory(sub.id)"
                                                        :class="{ active_item: selectedCategory === sub.id }"
                                                        style="cursor:pointer">
                                                        {{ sub.name }}
                                                    </span>

                                                </li>

                                            </ul>

                                        </li>

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
                                        <div class="col-6 col-sm-6 col-md-4 col-lg-3 col-xl-1-5"
                                            v-for="item in prouducts" :key="item.id">
                                            <div class="product_grid" v-if="prouducts.length > 0">
                                                <nuxt-link :to="`/product-details/${item.pro_slug}`">
                                                    <img :src="item.thumnail_img" class="img-fluid product_img"
                                                        loading="lazy" />
                                                </nuxt-link>
                                                <span v-if="item.free_shopping == 1" class="free_delivery">Free
                                                    Delivery</span>
                                                <!-- <strong>{{ item.seller_name || 'Admin Seller' }}</strong> -->
                                                <h1 class="mt-1 text-center">{{ item.product_name }}</h1>
                                                <!-- Price & Discount -->
                                                <div class="text-center price-section">
                                                    <!-- Discount Type 1 -->
                                                    <div v-if="item.discount_status == 1">
                                                        <p v-if="item.discount !== 0" class="mb-0 fw-bold">
                                                            BDT {{ item.percent_discount.toFixed(2) }}
                                                        </p>
                                                        <p v-else class="mb-0 fw-bold">
                                                            BDT {{ item.price.toFixed(2) }}
                                                        </p>
                                                        <p v-if="item.discount !== 0 && item.discount !== ''"
                                                            class="mb-0 text-muted">
                                                            <strike>BDT {{ item.price }}</strike>
                                                            <span class="text-danger ms-1">{{ item.discount }}%</span>
                                                        </p>
                                                    </div>
                                                    <!-- Discount Type 2 -->
                                                    <div v-else-if="item.discount_status == 2">
                                                        <p v-if="item.discount !== 0" class="mb-0 fw-bold">
                                                            BDT {{ item.fixed_discount.toFixed(2) }}
                                                        </p>
                                                        <p v-else class="mb-0 fw-bold">
                                                            BDT {{ item.price.toFixed(2) }}
                                                        </p>
                                                        <p v-if="item.discount !== 0 && item.discount !== ''"
                                                            class="mb-0 text-muted">
                                                            <strike>BDT {{ item.price }}</strike>
                                                            <span class="text-danger ms-1">{{ item.discount }}</span>
                                                        </p>
                                                    </div>
                                                    <!-- No Discount -->
                                                    <div v-else>
                                                        <p class="mb-0 fw-bold">
                                                            BDT {{ item.price.toFixed(2) }}
                                                        </p>
                                                    </div>
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
    </client-only>
</template>
<script>
export default {

    props: {
        receivedSlug: String
    },

    data() {
        return {
            loading: false,
            cart: [],
            prouducts: [],
            allProducts: [],
            categories: {
                childrens: []   // ✅ important fix
            },
            openIds: [],
            selectedCategory: null,
            pro_count: 0,
            categoryname: '',
            activeSlug: null,
            limit: 9
        };
    },

    async mounted() {
        this.loadCart();
        this.cartItemCount();

        const slug = this.$route.query.slug;
        if (slug) {
            this.activeSlug = slug;
            await this.initPage(slug);
        }
    },

    watch: {
        '$route.query.slug'(newSlug) {
            if (newSlug) {
                this.selectedCategory = null;
                this.initPage(newSlug);
            }
        }
    },

    methods: {

        // ✅ single init method
        async initPage(slug) {
            this.loading = true;
            try {
                await Promise.all([
                    this.fetchData(slug),
                    this.fetchCategoryData(slug)
                ]);
            } finally {
                this.loading = false;
            }
        },

        // ✅ remove duplicate toggleCategory
        toggle(id) {
            if (this.openIds.includes(id)) {
                this.openIds = this.openIds.filter(x => x !== id);
            } else {
                this.openIds.push(id);
            }
        },

        // ✅ only ONE isOpen method
        isOpen(id) {
            return this.openIds.includes(id);
        },

        async fetchData(slug) {
            const response = await this.$axios.get(`/unauthenticate/findCategorys/${slug}`);
            this.allProducts = response.data.result?.reverse() || [];
            this.prouducts = [...this.allProducts];
            this.pro_count = this.prouducts.length;
            this.categoryname = response.data.categoryname || '';
        },

        async fetchCategoryData(slug) {
            const response = await this.$axios.get(`/unauthenticate/filterMainCategorys/${slug}`);
            this.categories = response.data || { childrens: [] };
        },

        filterByCategory(categoryId) {
            this.selectedCategory = categoryId;

            if (!categoryId) {
                this.prouducts = [...this.allProducts];
            } else {
                this.prouducts = this.allProducts.filter(
                    p => p.category_id === categoryId
                );
            }

            this.pro_count = this.prouducts.length;
        },

        onClickCategory(categoryId, slug, name) {
            this.selectedCategory = categoryId;
            this.activeSlug = slug;
            this.categoryname = name;
            this.initPage(slug);
        },

        addToCart(productId) {
            const product = this.prouducts.find(p => p.id === productId);
            if (!product) return;

            const existing = this.cart.find(i => i.product.id === productId);

            if (existing) {
                existing.quantity++;
            } else {
                this.cart.push({
                    product,
                    quantity: 1
                });
            }

            localStorage.setItem('cart', JSON.stringify(this.cart));
            this.cartItemCount();
        },

        loadCart() {
            if (process.client) {
                const saved = localStorage.getItem('cart');
                if (saved) {
                    this.cart = JSON.parse(saved);
                }
            }
        },

        cartItemCount() {
            let total = 0;
            this.cart.forEach(item => {
                total += item.quantity;
            });
            this.$eventBus.$emit('cartItemCountUpdated', total);
        }

    }

}
</script>
<style scoped>
/* ===== CATEGORY MENU ===== */
a {
    text-decoration: none;
    color: #272727;
}

.category-link {
    text-decoration: none;
    color: inherit;
    display: block;
    width: 100%;
}

.active_item {
    color: var(--color_Primary);
    font-weight: 600;
    padding: 6px 5px;
}

.list-group-item {
    font-size: 15px;
}

.category-menu {
    /* max-width: 300px; */
    margin: 0 auto;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* Root Category */
.root-category {
    font-weight: 600;
    font-size: 1rem;
    background-color: var(--color_Primary);
    color: #fff;
    border-radius: 6px;
    margin-bottom: 10px;
    letter-spacing: 0.5px;
    border-color: white;
}

/* Child Categories */
.child-category {
    cursor: pointer;
    transition: all 0.2s;
}

.child-category:hover {
    background-color: #e7f1ff;
    color: var(--color_Primary);
}

/* Subcategory */
.sub-category-container {
    margin-left: 15px;
}

.sub-child-category {
    font-size: 0.95rem;
    color: #555;
    border: none;
    /* remove border for inner items */
}

/* Chevron SVG */
.chevron {
    transition: transform 0.3s ease;
    color: var(--color_Primary);
}

.rotated {
    transform: rotate(180deg);
}

@media (max-width: 768px) {
    .category-menu {
        margin-bottom: 1rem;
    }

    .category-item {
        font-size: 0.95rem;
    }
}

@media (min-width: 1200px) {
    .col-xl-1-5 {
        flex: 0 0 20%;
        max-width: 20%;
    }
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