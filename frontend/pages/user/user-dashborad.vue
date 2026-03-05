<template>
    <div>
        <LogoAndPayment />
        <!-- navbar section start here  -->
        <NavbarSecond />
        <!-- navbar section end here  -->


        <!-- Main section start here  -->
        <section class="main_content ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <userSidebar />
                    </div>
                    <div class="col-md-9 ps-md-0">

                        <!-- recent view part end here  -->
                        <div class="main_profile mt-3">

                            <div class="recent_orders">

                                <!-- {{ orders }} -->
                                <div class="recent_orders"
                                    style="background:#fff;padding:20px;border-radius:8px;box-shadow:0 2px 10px rgba(0,0,0,0.08);font-size:14px;">

                                    <h4 style="font-size:18px;font-weight:600;margin-bottom:15px;color:#333;">
                                        My Orders Lists
                                    </h4>

                                    <table class="table" style="width:100%;border-collapse:collapse;font-size:14px;">

                                        <thead style="background:#f7f7f7;">
                                            <tr style="border-bottom:1px solid #eaeaea;">
                                                <th style="padding:10px;font-weight:600;">Order ID</th>
                                                <th class="text-center" style="padding:10px;font-weight:600;">Place On
                                                </th>
                                                <th class="text-center" style="padding:10px;font-weight:600;">Quantity
                                                </th>
                                                <th class="text-center" style="padding:10px;font-weight:600;">Total</th>
                                                <th class="text-center" style="padding:10px;font-weight:600;">Status
                                                </th>
                                                <th style="padding:10px;"></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr v-for="order in orders" :key="order.id"
                                                style="border-bottom:1px solid #f1f1f1;transition:0.3s;">

                                                <td style="padding:12px;font-weight:500;color:#333;">
                                                    {{ order.orderId }}
                                                </td>

                                                <td class="text-center" style="padding:12px;color:#555;">
                                                    {{ order.placeOn }}
                                                </td>

                                                <td class="text-center" style="padding:12px;">
                                                    {{ order.qty }}
                                                </td>

                                                <td class="text-center"
                                                    style="padding:12px;font-weight:600;color:#0C356A;">
                                                    ৳ {{ order.total }}
                                                </td>

                                                <td class="text-center" style="padding:12px;">

                                                    <span v-if="order.name == 'Cancelled or Returned'"
                                                        style="background:#ffe5e5;color:#c00;padding:4px 10px;border-radius:20px;font-size:12px;">
                                                        {{ order.name }}
                                                    </span>

                                                    <span v-else-if="order.name == 'Delivered'"
                                                        style="background:#e6f7ed;color:#0a8a3a;padding:4px 10px;border-radius:20px;font-size:12px;">
                                                        {{ order.name }}
                                                    </span>

                                                    <span v-else
                                                        style="background:#e7f1ff;color:#0C356A;padding:4px 10px;border-radius:20px;font-size:12px;">
                                                        {{ order.name }}
                                                    </span>

                                                </td>

                                                <td style="padding:10px;">
                                                    <button
                                                        style="border:none;background:#0C356A;color:#fff;width:36px;height:36px;border-radius:6px;display:flex;align-items:center;justify-content:center;cursor:pointer;transition:0.3s;"
                                                        @click="trackOrder(order.orderId)">

                                                        <i class="fa-regular fa-eye"></i>

                                                    </button>
                                                </td>

                                            </tr>
                                        </tbody>

                                    </table>
                                </div>

                            </div>




                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Main section end here  -->
        <!-- back to top button  -->
        <div class="back_top">
            <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
        </div>
        <Footer />
    </div>
</template>
<script>
import $ from "jquery";

import NavbarSecond from '~/components/NavbarSecond.vue';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';
import userSidebar from '~/components/userSidebar.vue';


export default {
    // middleware: 'IsUser',
    components: {
        NavbarSecond,
        Common_MobileSidebar,
        Common_MiniTabNavbar,
        Common_MobileSearchProduct,
        userSidebar,
    },
    head: {
        title: 'Dashboard',
    },
    mounted() {
        this.setupEventHandlers();
        this.loadingOrders();
    },
    data() {
        return {
            loading: false,
            orders: [],
            errors: {},
        }
    },
    methods: {
        async loadingOrders() {
            this.loading = true;
            await this.$axios.get(`/order/allOrders`).then(response => {
                this.orders = response.data.orderdata;
            })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false; // Hide loader after response
                });;

        },
        trackOrder(orderId) {

            this.$router.push({
                path: '/user/order-details',
                query: {
                    orderId: orderId
                }
            })

        },
        setupEventHandlers() {
            // Ensure DOM elements exist before executing jQuery functions
            $(".post_mdal_open").click(function () {
                $(".post_mdal_").fadeIn();
                $(".product_slider").css("z-index", "0");
            })
            $(".post_mdal_open").click(function () {
                $(".search_bar").css("z-index", "0");
                $(".product_slider").css("z-index", "0");
            })
            $(".bt_close").click(function () {
                $(".post_mdal_").fadeOut();
                $(".search_bar").css("z-index", "4");
                $(".product_slider").css("z-index", "1");
            })
        },
    },
}
</script>