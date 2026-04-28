<template>
    <div>
        <div class="nav_bar desktop_view" @mouseleave="isMenuOpen = false">
            <button type="button" class="btn_menu" @click="toggleMenu" @mouseenter="isMenuOpen = true">
                <i class="fa-solid fa-bars-staggered"></i>
            </button>
            <div class="nav_menu nav_op" :class="{ nav_open: isMenuOpen }" @mouseenter="isMenuOpen = true">
                <nav v-if="categories.length > 0">
                    <ul v-for="(category, index) in categories" :key="category.id">
                        <li :key="category.id" v-if="index < limit" class="has_submenu">
                            <a href="#" class="d-flex justify-content-between align-items-center"
                                @click.prevent="redirectMainCategory(category.slug)">
                                <div class="d-flex align-items-center">
                                    <i class="fa-solid fa-list" style="font-size: 10px;"></i>
                                    {{ category.name }}
                                </div>
                                <i class="fa-solid fa-angle-right"></i>
                            </a>
                            <div class="sub_menu" v-if="category.children && category.children.length > 0">
                                <div class="row">
                                    <div class="col-4" v-for="childCategory in category.children"
                                        :key="childCategory.id">
                                        <h6>
                                            <a :href="`/category/category-filter?slug=${childCategory.slug}`"
                                                :class="['category-link', { active_item: selectedCategory === childCategory.id }]">
                                                {{ childCategory.name }}
                                            </a>
                                        </h6>
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
                                <div><img src="images/cat_svg/more-100.png" alt="" />All Categories</div>
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
.nav_op {
    display: none;
    position: absolute;
    width: 250px;
    height: fit-content;
    z-index: 9;
    left: 8%;
    top: 70%;
    box-shadow: 0 0 20px #00000057;
}
.nav_menu nav ul li {
    border-bottom: 1px solid #dfdfdf;
    padding: 0px 0px;
    transition: .4s all ease-in-out;
    font-size: 13px !important;
}
/* ── Nav Bar ── */
.nav_bar {
    position: relative;
}
/* ── Menu Toggle Button ── */
.btn_menu {
    background: none;
    border: none;
    cursor: pointer;
    padding: 8px;
    font-size: 18px;
    color: inherit;
}
/* ── Nav Dropdown ── */
/* Show via JS toggle */
.nav_op.nav_open {
    display: block;
}
/* Show via CSS hover */
.nav_bar:hover .nav_op {
    display: block;
}
/* ── List items ── */
.nav_op ul {
    list-style: none;
    padding: 6px 0;
    margin: 0;
}
.nav_op ul li a:hover {
    background: #f5f5f5;
    color: var(--color_Primary);
}
/* ── List item — MUST be relative so sub_menu anchors to it ── */
.has_submenu {
    position: static;
    /* keep static so sub_menu is positioned relative to nav_op */
}
/* ── Sub Menu (Mega Menu) ── */
.sub_menu {
    display: none;
    /* hidden by default */
    position: absolute;
    top: 0;
    left: 240px;
    /* sits right next to the nav_op width */
    background: #fff;
    width: 700px;
    min-height: 100%;
    padding: 20px;
    z-index: 999;
    max-height: 70vh;
    overflow-y: auto;
    overflow-x: hidden;
    border-radius: 0 8px 8px 0;
    box-shadow: 4px 0 30px rgba(0, 0, 0, 0.1);
}
/* ✅ Show sub_menu on li hover */
.has_submenu:hover .sub_menu {
    display: block;
}
/* ── Category Link ── */
.category-link {
    color: var(--color_Primary) !important;
    text-decoration: none;
    font-weight: 600;
    font-size: 13px;
    transition: color 0.3s;
}
.category-link:hover {
    opacity: 0.8;
}
.category-link.active_item {
    color: #fff !important;
    background-color: var(--color_Primary);
    padding: 4px 8px;
    border-radius: 4px;
    text-decoration: underline;
}
/* ── Sub category links ── */
.sub_menu ul {
    list-style: none;
    padding: 0;
    margin: 4px 0 12px;
}
.sub_menu ul li a {
    display: block;
    padding: 3px 0;
    font-size: 12px;
    color: #555;
    text-decoration: none;
    transition: color 0.2s;
}
.sub_menu ul li a:hover {
    color: var(--color_Primary);
}
.sub_menu ul li a.active_item {
    color: var(--color_Primary);
    font-weight: 600;
}
/* ── Misc ── */
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
            selectedCategory: null,
            isMenuOpen: false,
        };
    },
    async mounted() {
        await this.fetchData();
        document.addEventListener('click', this.handleOutsideClick);
    },
    beforeDestroy() {
        document.removeEventListener('click', this.handleOutsideClick);
    },
    methods: {
        toggleMenu() {
            this.isMenuOpen = !this.isMenuOpen;
        },
        handleOutsideClick(event) {
            const navBar = this.$el.querySelector('.nav_bar');
            if (navBar && !navBar.contains(event.target)) {
                this.isMenuOpen = false;
            }
        },
        redirectMainCategory(slug) {
            this.isMenuOpen = false;
            /*
            this.$router.push({
                path: '/category/category-grid',
                query: { sub_slug: slug },
                // path: '/category/categoryProducts',
                // query: { slug },
            });
            */
            window.location.href = `/category/category-grid?sub_slug=${slug}`;
        },
        redirectCategory(slug) {
            this.isMenuOpen = false;
            this.$router.push({
                path: '/category/category-grid',
                query: { sub_slug: slug },
            });
        },
        async fetchData() {
            const response = await this.$axios.get(`/unauthenticate/getCategoryList`);
            this.categories = response.data;
        },
    },
};
</script>