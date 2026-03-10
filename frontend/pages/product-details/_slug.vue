<template>
    <div>
        <LogoAndPayment />
        <!-- navbar section start here  -->
        <NavbarSecond />

        <section class="main_content">
            <div class="container">
                <div class="row">
                    <!-- left side  -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                        <div class="product_details_part">
                            <div class="row">
                                <!-- <p>Product Slug: {{ pro_row.description }}</p> -->
                                <!-- left part  -->
                                <div class="col-md-5">

                                    <!-- {{ featuresimgs }} -->
                                    <div class="loading-indicator" v-if="loading" style="text-align: center;">
                                        <div class="loader-container">
                                            <center class="loader-text">Loading...</center>
                                            <img src="/loader/loader.gif" loading="lazy" alt="Loader" />
                                        </div>
                                    </div>
                                    <section class="Slider">
                                        <div class="zoom-container" @mousedown="startDrag" @mousemove="onDrag"
                                            @mouseup="endDrag" @mouseleave="endDrag" @touchstart="startDrag"
                                            @touchmove="onDrag" @touchend="endDrag">

                                            <!-- Control Buttons -->
                                            <div class="zoom-buttons">
                                                <button @click="zoomIn" class="zoom-btn">+</button>
                                                <button @click="zoomOut" class="zoom-btn">-</button>
                                                <button @click="rotateLeft" class="zoom-btn">⟲</button>
                                                <button @click="rotateRight" class="zoom-btn">⟳</button>
                                            </div>

                                            <img :src="featuresimgs" class="sliderimg" :style="{
                                                transform: `
                translate(${positionX}px, ${positionY}px)
                scale(${zoomLevel})
                rotate(${rotation}deg)
            `
                                            }">
                                        </div>
                                        <div class="Slider-thumbnails">
                                            <a v-for="(image, index) in slider_img" :key="index" :href="image.thumnail"
                                                :class="{ 'Slider-thumbnail': true, 'active': index === 0 }"
                                                @click.prevent="changeSlide(index)">
                                                <img :src="image.thumnail" :alt="image.alt"
                                                    style="height:80px; width:70px; border-color: var(--color_Primary);"
                                                    class="border border-1 rounded">
                                            </a>
                                        </div>
                                    </section>

                                    <!-- image slider end here  -->

                                </div>
                                <!-- right part  -->
                                <div class="col-md-7">
                                    <div class="pro_info">
                                        <div class="badgeses">
                                            <div>
                                                <span v-if="seller !== ''">{{ seller.name
                                                }}</span>
                                                <strong v-if="pro_row.free_shopping == 1">free delivery</strong>
                                                <!-- <span style="background-color: red;"><a href="affiliate.html" style="color: #fff;">Click to Get Your affiliate link</a></span> -->
                                            </div>

                                            <!-- <div v-if="loggedIn">
                                                <a href="#" @click="addtowishlist"><i
                                                        class="fa-regular fa-heart"></i></a>

                                            </div>
                                            <div v-else>
                                                <a href="#" @click="login"><i class="fa-regular fa-heart"></i></a>
                                            </div> -->

                                        </div>
                                        <div class="details_title">
                                            <h1>{{ pro_row.product_name }}</h1>
                                            <h6 v-for="brand in brands_details">
                                                Brand:
                                                <nuxt-link v-if="brand.name !== undefined && brand.name !== ''"
                                                    :to="`/brand-product/brand-grid?slug=${brand.slug}`">
                                                    {{ brand.name }}
                                                </nuxt-link>
                                                <span v-else>No Brand</span>
                                            </h6>

                                        </div>
                                        <div class="price_div">
                                            <!-- {{ pro_row }} -->
                                            <h5 v-if="pro_row.discount_status == 1">
                                                <div class="d-flex align-items-center">
                                                    Now: BDT{{ getTotal(pro_row.last_price) }}
                                                    <p style="color: gray;font-size: 12px;"> &nbsp;+Inclusing VAT.</p>
                                                </div>
                                                <!-- <p class="ms-0 d-block"><strike v-if="pro_row.discount !== 0">Was: ${{
                                                    pro_row.price.toFixed(2) }} </strike><span>{{ pro_row.discount
                                                        }}%</span></p> -->
                                            </h5>
                                            <h5 v-else-if="pro_row.discount_status == 2">
                                                <div class="d-flex align-items-center">
                                                    Now: BDT{{ (pro_row.last_price).toFixed(2) }}
                                                    <p style="color: gray;font-size: 12px;"> &nbsp;+Inclusing VAT.</p>
                                                </div>
                                                <!-- <p class="ms-0 d-block"><strike v-if="pro_row.discount !== 0">Was: ${{
                                                    pro_row.price.toFixed(2) }} </strike><span>${{ pro_row.discount
                                                        }}</span></p> -->
                                            </h5>



                                            <h5 v-else>BDT{{ pro_row.last_price }} </h5>

                                            <p v-if="pro_row.stock_status == 1 && pro_row.stock_qty >= 1">In stock</p>
                                            <p v-else-if="pro_row.stock_status == 2 && pro_row.stock_qty >= 1">in stock
                                            </p>

                                            <p v-else-if="pro_row.stock_status == 3">Out of stock</p>
                                            <p v-else-if="pro_row.stock_status == 4">Preorder</p>
                                            <p v-else-if="pro_row.stock_qty == 0">Out Of stock</p>
                                            <p v-else>Out Of stock</p>
                                        </div>
                                        <div class="ratings_pro">
                                            <!-- <p v-if="pro_row.free_shopping == 0">+shipping (${{ pro_row.flat_rate_price
                                                }} in per {{ pro_row.unit }})</p>
                                            <div class="d-flex align-items-center d-none">
                                                <div class="d-flex align-items-center ">
                                                    <i class="fa-solid fa-star active"></i>
                                                    <i class="fa-solid fa-star active"></i>
                                                    <i class="fa-solid fa-star active"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                </div>
                                                <h6 class="mb-0 ms-2">( <a href="#feedback">188 verified ratings</a>)
                                                </h6>
                                            </div> -->
                                            <div class="d-flex align-items-end mb-2">

                                                <!-- {{ varientList }} -->
                                                <!-- ===================================  -->
                                                <div class="size_attr mt-2 border-redish" v-if="varientList.length > 0">
                                                    <label>Attribue:</label>

                                                    <select v-model="size" required class="form-control"
                                                        style=" width: 200px;">
                                                        <option disabled value="">Select</option>

                                                        <option v-for="(varient, index) in varientList" :key="index"
                                                            @click="handleButtonClick(varient)" :value="varient.name">
                                                            {{ varient.name }}
                                                        </option>

                                                    </select>
                                                </div>


                                                <!-- ==============================  -->
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <div class="number my-1">
                                                    <span class="minus" @click="decrement">-</span>
                                                    <input v-model="updatedQuantity" type="number" @change="checkqty()"
                                                        @input="sanitizeInput" />
                                                    <span class="plus" @click="increment">+</span>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <button type="button" v-if="pro_row.stock_qty !== 0" class="btn_cart "
                                                    style="visibility: unset; max-width: 120px;"
                                                    @click="addToCart(pro_row.id)"><i
                                                        class="fa-solid fa-cart-shopping"></i>Add to Cart </button>
                                                <button style="max-width: 120px;" v-else class="btn_sold">Sold
                                                    out</button>
                                            </div>
                                            <p v-if="pro_row.free_shopping !== 1" class="m-0">Delivery by <strong>{{
                                                futureDate }}</strong></p>
                                            <p v-if="pro_row.free_shopping == 1" class="m-0">Free Delivery by <strong>{{
                                                futureDate }}</strong></p>
                                        </div>
                                        <div class="shortDescPro">

                                        </div>
                                        <div class="promotion d-none">
                                            <h4>Promotions</h4>
                                            <ul>
                                                <li>
                                                    <nuxt-link to="/sell-on-ecommerce"><i
                                                            class="fa-solid fa-shield-halved"></i>Become a seller and
                                                        start sell your product in ECOMMERCE </nuxt-link>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="report">
                                    <!-- <a href="#">Report Incorrect product information</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- details section -->
        <section class="details_scrollspay">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- details part start here  -->
                        <div class="row">
                            <div class="col-12">
                                <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0"
                                    class="scrollspy-example" tabindex="0">
                                    <div class="product_details" id="details">

                                    </div>

                                    <!-- customer recent views  -->

                                    <div class="feedback d-none" id="feedback">
                                        <div class="side_title">
                                            <h5>Varified Customer Feedback</h5>
                                            <a href="customer-review.html">See All <i
                                                    class="fa-solid fa-arrow-right"></i></a>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <h2>Varified ratings(147)</h2>
                                                <div class="box_rating">
                                                    <h3>4.5/5</h3>
                                                    <div class="ratings">
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                    <p>147 verified ratings</p>
                                                </div>
                                                <div class="rate_count">
                                                    <p>5</p>
                                                    <i class="fa fa-star checked"></i>
                                                    <span>(106)</span>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="rate_count">
                                                    <p>4</p>
                                                    <i class="fa fa-star checked"></i>
                                                    <span>(106)</span>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="rate_count">
                                                    <p>3</p>
                                                    <i class="fa fa-star checked"></i>
                                                    <span>(106)</span>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="rate_count">
                                                    <p>2</p>
                                                    <i class="fa fa-star checked"></i>
                                                    <span>(106)</span>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="rate_count">
                                                    <p>1</p>
                                                    <i class="fa fa-star checked"></i>
                                                    <span>(106)</span>
                                                    <div class="progress">
                                                        <div class="progress-bar" role="progressbar" style="width: 25%;"
                                                            aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8 right_side_rate">
                                                <h2>COMMENTS FROM VERIFIED PURCHASES(51)</h2>
                                                <div>
                                                    <div class="ratings">
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                    <h5>Awsome</h5>
                                                    <p>awesome</p>
                                                    <div class="d-flex justify-content-between">
                                                        <p>04-08-2023 By <a href="#">User </a></p>
                                                        <p class="varify_tag"><i class="fa fa-check"></i>Varified
                                                            Customer</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="ratings">
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                    <h5>Awsome</h5>
                                                    <p>awesome</p>
                                                    <div class="d-flex justify-content-between">
                                                        <p>04-08-2023 By <a href="#">User </a></p>
                                                        <p class="varify_tag"><i class="fa fa-check"></i>Varified
                                                            Customer</p>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="ratings">
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star checked"></span>
                                                        <span class="fa fa-star"></span>
                                                        <span class="fa fa-star"></span>
                                                    </div>
                                                    <h5>Awsome</h5>
                                                    <p>awesome</p>
                                                    <div class="d-flex justify-content-between">
                                                        <p>04-08-2023 By <a href="#">User </a></p>
                                                        <p class="varify_tag"><i class="fa fa-check"></i>Varified
                                                            Customer</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- You may like this  -->

                                </div>

                            </div>
                            <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 d-none">
                                <div class="sidebar_here">
                                    <div id="list-example" class="list-group id_list">
                                        <a class="list-group-item list-group-item-action active" href="#details"><i
                                                class="fa-regular fa-file-lines"></i>Product details </a>
                                        <a class="list-group-item list-group-item-action" href="#spacification"><i
                                                class="fa-solid fa-list"></i>Specification</a>
                                        <a class="list-group-item list-group-item-action" href="#feedback"><i
                                                class="fa-regular fa-message"></i>Varified Customer Feedback</a>
                                    </div>

                                    <div class="pro_cart">
                                        <div class="d-flex">
                                            <div><img :src="featuresimgs" alt=""></div>
                                            <div>
                                                <p>TK {{ pro_row.price }}</p>
                                                <p><strike>TK {{ pro_row.discount }}</strike></p>
                                            </div>
                                        </div>
                                        <button class="btn_cart" type="button"> <i class="fa-solid fa-cart-shopping"
                                                @click="addToCart(pro_row.id)"></i>Add to Cart </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <Footer />

    </div>
