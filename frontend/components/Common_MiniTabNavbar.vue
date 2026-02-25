<template>
    <div>
        <div class="nav_bar desktop_view">
            <button type="button" class="btn_menu"><i class="fa-solid fa-bars-staggered"></i></button>
            <div class="nav_menu nav_op ">
                <nav v-if="categories.length > 0">
                    <ul v-for="(category, index) in categories" :key="category.id">
                        <li :key="category.id" v-if="index < limit">
                            <a href="#" class="d-flex justify-content-between align-items-center"
                                @click="redirectCategory(category.slug)">
                                <div class="d-flex align-items-center">
                                    <i class="fa-solid fa-list" style="font-size: 10px;"></i>

                                    {{ category.name }}
                                </div> <i class="fa-solid fa-angle-right"></i>
                            </a>
                            <div class="sub_menu">
                                <div class="row" v-if="category.children && category.children.length > 0">
                                    <div class="col-4" v-for="childCategory in category.children"
                                        :key="childCategory.id">
                                        <h6><a href="#" @click="redirectCategory(childCategory.slug)"><u style="color: var(--color_Primary)">{{
                                            childCategory.name }}</u></a></h6>

                                        <ul v-if="childCategory.children && childCategory.children.length > 0">
                                            <li v-for="inSubCategory in childCategory.children" :key="inSubCategory.id">
                                                <a href="#" @click="redirectCategory(inSubCategory.slug)">{{
                                                    inSubCategory.name }}----</a></li>

                                        </ul>
                                    </div>

                                </div>

                            </div>
                        </li>

                    </ul>
                    <ul>
                        <li>
                            <Nuxt-link to="/category/all-categorys" class="d-flex justify-content-between">
                                <div><img src="images/cat_svg/more-100.png" alt="">All Categories</div>
                                <div><i class="fa-solid fa-angle-right"></i></div>
                            </Nuxt-link>
                        </li>
                    </ul>

                </nav>
            </div>
        </div>
    </div>
</template>

<style lang="css" scoped>
.sub_menu {
    position: absolute;
    background: #fff;
    width: 700px;
    padding: 20px;
    z-index: 999;

    max-height: 70vh;
    overflow-y: auto;
    overflow-x: hidden;

    border-radius: 8px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
}


.top_bannerOne .sec_One {
    max-height: 380px;
}

.hi-50 {
    height: 49% !important;
    object-fit: cover;
}

.height_100 {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover;
}
</style>
<script>
import axios from 'axios';
export default {
    data() {
        return {
            limit: 12,
            categories: [],
        };
    },
    async mounted() {
        await this.fetchData();
    },
    methods: {
        redirectCategory(slug) {
            this.$router.push({
                path: '/category/category-list',
                query: {
                    slug: slug
                }
            })
        },
        async fetchData() {
            const response = await this.$axios.get(`/unauthenticate/getCategoryList`);
            this.categories = response.data;
        },

    },
};
</script>
