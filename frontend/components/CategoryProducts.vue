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
                        <div class="col-md-3 mt-1">
                            <div class="category">
                                <div class="category_list">
                                    <div class="category_item" v-for="item in categories" :key="item.id"
                                        :class="{ 'active_item': activeSlug === item.slug }"
                                        @click="selectCategory(item.slug)">
                                        {{ item.name }}
                                        <span class="custom_tooltip">{{ item.name }}</span>
                                    </div>
                                </div>
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
                                            <h1 class="mt-1">{{ item.product_name }}</h1>

                                            <!-- Price & Discount -->
                                            <div>
                                                <div class="d-flex align-items-center" v-if="item.discount_status == 1">
                                                    <p class="me-1" v-if="item.discount !== 0">${{
                                                        item.percent_discount.toFixed(2) }}</p>
                                                    <p v-else class="me-1">${{ item.price.toFixed(2) }}</p>
                                                    <p v-if="item.discount !== 0 && item.discount !== ''"><strike>${{
                                                        item.price }}</strike>
                                                        <span>{{ item.discount }}%</span>
                                                    </p>
                                                </div>
                                                <div class="d-flex align-items-center"
                                                    v-else-if="item.discount_status == 2">
                                                    <p class="me-1" v-if="item.discount !== 0">${{
                                                        item.fixed_discount.toFixed(2) }}</p>
                                                    <p v-else class="me-1">${{ item.price.toFixed(2) }}</p>
                                                    <p v-if="item.discount !== 0 && item.discount !== ''"><strike>${{
                                                        item.price }}</strike>
                                                        <span>{{ item.discount }}</span>
                                                    </p>
                                                </div>
                                                <p v-else>${{ item.price.toFixed(2) }}</p>
                                            </div>

                                            <!-- Rating -->
                                            <div class="d-flex align-items-center">
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

            /* NEW */
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

    methods: {

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
        async fetchData(slug) {
            this.loading = true;
            const response = await this.$axios.get(`/unauthenticate/findCategorys/${slug}`)
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



        async fetchSubCategoryData(slug) {
            this.loading = true;
            const response = await this.$axios.get(`/unauthenticate/findSubCategorys/${slug}`)
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
            await this.$axios.get(`/unauthenticate/filterCategorys`).then(response => {
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