<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="category">
                    <div class="text-center">
                        <span class="text-center fw-bold mt-3 d-inline-block">Shop By Category</span>
                    </div>
                    <div class="row px-2 justify-content-center align-items-center text-center" style="position: relative;">
                        <!-- API Loading Indicator -->
                        <div class="loading-indicator" v-if="loading">
                            <div class="loader-container">
                                <center class="loader-text">Loading...</center>
                                <img src="/loader/loader.gif" loading="lazy" alt="Loader" />
                            </div>
                        </div>

                        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-3 col-4" v-for="item in prouducts" :key="item.id">
                            <Nuxt-link :to="`/category/category-grid?sub_slug=${item.slug}`">
                                <div class="cat_div">
                                    <!-- Image Skeleton Preloader -->
                                    <div
                                        class="img-skeleton"
                                        v-if="!imageLoaded[item.id]"
                                    ></div>
                                    <img
                                        :src="item.image"
                                        class="img-fluid"
                                        :class="{ 'img-hidden': !imageLoaded[item.id] }"
                                        @load="onImageLoad(item.id)"
                                        @error="onImageLoad(item.id)"
                                    />
                                    <p>{{ item.name }}</p>
                                </div>
                            </Nuxt-link>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {

    data() {
        return {
            loading: false,
            prouducts: [],
            imageLoaded: {},
        };
    },
    async mounted() {
        await this.fetchDefaultProduct();
    },
    methods: {

        async fetchDefaultProduct() {
            this.loading = true;
            await this.$axios.get(`/unauthenticate/speacialCategory`)
                .then(response => {
                    this.prouducts = response.data.data;

                    // Initialize all images as not loaded
                    const loadState = {};
                    response.data.data.forEach(item => {
                        loadState[item.id] = false;
                    });
                    this.imageLoaded = loadState;
                })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false;
                });
        },

        onImageLoad(id) {
            this.$set(this.imageLoaded, id, true);
        }
    },
}
</script>

<style>
.category {
    margin-top: 10px;
    padding: 0px 12px;
    border-radius: 5px;
}

/* Hide image until loaded */
.img-hidden {
    display: none !important;
}

/* Skeleton shimmer placeholder */
.img-skeleton {
    width: 100%;
    aspect-ratio: 1 / 1;
    border-radius: 8px;
    background: linear-gradient(90deg, #e0e0e0 25%, #f5f5f5 50%, #e0e0e0 75%);
    background-size: 200% 100%;
    animation: shimmer 1.5s infinite;
}

@keyframes shimmer {
    0%   { background-position: 200% 0; }
    100% { background-position: -200% 0; }
}
</style>