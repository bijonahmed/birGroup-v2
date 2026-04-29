<template>
  <div>
    <LogoAndPayment />
    <!-- navbar section start here  -->
    <NavbarSecond />
    <!-- Main section start here  -->
    <section class="main_content">
      <div class="container">
        <form @submit.prevent="placeOrder()" id="formrest" class="forms-sample" enctype="multipart/form-data">
          <div class="row">
            <div class="col-md-8">
              <div class="mt-2">
                <div class="checkout-billing">
                  <h6 class="section-title">Billing Details</h6>
                  <div class="row g-3 mb-4">
                    <div class="col-md-12">
                      <label class="form-label" style="font-size:12px;">Full Name</label>
                      <input type="text" class="form-control custom-input" v-model="insertdata.name"
                        placeholder="Enter your full name">
                    </div>
                    <div class="col-md-6">
                      <label class="form-label" style="font-size:12px;">Email</label>
                      <input type="email" class="form-control custom-input" v-model="insertdata.email"
                        placeholder="Enter your email">
                    </div>
                    <div class="col-md-6">
                      <label class="form-label" style="font-size:12px;">Phone Number</label>
                      <input type="text" class="form-control custom-input" maxlength="11"
                        v-model="insertdata.phone_number" placeholder="Enter your phone number" @input="onlyNumber">
                    </div>
                  </div>
                  <h6 class="section-title">Shipping Address</h6>
                  <div class="row g-3">
                    <div class="col-md-6">
                      <label class="form-label" style="font-size:12px;">
                        Shipping Address
                      </label>
                      <input type="text" class="form-control custom-input" v-model="shipp_address"
                        placeholder="Enter your shipping address">
                    </div>
                    <div class="col-md-6">
                      <label class="form-label" style="font-size:12px;">
                        Shipping Phone Number
                      </label>
                      <input type="text" class="form-control custom-input" maxlength="11" v-model="shipp_phoneNumber"
                        placeholder="Enter your shipping phone number" @input="onlyNumbership">
                    </div>
                  </div>
                </div>
              </div>
              <div class="items_details">
                <h5>Items</h5>
                <div class="checkItem" v-for="item in cart" :key="item.product.id">
                  <div class="row align-items-center">
                    <!-- Product Info -->
                    <div class="col-md-8">
                      <div class="item d-flex align-items-center">
                        <nuxt-link :to="`/product-details/${item.product.pro_slug}`"
                          class="d-flex align-items-center text-dark checkIProtem">
                          <div style="margin-right:12px;">
                            <img :src="item.product.thumnail_img" class="img-fluid" alt=""
                              style="height:80px;width:80px;border:1px solid #e5e5e5;padding:5px;border-radius:8px;background:#fff;box-shadow:0 2px 6px rgba(0,0,0,0.08);" />
                          </div>
                          <div style="width:45%" class="d-none">
                            <b style="font-size:12px;color:#222;">
                              {{ item.product.name }}
                            </b>
                          </div>
                        </nuxt-link>
                        <div style="margin-left:20px;">
                          <span style="font-size:13px;">QTY: {{ item.quantity }}</span>
                        </div>
                        <div style="margin-left:15px;">
                          <button type="button" @click="removeFromCart(item.product)">
                            <i class="fa-solid fa-trash-can"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                    <!-- Price Section -->
                    <div class="col-md-4 d-flex justify-content-center align-items-center">
                      <div style="text-align:center;font-size:13px;">
                        <div class="d-none">
                          <span class="badges px-1"
                            v-if="item.product.discount_status == 1 && item.product.discount !== 0">
                            {{ item.product.discount }}%
                          </span>
                          <span class="badges px-1"
                            v-if="item.product.discount_status == 2 && item.product.discount !== 0">
                            BDT {{ item.product.discount.toFixed(2) }}
                          </span>
                        </div>
                        <p style="margin:0;font-size:13px;">
                          <b style="color:#0C356A;font-size:13px;">
                            BDT {{ item.product.last_price.toFixed(2) }}
                          </b>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="cart_summary">
                <div class="side_title">
                  <h5>Delivery Charge</h5>
                </div>
                <div class="d-flex justify-content-between">
                  <div class="payment-buttons d-flex gap-3 mb-3">
                    <div class="checkout__total--amount d-flex gap-2">
                      <label v-for="option in shippingOptions" :key="option.id" class="delivery-option inline-option"
                        :class="{ active: selectedShipping === option.price }">
                        <input type="radio" name="shippingOption" :value="option.price" v-model="selectedShipping">
                        <div class="label-content">
                          {{ option.name }} ({{ option.price }})
                        </div>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="cart_sidebar">
                <div class="pirce_summary">
                  <table class="table">
                    <tbody>
                      <tr>
                        <td>
                          <strong>Order Summary</strong>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td><strong>Items Total</strong></td>
                        <td class="text-end">BDT {{ sumOfLastPrices.toFixed(2) }}</td>
                      </tr>
                      <tr v-if="COD_fee !== 0 && selectedPayment == 'COD'">
                        <td><strong>Cash on delivery Fee </strong></td>
                        <td class="text-end">BDT {{ COD_fee }}</td>
                      </tr>
                      <tr>
                        <td><strong>Delivery Fee </strong></td>
                        <td class="text-end">BDT {{ sumOfFlatRatePrices.toFixed(2) }}</td>
                      </tr>
                      <!-- ✅ Coupon Discount Row — shown only if a coupon is applied from sessionStorage -->
                      <tr v-if="appliedCoupon && appliedCoupon.couponDiscount">
                        <td>
                          <strong class="text-success">Coupon Discount</strong>
                          <span class="badge bg-success ms-1" style="font-size:10px;vertical-align:middle;">
                            {{ appliedCoupon.couponCode }}
                          </span>
                        </td>
                        <td class="text-end text-success">
                          - BDT {{ parseFloat(appliedCoupon.couponDiscount).toFixed(2) }}
                        </td>
                      </tr>
                      <!-- ✅ Old coupon discount row (manual coupon entry) — kept for backward compat -->
                      <tr id="discount" v-if="!appliedCoupon && discount">
                        <td><strong class="text-success">Coupon Discount</strong></td>
                        <td class="text-end text-success">
                          - BDT {{ typeof discount === 'number' ? discount.toFixed(2) : '' }}
                        </td>
                      </tr>
                      <tr>
                        <td><strong>Total Payment</strong></td>
                        <!-- ✅ Shows subtotal (after coupon) if coupon applied, else totalSum -->
                        <td class="text-end">
                          <strong style="color:#0C356A;font-size:15px;">
                            BDT {{ finalTotalPayment.toFixed(2) }}
                          </strong>
                        </td>
                      </tr>
                      <tr class="border-0" id="#Paymethod" v-if="this.selectedPayment == 'COD'">
                        <td class="border-0"><strong>Payment method</strong></td>
                        <td class="text-end border-0">
                          <p class="badge bg-success text-white">COD</p>
                        </td>
                      </tr>
                      <tr class="border-0" id="#Paymethod"
                        v-if="this.selectedPayment !== '' && this.selectedPayment !== 'COD'">
                        <td class="border-0"><strong>Payment method</strong></td>
                        <td class="text-end border-0">
                          <p class="badge bg-success-light">Cash on Delivery</p>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="cart_summary">
                    <div class="side_title">
                      <h5>Payment method</h5>
                    </div>
                    <div class="payment-buttons d-flex flex-wrap gap-3 mb-3" style="justify-content:flex-start;">
                      <!-- Cash on Delivery (only option shown) -->
                      <div class="payment-option-inline" :class="{ active: paymentMethod === 'cod' }"
                        @click="selectPayment('cod')"
                        style="cursor:pointer; border:1px solid #e4e6eb; border-radius:12px; padding:10px; display:flex; flex-direction:column; align-items:center; justify-content:center; width:120px; height:120px; background:#fff; box-shadow:0 2px 8px rgba(0,0,0,0.08); transition:0.3s; position:relative; flex:1 1 100px;">
                        <img
                          src="https://t3.ftcdn.net/jpg/06/04/86/68/360_F_604866832_5i9b2mnlQV1Ocgn6OQes0NsANhEEGW95.jpg"
                          style="width:60px;height:60px;object-fit:contain;" alt="Cash">
                        <span style="margin-top:8px; font-size:14px; font-weight:500;">Cash on Delivery</span>
                        <!-- Check mark -->
                        <span v-if="paymentMethod === 'cod'"
                          style="position:absolute; top:5px; right:5px; color:#0C356A; font-size:20px;">✔</span>
                      </div>
                    </div>
                    <!-- Hidden input to capture value if needed -->
                    <input type="hidden" v-model="paymentMethod">
                  </div>
                  <span v-if="cart.length > 0">
                    <button type="submit" class="btn_cart text-center" style="
                        visibility: unset;
                        background-color: #900c3f;
                        color: #fff;
                        margin-top: 10px;
                      ">
                      Place Order
                    </button>
                  </span>
                  <span v-else>
                    <center>Please add to cart.</center>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <input type="text" v-model="selectedPayment" hidden>
        </form>
      </div>
    </section>
    <!-- END Main Section here -->
    <!-- back to top button  -->
    <div class="back_top">
      <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
    </div>
    <Footer />
  </div>
