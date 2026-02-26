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
                    <div class="row">
                        <div class="col-md-3 mt-3">
                            <div class="category-menu">
                                <!-- Root Category -->
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary text-center root-category">
                                        <div @click.prevent="onClickCategory(categories.id, categories.slug, categories.name)"
                                            :class="{ active_item: selectedCategory === categories.id }">
                                            {{ categoryname }}
                                        </div>
                                    </li>
                                    <!-- Child Categories -->
                                    <div v-for="child in categories.childrens || []" :key="child.id">
                                        <!-- Parent Category -->
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center child-category">
                                            <!-- LEFT SIDE (FILTER LINK) -->
                                            <a href="#" @click.prevent="filterByCategory(child.id)"
                                                :class="['category-link', { active_item: selectedCategory === child.id }]">
                                                {{ child.name }}
                                            </a>
                                            <!-- RIGHT SIDE (TOGGLE ICON) -->
                                            <svg v-if="child.children?.length" @click.stop="toggle(child.id)"
                                                :class="{ rotated: isOpen(child.id) }"
                                                xmlns="http://www.w3.org/2000/svg" width="14" height="14"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"
                                                stroke-linecap="round" stroke-linejoin="round" class="chevron">
                                                <polyline points="6 9 12 15 18 9"></polyline>
                                            </svg>
                                        </li>
                                        <!-- Subcategories -->
                                        <div v-if="child.children?.length && isOpen(child.id)"
                                            class="sub-category-container">
                                            <li v-for="sub in child.children" :key="sub.id"
                                                class="list-group-item sub-child-category">
                                                <a href="#" @click.prevent="filterByCategory(sub.id)"
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
</template>
<script>
export default {
    props: {
        receivedSlug: String,
        // categories: Object
    },
    data() {
        return {
            loading: false,
            cart: [],
            prouducts: [],          // shown products
            allProducts: [],        // backup copy
            categories: [],
            openIds: [],
            selectedCategory: null,
            pro_count: 0,
            categoryname: '',
            selectedCategory: null,
            limit: 9,
            activeSlug: null
        };
    },
    async mounted() {
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
        const paramSlug = this.$route.query.slug;
        const paramSubSlug = this.$route.query.sub_slug;
        this.activeSlug = paramSlug;
        // 1 Load main category first
        if (paramSlug) {
            await this.fetchData(paramSlug);
        }
        // 2 Load category list (if needed)
        await this.fetchDataCategory();
        // 3 After everything ready, select sub category
        if (paramSubSlug) {
            this.selectCategory(paramSubSlug);
        }
    },
    watch: {
        '$route.query.slug': {
            immediate: true, // run on initial load too
            handler(newSlug) {
                if (newSlug) {
                    this.activeSlug = newSlug;
                    this.selectedCategory = null; // reset selected filter
                    this.fetchCategoryData(newSlug); // load sidebar categories
                    this.fetchData(newSlug);        // load products
                }
            }
        }
    },
    methods: {
        async fetchCategoryData(slug) {
            // fetch sidebar categories for current slug
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/filterMainCategorys/${slug}`);
                this.categories = response.data; // update sidebar
            } catch (error) {
                console.error(error);
            } finally {
                this.loading = false;
            }
        },
        toggle(id) {
            if (this.openIds.includes(id)) {
                this.openIds = this.openIds.filter(x => x !== id)
            } else {
                this.openIds.push(id)
            }
        },
        isOpen(id) {
            return this.openIds.includes(id)
        },
        selectCategory(slug) {
            this.activeSlug = slug;
            //this.fetchData(slug);
            this.fetchSubCategoryData(slug);
        },
        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => {
                itemCount += item.quantity;
            });
            this.itemCount = itemCount;
            console.log('Emitting cartItemCountUpdated event with itemCount:', this.itemCount);
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);
        },
        updateQuantity(productId, newQuantity) {
            const index = this.cart.findIndex((item) => item.product.id === productId);
            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
                this.calculateSubtotal(); // Optionally recalculate subtotal after updating quantity
            }
        },
        addToCart(productId) {
            const productToAdd = this.prouducts.find((product) => product.id === productId);
            const existingItem = this.cart.find((item) => item.product.id === productId);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                this.cart.push({
                    product: productToAdd,
                    quantity: 1
                });
                const Toast = Swal.mixin({
                    toast: true,
                    position: "top-end",
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({
                    icon: "success",
                    title: "Product successfully Added to cart"
                });
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
        loadCart() {
            const savedCart = localStorage.getItem('cart');
            if (savedCart) {
                this.cart = JSON.parse(savedCart);
            }
        },
        saveCart() {
            this.loading = true;
            localStorage.setItem('cart', JSON.stringify(this.cart));
            setTimeout(() => {
                this.loading = false;
            }, 2000);
        },
        calculateSubtotal() {
            return 0;
        },
        categoryGrid() {
            const slug = this.$route.query.slug;
            //alert(paramSlug);
            this.$router.push({
                path: '/category/category-list',
                query: {
                    slug: slug
                }
            })
        },
        redirectCategory(slug) {
            this.$router.push({
                path: '/category/category-list',
                query: {
                    slug: slug
                }
            })
        },
        toggleCategory(id) {
            if (this.openIds.includes(id)) {
                this.openIds = this.openIds.filter(x => x !== id)
            } else {
                this.openIds.push(id)
            }
        },
        isOpen(id) {
            return this.openIds.includes(id)
        },
        async fetchData(slug) {

            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findCategorys/${slug}`);
                this.allProducts = response.data.result.reverse(); // store full products
                this.prouducts = [...this.allProducts];           // products shown
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
            } catch (error) {
                console.error(error);
            } finally {
                this.loading = false;
            }
        },
        filterByCategory(categoryId) {
            this.selectedCategory = categoryId;

            if (!categoryId) {
                this.prouducts = [...this.allProducts];
            } else {
                this.prouducts = this.allProducts.filter(p => p.category_id === categoryId);
            }

            this.pro_count = this.prouducts.length;
        }, showAllProducts() {
            this.prouducts = this.allProducts;
            this.pro_count = this.prouducts.length;
        },
        onClickCategory(categoryId, slug, name) {
            this.selectedCategory = categoryId
            this.activeSlug = slug
            this.categoryname = name
            this.loading = true
            // Fetch products for this category
            this.fetchData(slug)

        },
        async fetchSubCategoryData(slug) {
            this.loading = true;
            const response = await this.$axios.get(`/unauthenticate/findByMainCat/${slug}`)
                .then(response => {
                    this.prouducts = response.data.result.reverse();
                    this.pro_count = response.data.pro_count;
                    this.categoryname = response.data.categoryname;
                })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false; // Hide loader after response
                });
        },
        async fetchDataCategory() {
            this.loading = true;
            const slug = this.$route.query.slug;
            await this.$axios.get(`/unauthenticate/filterMainCategorys/${slug}`).then(response => {
                this.categories = response.data;
            })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false; // Hide loader after response
                });;
        }
    },
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