</template>

<script>
import $ from 'jquery';
import LogoAndPayment from '~/components/LogoAndPayment.vue';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';
import NavbarSecond from '../../components/NavbarSecond.vue';

export default {

    components: {
        NavbarSecond,
        LogoAndPayment,
        Common_MobileSidebar,
        Common_MiniTabNavbar,
        Common_MobileSearchProduct,
    },

    head: {
        title: 'Product Details',
    },

    async asyncData({
        params
    }) {
        const productSlug = params.slug;
        return {
            warranty_id: '',
            warranty_name: '',
            //cart
            cart: [],
            itemCount: 0,
            subtotal: 0,
            updatedQuantity: 1,
            product: [],
            //end cart
            currentIndex: 0,
            featuresimgs: '',
            slider_img: [],
            pro_row: [],
            productSlug,
            historVarient: [{
                varient_id: '',
                sku: '',
                qty: '',
                price: '',
                file: ''
            }],
            color: '',
            zoomLevel: 1,
            positionX: 0,
            positionY: 0,
            startX: 0,
            startY: 0,
            isDragging: false,
            rotation: 0,
            brands_details: [],
            currentDateTime: null,
            futureDate: null,
            futureDay: null,
            daysToAdd: '',
            seller: [],
            historVarient: [],
            colorGroup: [],
            varientList: [],
            color: '',
            size: '',
            warranty: [],
            warrantyamt: '0',
            total: '',

            loading: false,

        };
    },
    mounted() {
        this.loadCart();
        this.cartItemCount();
        this.initLightSlider();
        this.fetchData();
        this.updateDateTime();
        this.getTotal();
        this.scrollToTop();
        this.showAttrVal();

    },
    computed: {
        loggedIn() {
            return this.$auth.loggedIn;
        },

    },
    methods: {
        scrollToTop() {
            setTimeout(() => {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }, 100);
        },
        zoomIn() {
            if (this.zoomLevel < 3) {
                this.zoomLevel += 0.2
            }
        },

        zoomOut() {
            if (this.zoomLevel > 1) {
                this.zoomLevel -= 0.2
                if (this.zoomLevel === 1) {
                    this.positionX = 0
                    this.positionY = 0
                }
            }
        },

        rotateLeft() {
            this.rotation -= 90
        },

        rotateRight() {
            this.rotation += 90
        },

        startDrag(e) {
            if (this.zoomLevel === 1) return

            this.isDragging = true

            const clientX = e.type.includes('mouse')
                ? e.clientX
                : e.touches[0].clientX

            const clientY = e.type.includes('mouse')
                ? e.clientY
                : e.touches[0].clientY

            this.startX = clientX - this.positionX
            this.startY = clientY - this.positionY
        },

        onDrag(e) {
            if (!this.isDragging) return

            const clientX = e.type.includes('mouse')
                ? e.clientX
                : e.touches[0].clientX

            const clientY = e.type.includes('mouse')
                ? e.clientY
                : e.touches[0].clientY

            this.positionX = clientX - this.startX
            this.positionY = clientY - this.startY
        },

        endDrag() {
            this.isDragging = false
        },
        getTotal(price) {

            const priceNumber = parseFloat(price);
            const warrantyAmtNumber = parseFloat(this.warrantyamt);

            if (isNaN(priceNumber)) {
                console.error('Invalid price:', price);
                return '';
            }

            if (isNaN(warrantyAmtNumber)) {
                console.error('Invalid warranty amount:', this.warrantyamt);
                return '';
            }

            const totalAmt = priceNumber + warrantyAmtNumber;
            this.total = totalAmt;
            return totalAmt.toFixed(2);
        },
        updateWarranty(warranty) {
            // console.log(this.pro_row.last_price);
            // console.log(warranty.warranty_name);

            this.warrantyamt = warranty.price;
            this.warranty_name = warranty.warranty_name;
            this.getTotal();

        },
        checkqty() {
            const qty = this.pro_row.stock_qty;
            const upqty = this.updatedQuantity;
            if (upqty >= qty) {
                this.updatedQuantity = qty;
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
                    icon: "error",
                    title: "You've reached the stock limit"
                });
            }
        },
        handleButtonClick(varient) {
            this.varientData = varient;
            this.pro_row.price = varient.price;
            this.pro_row.stock_qty = varient.qty;
            this.featuresimgs = varient.image ? varient.image : this.pro_mainimage;

            let last_price; // Declare using let instead of const
            let d_status = this.pro_row.discount_status;
            let dis_c = this.pro_row.discount;

            if (d_status == 1) {
                last_price = varient.price - (varient.price * dis_c / 100);
            } else if (d_status == 2) {
                last_price = varient.price - dis_c;
            } else {
                last_price = varient.price;
            }

            this.pro_row.last_price = last_price;

            // console.log(this.pro_row.stock_qty);
            // console.log(this.pro_row.last_price);

            // Handle button click event for the selected variant
            // console.log('Button clicked for color:', varient.color);
            // console.log('Button clicked for size:', varient.size);
            // console.log('Button clicked for qty:', varient.qty);
            // console.log('Button clicked for price:', varient.price);
            // console.log('Button clicked for image:', varient.image);
        },

        showAttrVal() {
            //   console.log("Test...................");
            this.varientList = [];
            // console.log("value:" + this.color +"===="+ this.pro_Id);
            let slug = this.$route.params.slug;
            this.$axios
                .get(`/unauthenticate/checkAttribueDetails?slug=${slug}`)
                .then((response) => {
                    this.varientList = response.data;

                    console.log("Response Data:", response.data);
                })
                .catch((error) => {
                    console.error("API Error:", error);
                });


        },
        // =================================================
        updateDateTime() {
            const now = new Date();
            if (now.getHours() >= 17) {
                now.setDate(now.getDate() + 1);
            }
            const formattedDateTime = `${now.toDateString()} ${now.toLocaleTimeString()}`;
            this.currentDateTime = formattedDateTime;
            const futureDate = new Date(now.getTime() + this.daysToAdd * 24 * 60 * 60 * 1000);
            this.futureDate = futureDate.toDateString();
            const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            this.futureDay = days, [futureDate.getDay()];
            setTimeout(this.updateDateTime, 1000);
        },
        login() {
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
                icon: "error",
                title: "Please log in to your account to add items to your wishlist."
            });
        },
        async addtowishlist() {
            this.loading = true;
            const productSlug = this.$route.params.slug; //this.$route.query.slug;
            await this.$axios.get(`/order/addtowish/${productSlug}`).then(response => {
                Swal.fire({
                    position: "top-end",
                    icon: "success",
                    title: 'Item successfully added to your wishlist!',
                    showConfirmButton: false,
                    timer: 1500
                });
                console.log(response);
            })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false; // Hide loader after response
                });

        },
        increment() {
            // console.log(this.pro_row.stock_qty);
            // Increase the quantity value
            if (this.updatedQuantity < this.pro_row.stock_qty) {
                this.updatedQuantity++;
            } else {
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
                    icon: "error",
                    title: "You've reached the stock limit"
                });
            }
        },
        decrement() {
            // Decrease the quantity value, but ensure it doesn't go below 1
            if (this.updatedQuantity > 1) {
                this.updatedQuantity--;
            }
        },
        sanitizeInput() {
            // Remove non-numeric characters from the input
            // Remove non-numeric characters from the input
            this.updatedQuantity = this.updatedQuantity.replace(/\D/g, '');

            // Ensure the value is not empty
            if (this.updatedQuantity === '') {
                this.updatedQuantity = 1;
            }
        },
        //for cart
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
        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => {
                itemCount += parseInt(item.quantity);
            });
            this.itemCount = itemCount;
            // console.log('Emitting cartItemCountUpdated event with itemCount:', this.itemCount);
            this.$eventBus.$emit('cartItemCountUpdated', this.itemCount);

        },
        updateQuantity(productId, newQuantity) {
            const index = this.cart.findIndex((item) => item.product.id === productId);

            if (index !== -1) {
                this.cart[index].quantity = newQuantity;
                this.saveCart();
            }
        },
        async addToCart(productId) {
            console.log(this.warranty_name);
            const up_price = this.pro_row.last_price;
            const warrantyamt = this.warrantyamt;
            const warranty_id = this.warranty_id;
            const warranty_name = this.warranty_name;


            const pro_price = this.pro_row.price;
            const qty = this.pro_row.stock_qty;

            if (this.colorGroup.length > 0) {
                try {
                    const productToAdd = this.product.find((product) => product.id === productId);

                    // Ensure product and quantity are valid
                    if (!productToAdd || !this.updatedQuantity) {
                        // console.error('Product or quantity is invalid.');
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
                            icon: "error",
                            title: "Product or quantity is invalid."
                        });
                        return;
                    }

                    productToAdd.last_price = up_price;
                    productToAdd.price = pro_price;
                    productToAdd.stock_qty = qty;

                    if (warranty_id) {
                        productToAdd.warrantyamt = warrantyamt ? warrantyamt : '';
                        productToAdd.warranty_id = warranty_id ? warranty_id : '';
                        productToAdd.warranty_name = warranty_name ? warranty_name : '';
                    }


                    productToAdd.color = this.color;
                    productToAdd.size = this.size;

                    const existingItem = this.cart.find((item) => item.product.id === productId);

                    if (existingItem) {
                        existingItem.quantity += this.updatedQuantity;
                    } else {
                        this.cart.push({
                            product: productToAdd,
                            quantity: this.updatedQuantity,
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
                    console.log('Item added to cart successfully.');


                } catch (error) {
                    console.error('Error adding item to cart:', error);

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
                        icon: "error",
                        title: "Product not Added to cart"
                    });
                }
            } else {
                try {
                    const productToAdd = this.product.find((product) => product.id === productId);
                    // Ensure product and quantity are valid
                    if (!productToAdd || !this.updatedQuantity) {
                        // console.error('Product or quantity is invalid.');
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
                            icon: "error",
                            title: "Product or quantity is invalid."
                        });
                        return;
                    }

                    productToAdd.last_price = up_price;
                    productToAdd.color = this.color;
                    productToAdd.size = this.size;

                    const existingItem = this.cart.find((item) => item.product.id === productId);

                    if (existingItem) {
                        existingItem.quantity += this.updatedQuantity;
                    } else {
                        this.cart.push({
                            product: productToAdd,
                            quantity: this.updatedQuantity,
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
                    console.log('Item added to cart successfully.');


                } catch (error) {
                    console.error('Error adding item to cart:', error);

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
                        icon: "error",
                        title: "Product not Added to cart"
                    });
                }
            }


        },
        //end cart
        initLightSlider() {
            let thumbnails = document.getElementsByClassName('Slider-thumbnail');
            let activeImages = document.getElementsByClassName('active');

            for (let i = 0; i < thumbnails.length; i++) {
                thumbnails[i].addEventListener('click', (e) => {
                    e.preventDefault();

                    if (activeImages.length > 0) {
                        activeImages[0].classList.remove('active');
                    }

                    thumbnails[i].classList.add('active');
                    this.featuresimgs = this.slider_img[i].thumnail;
                });
            }
        },
        changeSlide(index) {
            // Change the slide when a thumbnail is clicked
            this.currentIndex = index;
            this.featuresimgs = this.slider_img[index].thumnail;
        },

        async fetchData() {
            const prosulg = this.$route.params.slug; //this.$route.query.slug;
            // console.log("-----------" + prosulg);
            // return false; 
            this.loading = false;
            const response = await this.$axios.get(`/unauthenticate/productSlug/${prosulg}`);
            this.featuresimgs = response.data.data.featuredImage;
            this.pro_mainimage = response.data.data.featuredImage;
            this.slider_img = response.data.data.slider_img;
            this.pro_row = response.data.data.pro_row;
            this.pro_Id = response.data.data.pro_row.id;
            this.seller = response.data.seller;
            this.brands_details = response.data.brand;
            this.product = response.data.data.product;
            this.daysToAdd = response.data.data.pro_row.shipping_days;
            this.historVarient = response.data.attibute.varient;
            this.colorGroup = response.data.attibute.colorGroup;
            this.warranty = response.data.warranty;
            // console.log(response.data.warranty);
            this.loading = false;

            $(".product_details").html(response.data.data.pro_row.description);
            $(".shortDescPro").html(response.data.data.pro_row.short_description);
            // console.log("====TEST=========" + response.data.attibute);

        },

    },

}
</script>

