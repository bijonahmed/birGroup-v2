<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />
        
        <div class="loading-indicator" v-if="loading">
            <div class="loader-container">
                <center class="loader-text">Loading...</center>
                <img src="/loader/loader.gif" loading="lazy" alt="Loader" />
            </div>
        </div>

        <section class="main_content">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="all_cat">
                            <div class="all_cat_title">
                                <h5>All Categories</h5>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-6" v-for="category in categories" :key="category.id">
                                    <h6>{{ category.name }}</h6>
                                    <ul v-for="childCategory in category.children" :key="childCategory.id">
                                        <li>
                                            <a :href="`/category/category-filter?slug=${childCategory.slug}`">
                                                {{ childCategory.name }}
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="back_top">
            <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
        </div>
        <Footer />
    </div>
</template>

<script>
import NavbarSecond from '../../components/NavbarSecond.vue';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';
import CategoryProductFilter from '~/components/CategoryProductFilter.vue';
import ExtraDiscount from '~/components/ExtraDiscount.vue';
import CategoryMultipleProduct from '~/components/CategoryMultipleProduct.vue';

export default {
    components: {
        NavbarSecond,
        Common_MobileSidebar,
        Common_MiniTabNavbar,
        Common_MobileSearchProduct,
        CategoryProductFilter,
        ExtraDiscount,
        CategoryMultipleProduct
    },
    head: {
        title: 'All Categorys',
    },
    data() {
        return {
            limit: 12,
            categories: [],
            loading: false
        };
    },
    async mounted() {
        await this.fetchData();
        // ✅ Fix: Force recalculate page height after data loads
        this.$nextTick(() => {
            window.dispatchEvent(new Event('resize'));
        });
    },
    methods: {
        redirectCategory(slug) {
            this.$router.push({
                path: '/category/category-grid',
                query: { slug: slug }
            });
        },
        async fetchData() {
            this.loading = true;
            // ✅ Fix: Prevent body scroll lock during loading
            document.body.style.overflow = 'hidden';
            
            await this.$axios.get(`/unauthenticate/getCategoryList`)
                .then(response => {
                    this.categories = response.data;
                })
                .catch(error => {
                    console.error(error);
                })
                .finally(() => {
                    this.loading = false;
                    // ✅ Fix: Restore body scroll after loading
                    document.body.style.overflow = '';
                    document.body.style.height = '';
                    
                    // ✅ Fix: Scroll to top so mobile renders full page
                    this.$nextTick(() => {
                        window.scrollTo(0, 0);
                    });
                });
        }
    }
}
</script>

<style scoped>
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
    /* ✅ Fix: Prevent overlay from blocking scroll calculation */
    pointer-events: none;
}

.loader-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    pointer-events: all;
}

.loader-text {
    margin: 0;
}
</style>