<template>
    <div>
        <!--start page wrapper -->
        <div class="page-wrapper">
            <div class="page-content">
                <!--breadcrumb-->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/"><a href="javascript:;"><i class="bx bx-home-alt"></i></a></router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Coupon List</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="ms-auto">
                        <div class="btn-group">
                            <Nuxt-link to="/coupons/new-coupons">
                                <button type="button" class="btn btn-primary">
                                    <i class="bx bx-plus"></i>New
                                </button>
                            </Nuxt-link>
                        </div>
                    </div>
                </div>
                <!--end breadcrumb-->

                <div class="card">
                    <div class="card-body">
                        <!-- Search Row -->
                        <div class="row">
                            <div class="col-md-7">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder="Coupon Name"
                                        v-model="searchQuery.name" @input="handleSearch">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group mb-3">
                                    <select class="form-select form-select-solid" v-model="searchQuery.status"
                                        @change="handleSearch">
                                        <option value="">All Status</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="input-group mb-3">
                                    <!-- ✅ Button shows spinner while loading -->
                                    <button class="btn btn-primary w-100" type="button"
                                        :disabled="loading" @click="fetchData">
                                        <span v-if="loading">
                                            <span class="spinner-border spinner-border-sm me-1" role="status"></span>
                                            Searching...
                                        </span>
                                        <span v-else>Search</span>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- ✅ Full table loader overlay -->
                        <div v-if="loading" class="d-flex justify-content-center align-items-center py-5">
                            <div class="text-center">
                                <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                                <p class="mt-2 text-muted">Fetching coupons...</p>
                            </div>
                        </div>

                        <!-- ✅ Table shown only when not loading -->
                        <div v-else>
                            <div class="table-responsive">
                                <table class="table table-hover table-sm">
                                    <thead>
                                        <tr>
                                            <th>Coupon Name</th>
                                            <th>Promo Code</th>
                                            <th>Discount</th>
                                            <th class="text-center">Status</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- ✅ Empty state message -->
                                        <tr v-if="paginatedData.length === 0">
                                            <td colspan="5" class="text-center text-muted py-4">
                                                No coupons found.
                                            </td>
                                        </tr>
                                        <tr v-for="item in paginatedData" :key="item.id">
                                            <td>{{ item.name }}</td>
                                            <td>{{ item.promocode }}</td>
                                            <td>{{ item.d_percent }}<span>%</span></td>
                                            <td class="text-center">
                                                <span v-if="item.status == 1" class="badge bg-success-light">Active</span>
                                                <span v-else class="badge bg-danger-light">Inactive</span>
                                            </td>
                                            <td class="text-center">
                                                <nuxt-link :to="`/coupons/edit/${item.id}`"
                                                    class="btn btn-warning btn-sm">
                                                    <i class="bx bx-edit"></i> EDIT
                                                </nuxt-link>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Pagination -->
                            <div class="pagenation">
                                <div style="text-align: right;">
                                    <button @click="previousPage" :disabled="currentPage === 1"
                                        class="btn btn-primary btn-sm">
                                        <i class="lni lni-angle-double-left"></i>
                                    </button>
                                    <span class="mx-2">Page {{ currentPage }} of {{ totalPages }}</span>
                                    <button @click="nextPage" :disabled="currentPage === totalPages"
                                        class="btn btn-primary btn-sm">
                                        <i class="lni lni-angle-double-right"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <!--end page wrapper -->
    </div>
</template>

<script>
import _ from 'lodash';
export default {
    head: {
        title: 'Coupons List',
    },
    data() {
        return {
            data: [],
            loading: false, // ✅ Single reactive loader flag
            searchQuery: {
                name: '',
                status: ''
            },
            currentPage: 1,
            perPage: 10,
        };
    },
    async mounted() {
        await this.fetchData();
    },
    computed: {
        totalPages() {
            return Math.ceil(this.filteredData.length / this.perPage) || 1;
        },
        filteredData() {
            let result = this.data;
            if (this.searchQuery.name) {
                result = result.filter(item =>
                    item.name.toLowerCase().includes(this.searchQuery.name.toLowerCase())
                );
            }
            if (this.searchQuery.status) {
                result = result.filter(item =>
                    item.status == this.searchQuery.status
                );
            }
            return result;
        },
        paginatedData() {
            const startIndex = (this.currentPage - 1) * this.perPage;
            return _.slice(this.filteredData, startIndex, startIndex + this.perPage);
        },
    },
    methods: {
        async fetchData() {
            this.loading = true; // ✅ Start loader
            try {
                const response = await this.$axios.get(`/setting/couponsList`);
                this.data = response.data.reverse();
                this.currentPage = 1; // ✅ Reset to page 1 on each fetch
            } catch (error) {
                console.error(error);
                Lobibox.notify('error', {
                    pauseDelayOnHover: true,
                    continueDelayOnInactiveTab: false,
                    position: 'top right',
                    icon: 'bx bx-error-circle',
                    msg: 'Failed to load coupons. Please try again.'
                });
            } finally {
                this.loading = false; // ✅ Always stop loader
            }
        },
        handleSearch() {
            this.currentPage = 1;
        },
        previousPage() {
            if (this.currentPage > 1) this.currentPage--;
        },
        nextPage() {
            if (this.currentPage < this.totalPages) this.currentPage++;
        },
    },
};
</script>

<style scoped>
.pagenation {
    margin-top: 10px;
}
thead tr th,
tbody tr td {
    text-align: center !important;
}
</style>