<style scoped>
/* img {
        width: 100%;
        display: block;
    } */
/* Featured main image border */
.Slider-featuredImage {
    border: 3px solid var(--color_Primary);
    border-radius: 8px;
}

/* Thumbnail default border */
.Slider-thumbnail img {
    border: 2px solid transparent;
    transition: 0.3s ease-in-out;
}

/* Active thumbnail border */
.Slider-thumbnail.active img {
    border: 2px solid var(--color_Primary);
}

.scrollimg {
    height: 40px;
    width: 20px;
}

.sliderimg {
    width: 100%;
    display: block;
}

.Slider {
    max-width: 80vw;
    margin: 0 auto;
}

.Slider-featuredImage {
    padding: 4px
}

.Slider-thumbnails {
    /* display: flex; */
    width: 100%;
    /* overflow: scroll; */
    margin-top: 4px;
    padding: 4px;
    margin-right: 16px;

}

.Slider-thumbnail {
    opacity: 0.7;
    cursor: pointer;

}

.Slider-thumbnail img {
    width: 200px;
    border: 3px solid var(--color_Primary);
}

.Slider-thumbnail .active {
    opacity: 1;
}

.Slider-thumbnail:hover,
.Slider-thumbnail:active,
/* .Slider-thumbnail:focus {
        opacity: 1;
        outline: solid 2px black;
        outline-offset: 2px;
    } */

