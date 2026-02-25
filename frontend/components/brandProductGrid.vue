<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="product_section">
                    <div class="row px-2">
                        <!-- sidebar fillter  -->
                        <div class="row justify-content-center">
                            <div class="container my-4">
                                <div class="row g-3">

                                    <div class="col-12 col-sm-6 col-md-3" v-for="category in categories"
                                        :key="category.id">
                                        <nuxt-link class="category_item d-block text-center"
                                            :to="`/category/category-grid?sub_slug=${category.slug}`">
                                            {{ category.name }}
                                        </nuxt-link>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- grid  -->
                        <div class="col-md-12">
                            <div class="product_list">
                                <div class="title_product">
                                    <div>
                                        <h6>{{ categoryname }}</h6>
                                    </div>
                                </div>


                                <div class="row">
                                    <!-- start -->
                                    <div v-for="item in products" :key="product.id"
                                        class="col-xl-4 col-lg-4 col-md-4 col-sm-6 col-6">
                                        <div class="product_grid">
                                            <nuxt-link :to="`/product-details/${item.slug}`">
                                                <img :src="item.image" class="img-fluid" :alt="item.name">
                                                <span v-if="item.free_shopping == 1">Free Delivery</span>
                                                <strong v-if="item.seller_name">{{ item.seller_name }} </strong>
                                                <strong v-else>Admin Seller</strong>
                                                <h1>{{ item.name }}</h1>
                                                <div>
                                                    <div class="d-flex align-items-center"
                                                        v-if="item.discount_status == 1">
                                                        <p class="me-1" v-if="item.discount !== 0">${{
                                                            item.percent_discount.toFixed(2) }}</p>
                                                        <p v-else class="me-1">${{ (item.price).toFixed(2) }}</p>
                                                        <p v-if="item.discount !== 0 && item.discount !== ''">
                                                            <strike>${{ item.price }}</strike>
                                                            <span>{{ item.discount }}%</span>
                                                        </p>
                                                    </div>
                                                    <div class="d-flex align-items-center"
                                                        v-else-if="item.discount_status == 2">
                                                        <p class="me-1" v-if="item.discount !== 0">${{
                                                            item.fixed_discount.toFixed(2) }}</p>
                                                        <p v-else class="me-1">${{ (item.price).toFixed(2) }}</p>
                                                        <p v-if="item.discount !== 0 && item.discount !== ''">
                                                            <strike>${{ item.price }}</strike>
                                                            <span>${{ item.discount }}</span>
                                                        </p>
                                                    </div>
                                                    <p v-else>${{ (item.price).toFixed(2) }}</p>
                                                </div>
                                            </nuxt-link>

                                            <div class="d-flex align-items-center">
                                                <div class="rating">
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star checked"></i>
                                                    <i class="fa fa-star "></i>
                                                </div>
                                                <h6>(200)</h6>
                                            </div>
                                            <!-- <button type="button"  class="btn_cart" @click="addToCart(item.id)">Add to Cart</button> -->
                                            <button type="button" class="btn_cart" @click="addToCart(item.id)">Add to
                                                cart</button>

                                        </div>
                                    </div>
                                    <!-- END -->
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
    data() {
        return {
            loading: false,
            cart: [],
            products: [],
            product: [],
            categories: [],
            pro_count: 0,
            categoryname: '',
        };
    },

    mounted() {
        this.calculateSubtotal();
        this.loadCart();
        this.cartItemCount();
        this.fetchData();
        this.fetchDataCategory();
    },
    methods: {

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
            const productToAdd = this.products.find((product) => product.id === productId);
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
        async fetchData() {
            this.loading = true;
            const slug = this.$route.query.slug;
            try {
                const response = await this.$axios.get(`/unauthenticate/brandproductList/${slug}`).then(response => {
                    // console.log("=-===" + response.data.products);
                    this.products = response.data.products;
                    this.product = response.data.products;
                    // console.log(response.data.products);
                })
            } catch (error) {
                // Handle error
            } finally {
                this.loading = false; // Hide loader after response
            }
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
    }
};
</script>
<style>
.category_item {
    position: relative;
    padding: 14px 15px;
    margin-bottom: 0;
    /* remove extra gap because row g-3 already handles spacing */
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    cursor: pointer;
    background: #fff;
    transition: 0.3s ease;
    font-size: 14px;
    font-weight: 500;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.category_item:hover {
    background: #f8f9fa;
    border-color: var(--color_Primary);
    color: var(--color_Primary);
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
}
</style>