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
                                <!-- left part  -->
                                <div class="col-md-5">
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
                                                <span v-if="seller !== ''">{{ seller.name }}</span>
                                                <strong v-if="pro_row.free_shopping == 1">free delivery</strong>
                                            </div>
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
                                            <h5 v-if="pro_row.discount_status == 1">
                                                <div class="d-flex align-items-center">
                                                    Now: BDT{{ getTotal(pro_row.last_price) }}
                                                    <p style="color: gray;font-size: 12px;"> &nbsp;+Inclusing VAT.</p>
                                                </div>
                                            </h5>
                                            <h5 v-else-if="pro_row.discount_status == 2">
                                                <div class="d-flex align-items-center">
                                                    Now: BDT{{ (pro_row.last_price).toFixed(2) }}
                                                    <p style="color: gray;font-size: 12px;"> &nbsp;+Inclusing VAT.</p>
                                                </div>
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
                                            <div class="d-flex align-items-end mb-2">
                                                <!-- Variant tile grid -->
                                                <div class="size_attr mt-2 border-redish" v-if="varientList.length > 0">
                                                    <label>Attribute:</label>
                                                    <div class="variant-grid">
                                                        <div v-for="(varient, index) in varientList" :key="index"
                                                            class="variant-tile"
                                                            :class="{ 'active': size === varient.name }"
                                                            @click="handleButtonClick(varient)">
                                                            {{ varient.name }}
                                                            <span class="corner-mark"
                                                                v-if="size === varient.name"></span>
                                                        </div>
                                                    </div>
                                                </div>
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
    async asyncData({ params }) {
        const productSlug = params.slug;
        return {
            warranty_id: '',
            warranty_name: '',
            // cart
            cart: [],
            itemCount: 0,
            subtotal: 0,
            updatedQuantity: 1,
            product: [],
            // end cart
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
            colorGroup: [],
            varientList: [],
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
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }, 100);
        },
        zoomIn() {
            if (this.zoomLevel < 3) { this.zoomLevel += 0.2; }
        },
        zoomOut() {
            if (this.zoomLevel > 1) {
                this.zoomLevel -= 0.2;
                if (this.zoomLevel === 1) {
                    this.positionX = 0;
                    this.positionY = 0;
                }
            }
        },
        rotateLeft() { this.rotation -= 90; },
        rotateRight() { this.rotation += 90; },
        startDrag(e) {
            if (this.zoomLevel === 1) return;
            this.isDragging = true;
            const clientX = e.type.includes('mouse') ? e.clientX : e.touches[0].clientX;
            const clientY = e.type.includes('mouse') ? e.clientY : e.touches[0].clientY;
            this.startX = clientX - this.positionX;
            this.startY = clientY - this.positionY;
        },
        onDrag(e) {
            if (!this.isDragging) return;
            const clientX = e.type.includes('mouse') ? e.clientX : e.touches[0].clientX;
            const clientY = e.type.includes('mouse') ? e.clientY : e.touches[0].clientY;
            this.positionX = clientX - this.startX;
            this.positionY = clientY - this.startY;
        },
        endDrag() { this.isDragging = false; },
        getTotal(price) {
            const priceNumber = parseFloat(price);
            const warrantyAmtNumber = parseFloat(this.warrantyamt);
            if (isNaN(priceNumber)) { console.error('Invalid price:', price); return ''; }
            if (isNaN(warrantyAmtNumber)) { console.error('Invalid warranty amount:', this.warrantyamt); return ''; }
            const totalAmt = priceNumber + warrantyAmtNumber;
            this.total = totalAmt;
            return totalAmt.toFixed(2);
        },
        updateWarranty(warranty) {
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
                    toast: true, position: "top-end", showConfirmButton: false,
                    timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "error", title: "You've reached the stock limit" });
            }
        },

        // ✅ UPDATED: now sets this.size so cart captures the selected variant name
        handleButtonClick(varient) {
            this.size = varient.name;           // <-- FIX: set size for cart
            this.varientData = varient;
            this.pro_row.price = varient.price;
            this.pro_row.stock_qty = varient.qty;
            this.featuresimgs = varient.image ? varient.image : this.pro_mainimage;

            let last_price;
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
        },

        showAttrVal() {
            this.varientList = [];
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

        updateDateTime() {
            const now = new Date();
            if (now.getHours() >= 17) { now.setDate(now.getDate() + 1); }
            this.currentDateTime = `${now.toDateString()} ${now.toLocaleTimeString()}`;
            const futureDate = new Date(now.getTime() + this.daysToAdd * 24 * 60 * 60 * 1000);
            this.futureDate = futureDate.toDateString();
            const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            this.futureDay = days[futureDate.getDay()];
            setTimeout(this.updateDateTime, 1000);
        },

        login() {
            const Toast = Swal.mixin({
                toast: true, position: "top-end", showConfirmButton: false,
                timer: 3000, timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                }
            });
            Toast.fire({ icon: "error", title: "Please log in to your account to add items to your wishlist." });
        },

        async addtowishlist() {
            this.loading = true;
            const productSlug = this.$route.params.slug;
            await this.$axios.get(`/order/addtowish/${productSlug}`)
                .then(response => {
                    Swal.fire({
                        position: "top-end", icon: "success",
                        title: 'Item successfully added to your wishlist!',
                        showConfirmButton: false, timer: 1500
                    });
                    console.log(response);
                })
                .catch(error => { })
                .finally(() => { this.loading = false; });
        },

        increment() {
            if (this.updatedQuantity < this.pro_row.stock_qty) {
                this.updatedQuantity++;
            } else {
                const Toast = Swal.mixin({
                    toast: true, position: "top-end", showConfirmButton: false,
                    timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "error", title: "You've reached the stock limit" });
            }
        },
        decrement() {
            if (this.updatedQuantity > 1) { this.updatedQuantity--; }
        },
        sanitizeInput() {
            this.updatedQuantity = this.updatedQuantity.replace(/\D/g, '');
            if (this.updatedQuantity === '') { this.updatedQuantity = 1; }
        },

        // cart
        loadCart() {
            const savedCart = localStorage.getItem('cart');
            if (savedCart) { this.cart = JSON.parse(savedCart); }
        },
        saveCart() {
            this.loading = true;
            localStorage.setItem('cart', JSON.stringify(this.cart));
            setTimeout(() => { this.loading = false; }, 2000);
        },
        cartItemCount() {
            let itemCount = 0;
            this.cart.forEach((item) => { itemCount += parseInt(item.quantity); });
            this.itemCount = itemCount;
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

            // Guard: if variants exist, user must select one first
            if (this.varientList.length > 0 && !this.size) {
                const Toast = Swal.mixin({
                    toast: true, position: "top-end", showConfirmButton: false,
                    timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon: "warning", title: "Please select a variant first." });
                return;
            }

            const up_price = this.pro_row.last_price;
            const warrantyamt = this.warrantyamt;
            const warranty_id = this.warranty_id;
            const warranty_name = this.warranty_name;
            const pro_price = this.pro_row.price;
            const qty = this.pro_row.stock_qty;

            // Helper: stamp all variant/price fields onto a product object
            const stampProduct = (productToAdd) => {
                productToAdd.last_price = up_price;
                productToAdd.price = pro_price;
                productToAdd.stock_qty = qty;
                productToAdd.color = this.color;
                productToAdd.size = this.size;   // ✅ selected variant name
                if (warranty_id) {
                    productToAdd.warrantyamt = warrantyamt || '';
                    productToAdd.warranty_id = warranty_id || '';
                    productToAdd.warranty_name = warranty_name || '';
                }
                return productToAdd;
            };

            // ✅ Helper: find existing cart entry matching product AND selected variant
            const findExisting = () =>
                this.cart.find(
                    (item) =>
                        item.product.id === productId &&
                        item.product.size === this.size   // ✅ match by variant too
                );

            const showToast = (icon, title) => {
                const Toast = Swal.mixin({
                    toast: true, position: "top-end", showConfirmButton: false,
                    timer: 3000, timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    }
                });
                Toast.fire({ icon, title });
            };

            try {
                const productToAdd = this.product.find((product) => product.id === productId);

                if (!productToAdd || !this.updatedQuantity) {
                    showToast("error", "Product or quantity is invalid.");
                    return;
                }

                // ✅ Stamp selected variant + price onto a fresh copy so we don't
                //    mutate the source array for different variant selections
                const cartProduct = stampProduct({ ...productToAdd });

                const existingItem = findExisting();
                if (existingItem) {
                    // Same product + same variant already in cart → just bump qty
                    existingItem.quantity += this.updatedQuantity;
                    existingItem.product.size = this.size;   // keep in sync
                    existingItem.product.last_price = up_price;
                } else {
                    // New entry (new product OR same product but different variant)
                    this.cart.push({ product: cartProduct, quantity: this.updatedQuantity });
                    showToast("success", "Product successfully Added to cart");
                }

                this.saveCart();
                this.cartItemCount();
                console.log('Item added to cart successfully. size:', this.size);
            } catch (error) {
                console.error('Error adding item to cart:', error);
                showToast("error", "Product not Added to cart");
            }
        },
        // end cart

        initLightSlider() {
            let thumbnails = document.getElementsByClassName('Slider-thumbnail');
            let activeImages = document.getElementsByClassName('active');
            for (let i = 0; i < thumbnails.length; i++) {
                thumbnails[i].addEventListener('click', (e) => {
                    e.preventDefault();
                    if (activeImages.length > 0) { activeImages[0].classList.remove('active'); }
                    thumbnails[i].classList.add('active');
                    this.featuresimgs = this.slider_img[i].thumnail;
                });
            }
        },
        changeSlide(index) {
            this.currentIndex = index;
            this.featuresimgs = this.slider_img[index].thumnail;
        },
        async fetchData() {
            const prosulg = this.$route.params.slug;
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
            this.loading = false;
            $(".product_details").html(response.data.data.pro_row.description);
            $(".shortDescPro").html(response.data.data.pro_row.short_description);
        },
    },
}
</script>

<style scoped>
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
    padding: 4px;
}

.Slider-thumbnails {
    width: 100%;
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
.Slider-thumbnail:not(:first-of-type) {
    margin-left: 10px;
}

/* zoom in out */
.Slider {
    max-width: 500px;
}

.zoom-container {
    position: relative;
    border: 3px solid var(--color_Primary);
    overflow: hidden;
}

.sliderimg {
    width: 100%;
    transition: transform 0.3s ease;
    border-radius: 6px;
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

/* ── Variant tile grid ── */
.variant-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-top: 8px;
}

.variant-tile {
    position: relative;
    min-width: 52px;
    padding: 6px 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 13px;
    text-align: center;
    cursor: pointer;
    user-select: none;
    background: #fff;
    color: #333;
    transition: border-color 0.15s;
}

.variant-tile:hover {
    border-color: #f97316;
}

.variant-tile.active {
    border-color: #f97316;
    border-width: 1.5px;
}

/* Orange triangle corner indicator */
.corner-mark {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 0 0 14px 14px;
    border-color: transparent transparent #f97316 transparent;
    border-radius: 0 0 3px 0;
}
</style>