</template>
<script>
import $ from "jquery";
import axios from "axios";
import Common_MobileSidebar from "~/components/Common_MobileSidebar.vue";
import Common_MiniTabNavbar from "~/components/Common_MiniTabNavbar.vue";
import Common_MobileSearchProduct from "~/components/Common_MobileSearchProduct.vue";
import RecentView from "~/components/RecentView.vue";
import NavbarSecond from "../components/NavbarSecond.vue";
export default {
  components: {
    NavbarSecond,
    Common_MobileSidebar,
    Common_MiniTabNavbar,
    Common_MobileSearchProduct,
    RecentView,
  },
  head: {
    title: "Checkout",
  },
  data() {
    return {
      cardList: [],
      cardData: {
        holder_name: '',
        card_number: '',
        expiry_date: '',
      },
      selectedShipping: null,
      shippingOptions: [
        { id: 1, name: "Inside Dhaka", price: 0 },
        { id: 2, name: "Outside Dhaka", price: 0 }
      ],
      billAddress: "",
      shipp_address: "",
      shipp_phoneNumber: "",
      paymentMethod: 'cod',
      user_id: 0,
      userdata: {
        name: "",
        email: "",
        phone_number: "",
        gender: "",
        birthdate: "",
        address: "",
        address_1: "",
        country_1: "",
        landmark_1: "",
        city_1: "",
        phone_1: "",
        address_2: "",
        country_2: "",
        landmark_2: "",
        city_2: "",
        phone_2: "",
        created_at: null,
      },
      getDatas: [],
      insertdata: {
        id: "",
        name: "",
        address: "",
        email: "",
        phone_number: "",
        password: "123456",
        country: "",
        city: "",
        shipper_name: "",
        shipper_email: "",
        shipper_phone_number: "",
        shipper_address: "",
        shipper_country: "",
        shipper_city: "",
        address_1: "",
        country_1: "",
        city_1: "",
        landmark_1: "",
        address_2: "",
        country_2: "",
        city_2: "",
        landmark_2: "",
        addresses: [],
      },
      coupons: {
        couponCode: "",
        price: this.sumOfLastPrices,
      },
      loading: false,
      email: "",
      showDifferentAddress: false,
      differentAddressField: "",
      cart: [],
      notifmsg: "",
      invidecodeError: "",
      errors: {},
      itemCount: 0,
      subtotal: 0,
      updatedQuantity: 0,
      customer_id: "",
      coupon: "",
      dataArray: [],
      sumOfLastPrices: 0,
      sumOfFlatRatePrices: 0,
      totalSum: 0,
      discount: "",
      selectedPayment: '',
      companyData: [],
      COD_fee: 0,
      Dcouponlist: '',
      couponModal: '',
      address: [],
      //  NEW: holds the coupon applied from sessionStorage
      appliedCoupon: null,
    };
  },
  computed: {
    loggedIn() {
      if (!$auth.loggedIn) {
        this.$router.push("/checkout");
      } else {
        this.$router.push("/");
      }
      return this.$auth.loggedIn;
    },

    finalTotalPayment() {
      if (this.appliedCoupon && this.appliedCoupon.subtotal) {
        const couponSubtotal = parseFloat(this.appliedCoupon.subtotal);
        const deliveryFee = parseFloat(this.sumOfFlatRatePrices || 0);
        const codFee = (this.selectedPayment === 'COD') ? parseFloat(this.COD_fee || 0) : 0;
        return couponSubtotal + deliveryFee + codFee;
      }
      return this.totalSum;
    },
  },
  watch: {
    selectedShipping(newVal) {
      this.calculateSumOfLastPrices();
    },
    selectedPayment(newVal) {
      this.calculateSumOfLastPrices();
    },
  },
  mounted() {
    this.getSettingData();
    this.openPromo();
    this.cart.forEach((item) => {
      item.shippingDate = this.calculateShippingDate(item.product.shipping_days);
    });
    //  Load applied coupon from sessionStorage on mount
    this.loadAppliedCoupon();
    if (process.client) {
      this.addCard();
      this.defaultLoadingData();
      this.calculateSubtotal();
      this.loadCart();
      this.cartItemCount();
      this.subtotal = this.calculateSubtotal();
      $(document).ready(function () {
        $(".filter_btn").on("click", function () {
          $(".filter_modal").show();
        });
        $(".filter_close").on("click", function () {
          $(".filter_modal").hide();
        });
      });
    }
    this.openModal();
    this.calculateSumOfLastPrices();
  },
  methods: {

    getSettingData() {
      this.$axios.get("/unauthenticate/settingData")
        .then(response => {
          this.settingData = response.data;
          //console.log("Response Data: " + response.data.data.inside_dv_charge);
          // Update shippingOptions prices from settingData
          this.shippingOptions = [
            { id: 1, name: "Inside Dhaka", price: response.data.data.inside_dv_charge },
            { id: 2, name: "Outside Dhaka", price: response.data.data.outside_dv_charge }
          ];

          // Set default selected shipping price
          this.selectedShipping = response.data.data.inside_dv_charge;
        })
    },

    //  NEW: load appliedCoupon from sessionStorage
    loadAppliedCoupon() {
      try {
        const raw = sessionStorage.getItem('appliedCoupon');
        if (raw) {
          this.appliedCoupon = JSON.parse(raw);
        } else {
          this.appliedCoupon = null;
        }
      } catch (e) {
        this.appliedCoupon = null;
      }
    },
    onlyNumber(e) {
      this.insertdata.phone_number = e.target.value.replace(/[^0-9]/g, '')
    },
    onlyNumbership(e) {
      this.shipp_phoneNumber = e.target.value.replace(/[^0-9]/g, '')
    },
    selectPayment(method) {
      this.paymentMethod = method;
    },
    opendiscount() {
      $(".couponModal").fadeIn();
    },
    closediscount() {
      $(".couponModal").fadeOut();
    },
    copyCode(code) {
      const tempInput = document.createElement('input');
      tempInput.value = code;
      document.body.appendChild(tempInput);
      tempInput.select();
      document.execCommand('copy');
      document.body.removeChild(tempInput);
      const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.onmouseenter = Swal.stopTimer;
          toast.onmouseleave = Swal.resumeTimer;
        },
      });
      Toast.fire({
        icon: "success",
        title: "Code Copied successfully!",
      });
    },
    handlePaymentSelection() {
      this.calculateSumOfLastPrices();
    },
    openModal() {
      $('.billing_address').click(function () {
        $(".bill_address").fadeIn();
      });
      $('.modal_close').click(function () {
        $(".bill_address").fadeOut();
      })
    },
    saveCard() {
      const formData = new FormData();
      formData.append('user_id', this.user_id);
      formData.append('holder_name', this.cardData.holder_name);
      formData.append('card_number', this.cardData.card_number);
      formData.append('expiry_date', this.cardData.expiry_date);
      this.$axios.post('/user/saveCard', formData)
        .then(response => {
          const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.onmouseenter = Swal.stopTimer;
              toast.onmouseleave = Swal.resumeTimer;
            },
          });
          Toast.fire({
            icon: "success",
            title: "Order submitted successfully!",
          });
          $("#cardInput")[0].reset();
        })
        .catch((error) => {
          if (error.response.status === 422) {
            this.errors = error.response.data.errors;
            const errorMessages = Object.values(this.errors).flat();
            const errorMessage = errorMessages.join("<br>");
            const Toast = Swal.mixin({
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
              didOpen: (toast) => {
                toast.onmouseenter = Swal.stopTimer;
                toast.onmouseleave = Swal.resumeTimer;
              },
            });
            Toast.fire({
              icon: "error",
              title: errorMessage,
            });
          }
        });
    },
    addCard() {
      $(".addNewCardBT").click(function () {
        $(".addNewCard").fadeIn();
      });
      $(".backBT").click(function () {
        $(".addNewCard").fadeOut();
      });
    },
    calculateSumOfLastPrices() {
      let selectedPayment = this.selectedPayment ? this.selectedPayment : '0';
      let COD_fee = this.COD_fee;
      const cartData = localStorage.getItem("cart");
      if (cartData) {
        const cart = JSON.parse(cartData);
        let sumOfLastPrices = 0;
        let totalPrice = 0;
        cart.forEach((item) => {
          if (item.product.warrantyamt) {
            totalPrice += parseFloat(item.product.last_price) * item.quantity;
            sumOfLastPrices = totalPrice + item.product.warrantyamt * item.quantity;
          } else {
            sumOfLastPrices += parseFloat(item.product.last_price) * item.quantity;
          }
        });
        let sumOfFlatRatePrices = parseFloat(this.selectedShipping || 0);
        let subsum = sumOfLastPrices + sumOfFlatRatePrices;
        let allsum;
        if (selectedPayment === "COD") {
          allsum = parseFloat(subsum) + parseFloat(COD_fee);
        } else {
          allsum = subsum;
        }
        this.coupons.price = allsum;
        this.sumOfLastPrices = sumOfLastPrices;
        this.sumOfFlatRatePrices = sumOfFlatRatePrices;
        this.totalSum = allsum;
      }
    },
    updateSelectedData() { },
    getPrice(item) {
      let final_price = 0;
      const price = item.quantity * item.product.last_price;
      if (item.product.warrantyamt) {
        final_price = price + item.quantity * item.product.warrantyamt;
      } else {
        final_price = price;
      }
      return final_price;
    },
    getSave(item) {
      const save =
        item.quantity * item.product.price - item.quantity * item.product.last_price;
      return save;
    },
    calculateShippingDate(shippingDays) {
      const currentDate = new Date();
      const currentHour = currentDate.getHours();
      const nextDay = currentHour >= 17 ? 1 : 0;
      const shippingDate = new Date();
      shippingDate.setDate(currentDate.getDate() + (shippingDays ? shippingDays : nextDay));
      const options = {
        weekday: "short",
        month: "short",
        day: "numeric",
        year: "numeric",
      };
      const formattedDate = shippingDate.toLocaleDateString("en-US", options);
      return formattedDate;
    },
    async getCouponData() {
      const formData = {
        couponCode: this.coupons.couponCode,
        price: this.coupons.price,
        user_id: this.insertdata.id,
      };
      this.$axios
        .post(`/unauthenticate/couponDiscount`, formData)
        .then((response) => {
          this.coupon = response.data.coupon_data;
          this.totalSum = response.data.coupon_data.last_discount_price;
          this.discount = this.coupon.discount;
          this.coupon_id = response.data.coupon_data.id;
          $("#discount").fadeIn();
          $("#discount_msg").fadeIn();
          $("#errorDiscount").fadeOut();
        })
        .catch((error) => {
          $("#errorDiscount").fadeIn();
          this.errors = error.response.data.errors;
          const errorMessages = Object.values(this.errors).flat();
          const Toast = Swal.mixin({
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
              toast.onmouseenter = Swal.stopTimer;
              toast.onmouseleave = Swal.resumeTimer;
            },
          });
          Toast.fire({
            icon: "error",
            title: errorMessages,
          });
        });
    },
    openPromo() {
      $(".btn_promo").on("click", function () {
        $(".promo").fadeIn();
      });
      $(".modal_close").on("click", function () {
        $(".promo").fadeOut();
      });
    },
    copybillingAddress() {
      this.insertdata.shipper_name = this.insertdata.name;
      this.insertdata.shipper_email = this.insertdata.email;
      this.insertdata.shipper_phone_number = this.insertdata.phone_number;
      this.insertdata.shipper_address = this.insertdata.address;
      this.insertdata.shipper_country = this.insertdata.country;
      this.insertdata.shipper_city = this.insertdata.city;
    },
    defaultLoadingData() {
      this.$axios.get("/auth/showProfileData").then((response) => {
        this.insertdata.id = response.data.data.id;
        this.insertdata.name = response.data.data.name;
        this.getDatas = response.data.data;
        this.insertdata.email = response.data.data.email;
        this.insertdata.phone_number = response.data.data.phone_number;
        this.address = response.data.address;
        if (this.address.length > 0) {
          this.shipp_address = "";
          this.billAddress = "";
        }
        this.user_id = response.data.data.id;
      });
    },
    getcompanyData() {
      this.$axios.get('/setting/getCompanyData')
        .then(response => {
          this.companyData = response.data;
          this.COD_fee = response.data.transaction_fee;
        });
    },
    defaultLoading() {
      const id = this.insertdata.id;
      this.$axios.get(`/user/cardlist/${id}`).then(response => {
        this.cardList = response.data;
      }).catch(error => { });
    },
    clearCart() {
      this.loading = true;
      localStorage.removeItem("cart");
      this.cart = [];
      this.cartItemCount();
      setTimeout(() => {
        this.loading = false;
      }, 2000);
    },
    placeOrder() {
      if (!this.paymentMethod) {
        Swal.fire({ icon: "error", title: "Please select a payment method." });
        return;
      }
      if (!this.insertdata.name || !this.insertdata.email || !this.insertdata.phone_number) {
        Swal.fire({ icon: "error", title: "Please fill in all billing details." });
        return;
      }
      if (!this.shipp_phoneNumber || !this.shipp_address) {
        Swal.fire({ icon: "error", title: "Please fill in all shipping details." });
        return;
      }
      this.selectedPayment = this.paymentMethod;
      const formData = new FormData();
      formData.append("cart", JSON.stringify(this.cart));
      // Send the coupon-adjusted total as subTotal if coupon is applied
      formData.append("subTotal", this.finalTotalPayment.toFixed(2));
      formData.append("item_total", this.sumOfLastPrices);
      formData.append("delivery_fee", this.sumOfFlatRatePrices);
      // ✅ Find the selected shipping option and append its name
      const selectedOption = this.shippingOptions.find(
        option => option.price === this.selectedShipping
      );
      formData.append("delivery_type", selectedOption ? selectedOption.name : '');
      // Send coupon info if present
      if (this.appliedCoupon) {
        formData.append("coupon_id", this.appliedCoupon.coupon_id);
        formData.append("coupon_code", this.appliedCoupon.couponCode);
        formData.append("coupon_discount", this.appliedCoupon.couponDiscount);
      }
      formData.append("shipp_phoneNumber", this.shipp_phoneNumber);
      formData.append("shipp_address", this.shipp_address);
      formData.append("Cutomer_name", this.insertdata.name);
      formData.append("Cutomer_email", this.insertdata.email);
      formData.append("Cutomer_phone_number", this.insertdata.phone_number);
      formData.append("payment_staus", this.selectedPayment);
      const headers = { "Content-Type": "multipart/form-data" };
      this.$axios
        .post("/order/submitOrder", formData, { headers })
        .then((response) => {
          const order_id = response.data.order_id;
          const orderConfirmData = {
            order_id: order_id,
            customerName: this.insertdata.name,
            customerEmail: this.insertdata.email,
            password: this.insertdata.password,
            customerPhone: this.insertdata.phone_number,
            shippingAddress: this.shipp_address,
            shippingPhone: this.shipp_phoneNumber,
            paymentMethod: this.paymentMethod,
            cartItems: JSON.parse(JSON.stringify(this.cart)),
            itemTotal: this.sumOfLastPrices.toFixed(2),
            deliveryFee: this.sumOfFlatRatePrices.toFixed(2),
            couponDiscount: this.appliedCoupon ? this.appliedCoupon.couponDiscount : 0,
            total: this.finalTotalPayment.toFixed(2),
            date: new Date().toLocaleDateString('en-GB'),
          };
          sessionStorage.setItem('lastOrderData', JSON.stringify(orderConfirmData));
          // ✅ Clear the applied coupon after order is placed
          sessionStorage.removeItem('appliedCoupon');
          Swal.fire({
            icon: "success",
            title: "Order submitted successfully!",
            toast: true,
            position: "top-end",
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
          });
          this.clearCart();
          this.$router.push("/order-confirm");
        })
        .catch((error) => {
          if (error.response.status === 422) {
            this.errors = error.response.data.errors;
            const errorMessages = Object.values(this.errors).flat();
            const errorMessage = errorMessages.join("<br>");
            Swal.fire({
              icon: "error",
              title: errorMessage,
              toast: true,
              position: "top-end",
              showConfirmButton: false,
              timer: 3000,
              timerProgressBar: true,
            });
          }
        });
    },
    updateQuantity(productId, newQuantity) {
      this.loading = true;
      const index = this.cart.findIndex((item) => item.product.id === productId);
      if (index !== -1) {
        this.cart[index].quantity = newQuantity;
        this.saveCart();
        this.calculateSubtotal();
        setTimeout(() => { this.loading = false; }, 2000);
      }
    },
    loadCart() {
      this.loading = true;
      const savedCart = localStorage.getItem('cart');
      if (savedCart) {
        this.cart = JSON.parse(savedCart);
      }
      let itemCount = 0;
      this.cart.forEach((item) => {
        if (item.product) {
          itemCount += parseInt(item.quantity);
        }
      });
      this.itemCount = itemCount;
      setTimeout(() => { this.loading = false; }, 2000);
    },
    handleCartItemCountUpdated(itemCount) {
      this.itemCount = itemCount;
    },
    removeFromCart(product) {
      this.loading = true;
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
        this.calculateSumOfLastPrices();
        setTimeout(() => { this.loading = false; }, 1000);
      }
    },
    saveCart() {
      localStorage.setItem("cart", JSON.stringify(this.cart));
    },
    addToCart(productId) {
      const productToAdd = this.prouducts.find((product) => product.id === productId);
      const existingItem = this.cart.find((item) => item.product.id === productId);
      if (!existingItem) {
        this.cart.push({ product: productToAdd, quantity: 1 });
      }
      this.saveCart();
      this.cartItemCount();
      this.calculateSubtotal();
    },
    cartItemCount() {
      let itemCount = 0;
      this.cart.forEach((item) => {
        itemCount += parseInt(item.quantity);
      });
      this.itemCount = itemCount;
      this.$eventBus.$emit("cartItemCountUpdated", this.itemCount);
    },
    calculateSubtotal() {
      let subtotal = 0;
      this.cart.forEach((item) => {
        const product = item.product;
        const priceWithoutCommas = product.price;
        const priceAsNumber = parseFloat(priceWithoutCommas);
        if (!isNaN(item.quantity) && !isNaN(priceAsNumber)) {
          subtotal += item.quantity * priceAsNumber;
        } else {
        //  console.error("Invalid quantity or price:", item.quantity, product.price);
        }
      });
      return (this.subtotal = subtotal);
    },
    async getQuponList() {
      const minShop = this.totalSum;
      const user_id = this.user_id;
      const queryParams = { minShop, user_id };
      this.$axios.get('/setting/getcoupons', { params: queryParams })
        .then(response => {
          this.Dcouponlist = response.data.couponList;
        })
        .catch(error => {
          console.error('Error:', error);
        });
    },
  },
};
</script>
<style>
.btn-check:checked+.btn,
.btn.active,
.btn.show,
.btn:first-child:active,
:not(.btn-check)+.btn:active {
  background-color: #933c5e3b;
}

