<template>
    <div>
        <div class="nav_bar desktop_view">
            <button type="button" class="btn_menu"><i class="fa-solid fa-bars-staggered"></i></button>
            <div class="nav_menu nav_op ">
                <nav v-if="categories.length > 0">
                    <ul v-for="(category, index) in categories" :key="category.id">
                        <li :key="category.id" v-if="index < limit">
                            <a href="#" class="d-flex justify-content-between align-items-center"
                                @click="redirectMainCategory(category.slug)">
                                <div class="d-flex align-items-center">
                                    <i class="fa-solid fa-list" style="font-size: 10px;"></i>

                                    {{ category.name }}
                                </div> <i class="fa-solid fa-angle-right"></i>
                            </a>
                            <div class="sub_menu">
                                <div class="row" v-if="category.children && category.children.length > 0">
                                    <div class="col-4" v-for="childCategory in category.children"
                                        :key="childCategory.id">

                                        <!-- Clickable child category  @click.prevent="onClickSubCategory(childCategory.id, childCategory.slug)"-->
                                        <h6>
                                            <a href="#"
                                                
                                                :class="['category-link', { active_item: selectedCategory === childCategory.id }]">
                                                <span style="color:var(--color_Primary)">{{ childCategory.name }}</span>
                                            </a>
                                        </h6>

                                        <!-- Subcategories -->
                                        <ul v-if="childCategory.children && childCategory.children.length > 0">
                                            <li v-for="inSubCategory in childCategory.children" :key="inSubCategory.id">
                                                <a href="#" @click.prevent="redirectCategory(inSubCategory.slug)"
                                                    :class="{ active_item: selectedCategory === inSubCategory.id }">
                                                    {{ inSubCategory.name }}
                                                </a>
                                            </li>
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
.category-link {
    color: var(--color_Primary);
    text-decoration: none;
    /* remove default underline */
    transition: color 0.3s;
}

.category-link:hover {
    color: darken(var(--color_Primary), 10%);
}

.category-link.active_item {
    color: #fff;
    /* or any color you want for active */
    background-color: var(--color_Primary);
    padding: 4px 8px;
    border-radius: 4px;
    text-decoration: underline;
    /* optional underline */
}

.sub_menu {
    position: absolute;
    background: #fff;
    width: 1050px;
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
            selectedCategory: null, // <--- add this
        };
    },
    async mounted() {
        await this.fetchData();
    },
    methods: {
        redirectMainCategory(slug) {
            this.$router.push({
                path: '/category/categoryProducts',
                query: {
                    slug: slug
                }
            })
        },

        redirectCategory(slug) {
            console.log('Redirecting to category with slug:', slug);
            this.$router.push({
                path: '/category/category-grid',
                query: {
                    sub_slug: slug
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
