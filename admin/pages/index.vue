<template>
    <div class="page-wrapper" v-if="$auth.loggedIn">
        <div class="page-content">
            <span v-if="userData.role_id === 1">
                <div class="row g-3 row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-xl-5">

                    <div class="col">
                        <div class="card radius-10 bg-gradient-deepblue h-100">
                            <Nuxt-link to="/ecommarce/product-list" class="text-decoration-none">
                                <div class="card-body">
                                    <div class="d-flex align-items-center text-white">
                                        <p class="mb-0">Products</p>
                                        <i class="bx bx-envelope fs-3 ms-auto"></i>
                                    </div>
                                </div>
                            </Nuxt-link>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card radius-10 bg-gradient-orange h-100">
                            <Nuxt-link to="/orders/order-list" class="text-decoration-none">
                                <div class="card-body">
                                    <div class="d-flex align-items-center text-white">
                                        <p class="mb-0">All Orders</p>
                                        <i class="bx bx-envelope fs-3 ms-auto"></i>
                                    </div>
                                </div>
                            </Nuxt-link>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card radius-10 bg-gradient-ohhappiness h-100">
                            <Nuxt-link to="/ecommarce/category-list" class="text-decoration-none">
                                <div class="card-body">
                                    <div class="d-flex align-items-center text-white">
                                        <p class="mb-0">Categories</p>
                                        <i class="bx bx-envelope fs-3 ms-auto"></i>
                                    </div>
                                </div>
                            </Nuxt-link>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card radius-10 bg-gradient-deepblue h-100">
                            <Nuxt-link to="/brands/brands-list" class="text-decoration-none">
                                <div class="card-body">
                                    <div class="d-flex align-items-center text-white">
                                        <p class="mb-0">Brands</p>
                                        <i class="bx bx-envelope fs-3 ms-auto"></i>
                                    </div>
                                </div>
                            </Nuxt-link>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card radius-10 bg-gradient-deepblue h-100">
                            <Nuxt-link to="/user/user_list" class="text-decoration-none">
                                <div class="card-body">
                                    <div class="d-flex align-items-center text-white">
                                        <p class="mb-0">User List</p>
                                        <i class="bx bx-envelope fs-3 ms-auto"></i>
                                    </div>
                                </div>
                            </Nuxt-link>
                        </div>
                    </div>

                  
                    <!-- repeat .col only -->

                </div>

            </span>

            <!--end row-->
            <div class="overlay toggle-icon"></div>
            <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        </div>
    </div>
</template>

<script>
export default {
    head: {
        title: 'Dashboard',
    },

    data() {
        return {
            userData: {
                role_id: '',
            },
        }
    },
    mounted() {
        this.defaultLoadingData();
    },
    computed: {

        loggedIn() {
            return this.$store.state.auth.loggedIn;
        },
        user() {
            return this.$store.state.auth.user
        }
    },
    methods: {

        defaultLoadingData() {
            this.$axios.get('/auth/showProfileData').then(response => {
                console.log(response.data.data.role_id)
                this.userData.role_id = response.data.data.role_id;

            });
        },
    },

}
</script>

<style></style>