.checkItem {
  border-bottom: 1px solid #e1e1e1;
  padding-top: 15px;
}

.checkItem:last-child {
  border: none;
}

#discount {
  display: none;
}

.paymentMethod_tabs .btn-check:checked {
  color: #000;
}

.paymentMethod_tabs h6,
.paymentMethod_tabs h3,
.paymentMethod_tabs p,
.paymentMethod_tabs span {
  color: #000;
}

.addNewCard {
  display: none;
}

.checkIProtem {
  width: 310px;
}

#errorDiscount,
#discount_msg {
  display: none;
}

.checkout-billing {
  background: #fff;
  padding: 25px;
  border-radius: 10px;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
}

.section-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 15px;
  color: #222;
}

.custom-input {
  height: 45px;
  border-radius: 6px;
  border: 1px solid #e4e6eb;
  font-size: 14px;
  padding-left: 12px;
  transition: all .3s ease;
}

.custom-input:focus {
  border-color: #0C356A;
  box-shadow: 0 0 0 0.15rem rgba(12, 53, 106, .15);
}

.custom-input::placeholder {
  color: #9aa1a9;
  font-size: 13px;
}

.delivery-option {
  border: 1px solid #ddd;
  padding: 8px 15px;
  border-radius: 6px;
  font-size: 13px;
  cursor: pointer;
  display: flex;
  align-items: center;
}

.delivery-option input {
  margin-right: 6px;
}

.delivery-option.active {
  border-color: #0C356A;
  background: #f4f7fb;
}

.payment-option-inline.active {
  border: 2px solid #0C356A;
  background: #f4f7fb;
}
</style>