.Slider-thumbnail:not(:first-of-type) {
    margin-left: 10px;
}

/* zoom in out  */
.Slider {
    max-width: 500px;
}

.zoom-container {
    position: relative;
    /* IMPORTANT */
    border: 3px solid var(--color_Primary);
    overflow: hidden;
}


.sliderimg {
    width: 100%;
    transition: transform 0.3s ease;
    /* ADD BORDER */

    border-radius: 6px;
    /* optional - সুন্দর look এর জন্য */
}

/* Buttons Top Left */
.zoom-buttons {
    position: absolute;
    top: 10px;
    left: 10px;
    z-index: 10;
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.zoom-btn {
    width: 35px;
    height: 35px;
    font-size: 18px;
    font-weight: bold;
    border: none;
    background: rgba(0, 0, 0, 0.7);
    color: white;
    cursor: pointer;
    border-radius: 4px;
}

.zoom-btn:hover {
    background: black;
}

.zoom-container {
    position: relative;
    overflow: hidden;
    cursor: grab;
}

.zoom-container:active {
    cursor: grabbing;
}

.sliderimg {
    width: 100%;
    transition: transform 0.2s ease;
    user-select: none;
    pointer-events: none;
}

.zoom-buttons {
    position: absolute;
    top: 10px;
    left: 10px;
    z-index: 10;
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.border-redish {
    border: 2px solid #f87171;
    background: #fff5f5;
    padding: 10px;
    border-radius: 6px;

}
</style>