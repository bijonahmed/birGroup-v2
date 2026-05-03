<template>
    <header>
        <!-- <div class="header-message-list"></div>
    <div class="header-notifications-list"></div>
    <div class="mobile-search-icon"></div> -->
        <div class="topbar d-flex align-items-center" v-if="user">
            <nav class="navbar navbar-expand">
                <div class="mobile-toggle-menu" id="menu-toggle" @click="showhidesidebar"><i class='bx bx-menu'></i>
                </div>

                <div class="top-menu ms-auto">
                    <ul class="navbar-nav align-items-center">

                        <li class="nav-item dropdown dropdown-large">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"> <i class='bx bx-category'></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">

                                <div class="row row-cols-3 g-3 p-3">

                                    <!-- Orders -->
                                    <div class="col text-center">
                                        <NuxtLink to="/orders/order-list" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-cosmic text-white">
                                                <i class='bx bx-group'></i>
                                            </div>
                                            <div class="app-title">Orders</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Products -->
                                    <div class="col text-center">
                                        <NuxtLink to="/orders/order-report" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-burning text-white">
                                                <i class='bx bx-atom'></i>
                                            </div>
                                            <div class="app-title">Products</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Reports -->
                                    <div class="col text-center">
                                        <NuxtLink to="/reports" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-lush text-white">
                                                <i class='bx bx-shield'></i>
                                            </div>
                                            <div class="app-title">Reports</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Sellers -->
                                    <div class="col text-center">
                                        <NuxtLink to="/seller/allseller" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-kyoto text-dark">
                                                <i class='bx bx-notification'></i>
                                            </div>
                                            <div class="app-title">Sellers</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Categories -->
                                    <div class="col text-center">
                                        <NuxtLink to="/ecommarce/category-list" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-blues text-dark">
                                                <i class='bx bx-file'></i>
                                            </div>
                                            <div class="app-title">Categories</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Coupon -->
                                    <div class="col text-center">
                                        <NuxtLink to="/coupons/all-coupons" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-moonlit text-white">
                                                <i class='bx bx-filter-alt'></i>
                                            </div>
                                            <div class="app-title">Coupon</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Users -->
                                    <div class="col text-center">
                                        <NuxtLink to="/user/user_list" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-moonlit text-white">
                                                <i class='bx bx-user'></i>
                                            </div>
                                            <div class="app-title">Users</div>
                                        </NuxtLink>
                                    </div>

                                    <!-- Settings -->
                                    <div class="col text-center">
                                        <NuxtLink to="/setting/ads-management" class="text-decoration-none">
                                            <div class="app-box mx-auto bg-gradient-moonlit text-white">
                                                <i class='bx bx-cog'></i>
                                            </div>
                                            <div class="app-title">Setting</div>
                                        </NuxtLink>
                                    </div>

                                </div>

                            </div>
                        </li>

                    </ul>
                </div>
                <div class="user-box dropdown">
                    <a class="d-flex align-items-center nav-link dropdown-toggle dropdown-toggle-nocaret" href="#"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <div id="nav_dataimages"></div>

                        <div class="user-info ps-3">
                            <p class="user-name mb-0" style="text-transform: uppercase;">
                                {{ user.name }}
                            </p>
                            <p class="designattion mb-0">Admin</p>
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <Nuxt-link to="/profile" class="dropdown-item" href="javascript:;"><i
                                    class="bx bx-user"></i><span>Profile</span></Nuxt-link>
                        </li>

                        <li>
                            <div class="dropdown-divider mb-0"></div>
                        </li>
                        <li><a class="dropdown-item" href="javascript:;" @click="logout"><i
                                    class='bx bx-log-out-circle'></i><span>Logout</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
</template>

<script>
export default {
    insertdata: {
        image: ''
    },

    computed: {

        loggedIn() {
            return this.$store.state.auth.loggedIn;
        },
        user() {
            return this.$store.state.auth.user
        },

    },
    mounted() {
        this.defaultLoadingData();
    },
    methods: {
        async logout() {
            await this.$auth.logout()
            return location.reload();
        },
        defaultLoadingData() {
            this.$axios.get('/auth/showProfileData').then(response => {
                // console.log(response.data.data.name)
                $('#nav_dataimages').append('<img class="user-img"  src="' + response.data.dataImg + '" />');
            });
        },
        showhidesidebar() {
            console.log("Left Sidebar Open....");
            // e.preventDefault();
            $(".wrapper").toggleClass("toggled");
            // $(".wrapper").html('<div class="wrapper toggle">');
            // $('.wrapper').addClass('wrapper toggled');
        }
    }
}
</script>
