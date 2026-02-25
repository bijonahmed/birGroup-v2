<template>
    <div>
        <div class="row">
            <div class="col-12">
                <div class="category">
                    <div class="text-center">
                        <span class="text-center fw-bold mt-3 d-inline-block">Shop By Category</span>
                    </div>
                    <div class="row px-2 justify-content-center align-items-center text-center" style="position: relative;">
                        <div class="loading-indicator" v-if="loading">
                            <div class="loader-container">
                                <center class="loader-text">Loading...</center>
                                <img src="/loader/loader.gif" loading="lazy" alt="Loader" />
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-3 col-md-3 col-sm-3 col-4" v-for="item in prouducts" :key="item.id">
                            <Nuxt-link :to="`/category/category-grid?sub_slug=${item.slug}`">
                                <div class="cat_div">
                                    <img :src="item.image" class="img-fluid" loading="lazy">
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
        };
    },
    async mounted() {
        await this.fetchDefaultProduct();
    },
    methods: {

        async fetchDefaultProduct() {
            this.loading = true;
            await this.$axios.get(`/unauthenticate/speacialCategory`).then(response => {
                this.prouducts = response.data.data;
            })
                .catch(error => {
                    // Handle error
                })
                .finally(() => {
                    this.loading = false; // Hide loader after response
                });;

        }
    },

}
</script>

<style>
.category {
    margin-top: 10px;
    /* background: #fff; */
    padding: 0px 12px;
    border-radius: 5px;
    /* box-shadow: 0px 0px 44px #0000001a; */
}
</style>