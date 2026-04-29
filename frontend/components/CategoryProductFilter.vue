<template>
    <div>
        <div class="row">
            <div class="col-12">

                <!-- ✅ Fix: Inline loader instead of position:fixed -->
                <div class="loading-indicator" v-if="loading">
                    <div class="loader-container">
                        <img src="/loader/loader.gif" alt="Loader" />
                        <p class="loader-text">Loading...</p>
                    </div>
                </div>

                <div class="product_section" v-show="!loading">
                    <div class="row px-2">
                        <!-- sidebar filter -->
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

                        <!-- list -->
                        <div class="col-md-8">
                            <div class="product_list">
                                <div class="title_product">
                                    <div>
                                        <h6>{{ categoryname }}</h6>
                                    </div>
                                    <div class="d-none">
                                        <label for="">Short By:</label>
                                        <select name="" id="">
                                            <option value="">Popularity</option>
                                            <option value="">New arrival</option>
                                            <option value="">Low to High</option>
                                            <option value="">high to low</option>
                                        </select>
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

                                    <div class="filter_modal">
                                        <div class="row px-4">
                                            <div class="col-6"></div>
                                            <div class="col-6 text-end">
                                                <i class="fa-solid fa-x filter_close" style="cursor: pointer;"></i>
                                            </div>
                                        </div>
                                        <div class="modal_fdiv">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="left_side_product">
                                                        <div class="category_list">
                                                            <h6>Category</h6>
                                                            <ul>
                                                                <li><a href="#">Computing</a></li>
                                                                <li><a href="#">Electronics</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="delivery_list">
                                                            <h6>Express delivery</h6>
                                                            <ul>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">DHL</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="delivery_list">
                                                            <h6>Shipped from</h6>
                                                            <ul>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">From Bangladesh</label>
                                                                </li>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">From Bangladesh</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="brands_list">
                                                            <h6>Brand</h6>
                                                            <div class="search_side">
                                                                <i class="fa-solid fa-magnifying-glass"></i>
                                                                <input type="text" class="form-control" placeholder="Search">
                                                            </div>
                                                            <ul class="brand_scroll">
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">Addidas</label>
                                                                </li>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">AGM</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="price_range">
                                                            <div class="sidebr_title">
                                                                <h6>Price Range</h6>
                                                                <button type="button" class="btn_apply">Apply</button>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div id="slider-range" class="price-filter-range" name="rangeInput"></div>
                                                                    <div class="d-flex" style="margin:10px auto">
                                                                        <input type="number"
                                                                            style="width: 45%;margin: 0px 3px;"
                                                                            min=0 max="9900"
                                                                            oninput="validity.valid||(value='0');"
                                                                            id="min_price" class="price-range-field" />
                                                                        <input type="number"
                                                                            style="width: 45%;margin: 0px 3px"
                                                                            min=0 max="10000"
                                                                            oninput="validity.valid||(value='10000');"
                                                                            id="max_price" class="price-range-field" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="brands_list">
                                                            <h6>Size</h6>
                                                            <div class="search_side">
                                                                <i class="fa-solid fa-magnifying-glass"></i>
                                                                <input type="text" class="form-control" placeholder="Search">
                                                            </div>
                                                            <ul class="brand_scroll">
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">XS</label>
                                                                </li>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">S</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="brands_list">
                                                            <h6>Gender</h6>
                                                            <ul class="brand_scroll">
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">Boys</label>
                                                                </li>
                                                                <li>
                                                                    <input type="checkbox">
                                                                    <label for="">Girls</label>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- cart details (kept as original) -->
                                <div class="d-none">
                                    this div specially for testing
                                    <h2>Shopping Cart</h2>
                                    <ul>
                                        <li v-for="item in cart" :key="item.product.id">
                                            {{ item.product.product_name }} - ${{ item.product.price }}
                                            (Qty: {{ item.quantity }})-
                                            <input v-model="item.updatedQuantity" type="number" />
                                            <button @click="updateQuantity(item.product.id, item.updatedQuantity)">
                                                Update Quantity
                                            </button>
                                            <button @click="removeFromCart(item.product)">Remove</button>
                                            <hr />
                                        </li>
                                    </ul>
                                    <p>Subtotal: ${{ subtotal }}</p>
                                    <p>Items in Cart: {{ itemCount }}</p>
                                    <hr />
                                </div>

                                <!-- No products found -->
                                <div v-if="!loading && prouducts.length === 0" class="text-center py-4">
                                    <p>No products found.</p>
                                </div>

                                <!-- Product Items -->
                                <div class="row" v-for="item in prouducts" :key="item.id">
                                    <div class="col-12" v-if="prouducts.length > 0" :id="item.id">
                                        <div class="products_list">
                                            <div class="col">
                                                <nuxt-link :to="`/product-details/${item.pro_slug}`">
                                                    <img :src="item.thumnail_img" class="img-fluid" alt="">
                                                    <span v-if="item.free_shopping == 1">Free Delivery</span>
                                                </nuxt-link>
                                            </div>
                                            <div class="col pad_ding">
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
                                            </div>
                                            <div class="col pad_ding">
                                                <div class="" v-if="item.discount_status == 1">
                                                    <h4 class="me-1">Tk.{{ (item.last_price).toFixed(2) }}</h4>
                                                    <h4 class="disabled" v-if="item.discount !== 0 && item.discount !== ''">
                                                        <strike>Tk.{{ item.price }}</strike>
                                                        <span>{{ item.discount }}%</span>
                                                    </h4>
                                                </div>
                                                <div class="" v-else-if="item.discount_status == 2">
                                                    <h4 class="me-1">Tk.{{ (item.last_price).toFixed(2) }}</h4>
                                                    <h4 class="disabled" v-if="item.discount !== 0 && item.discount !== ''">
                                                        <strike>Tk.{{ item.price }}</strike>
                                                        <span>{{ item.discount }}%</span>
                                                    </h4>
                                                </div>
                                                <div class="" v-else>
                                                    <h4 class="me-1">Tk.{{ (item.last_price).toFixed(2) }}</h4>
                                                </div>

                                                <button v-if="item.stock_qty >= 1"
                                                    type="button" class="btn_cart"
                                                    style="display: block;visibility: unset;"
                                                    @click="addToCart(item.id)">
                                                    Add to cart
                                                </button>
                                                <button v-else
                                                    type="button" disabled class="btn_sold"
                                                    style="display: block;visibility: unset;">
                                                    Sold Out
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- pagination -->
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>
<style>
.two-line {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;

    overflow: hidden;
    text-overflow: ellipsis;

    line-height: 1.4em;
    height: calc(1.4em * 2);
    /* force exactly 2 lines height */
}
</style>
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
        };
    },

    async mounted() {
        // ✅ Fix: Always reset body scroll on mount
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
            this.fetchDataCategory()
        ]);

        // ✅ Fix: Force viewport recalculation after data loads
        this.$nextTick(() => {
            window.scrollTo(0, 0);
            window.dispatchEvent(new Event('resize'));
        });
    },

    // ✅ Fix: Clean up when leaving component
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
        loadCart() {
            try {
                const savedCart = localStorage.getItem('cart');
                if (savedCart) {
                    this.cart = JSON.parse(savedCart);
                }
            } catch (e) {
                this.cart = [];
            }
        },
   truncateText(text, limit) {
            return text.length > limit ? text.substring(0, limit) + '...' : text;
        },
        saveCart() {
            this.loading = true;
            try {
                localStorage.setItem('cart', JSON.stringify(this.cart));
            } catch (e) {
                console.error('Cart save error:', e);
            }
            setTimeout(() => {
                this.loading = false;
            }, 2000);
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
                this.calculateSubtotal();
            }
        },

        addToCart(productId) {
            const productToAdd = this.prouducts.find((product) => product.id === productId);
            const existingItem = this.cart.find((item) => item.product.id === productId);

            if (existingItem) {
                // already in cart
            } else {
                this.cart.push({ product: productToAdd, quantity: 1 });
                if (typeof Swal !== 'undefined') {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.onmouseenter = Swal.stopTimer;
                            toast.onmouseleave = Swal.resumeTimer;
                        }
                    });
                    Toast.fire({ icon: 'success', title: 'Product successfully Added to cart' });
                }
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

        calculateSubtotal() {
            return 0;
        },

        categoryGrid() {
            const slug = this.$route.query.slug;
            this.$router.push({
                path: '/category/category-grid',
                query: { slug: slug }
            });
        },

        redirectCategory(slug) {
            this.$router.push({
                path: '/category/category-list',
                query: { slug: slug }
            });
        },

        async fetchData(slug) {
            if (!slug) return;
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/findCategorys/${slug}`);
                this.prouducts = response.data.result.reverse();
                this.pro_count = response.data.pro_count;
                this.categoryname = response.data.categoryname;
                $('.short_des').html(response.data.result.short_description);
            } catch (error) {
                console.error('fetchData error:', error);
            } finally {
                this.loading = false;
                // ✅ Fix: Always restore scroll after fetch
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
            this.loading = true;
            try {
                const response = await this.$axios.get(`/unauthenticate/filterCategorys`);
                this.categories = response.data;
            } catch (error) {
                console.error('fetchDataCategory error:', error);
            } finally {
                this.loading = false;
            }
        },
    },
};
</script>

<style scoped>

</style>