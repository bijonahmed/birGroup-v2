<template>
    <div>
        <div class="page-wrapper">
            <div class="page-content">
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/">
                                        <a href="#"><i class="bx bx-home-alt"></i></a>
                                    </router-link>
                                </li>
                                <li class="breadcrumb-item active">Order Report</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <!-- FILTER AREA -->
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <label>From Date</label>
                                <input type="date" class="form-control" v-model="filters.fromDate">
                            </div>
                            <div class="col-md-3">
                                <label>To Date</label>
                                <input type="date" class="form-control" v-model="filters.toDate">
                            </div>
                            <div class="col-md-3">
                                <label>Seller</label>
                                <select class="form-control" v-model="filters.sellerId">
                                    <option value="">All Seller</option>
                                    <option v-for="seller in allsellers" :key="seller.id" :value="seller.id">
                                        {{ seller.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <button class="btn btn-primary w-100" @click="fetchData">
                                    Filter
                                </button>
                            </div>
                        </div>
                        <!-- ORDER SEARCH -->

                        <div style="display:none" class="customerSpinner">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border"></div>
                            </div>
                        </div>
                        <!-- TABLE -->
                        <div class="table-responsive">
                            <table class="table table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>OrderId</th>
                                        <th>Order Date</th>
                                        <th>Product Name</th>
                                        <th>Seller Name</th>
                                        <th>Total</th>
                                        <th class="text-center">Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in paginatedData" :key="index">
                                        <td>{{ item.orderId }}</td>
                                        <td>{{ item.created_at.split('T')[0] }}</td>
                                        <td>{{ item.product_name }}</td>
                                        <td>{{ item.seller_name }}</td>
                                        <td>{{ item.total }}</td>
                                        <td class="text-center">{{ item.status_name }}</td>

                                    </tr>
                                </tbody>
                            </table>
                            <div class="mt-3 text-end">
                                <h5>
                                    Total Amount :
                                    <span class="badge bg-success">
                                        {{ totalSum }} TK.
                                    </span>
                                </h5>
                            </div>
                        </div>
                        <!-- PAGINATION -->
                        <div class="pagenation">
                            <div style="text-align:right">
                                <button @click="previousPage" :disabled="currentPage === 1"
                                    class="btn btn-primary btn-sm">
                                    <i class="lni lni-angle-double-left"></i>
                                </button>
                                <span> Page {{ currentPage }} of {{ totalPages }} </span>
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
</template>
<script>
import _ from "lodash";
export default {
    head: {
        title: "Order Report"
    },
    data() {
        return {
            data: [],
            allsellers: [],
            filters: {
                fromDate: "",
                toDate: "",
                sellerId: ""
            },
            searchQuery: {
                orderId: ""
            },
            currentPage: 1,
            perPage: 100
        };
    },
    async mounted() {
        await this.fetchData();
        await this.alleSellerList();
    },
    computed: {
        totalPages() {
            return Math.ceil(this.filteredData.length / this.perPage);
        },
        totalSum() {
            return this.filteredData.reduce((sum, item) => {
                return sum + Number(item.total || 0);
            }, 0);
        },
        filteredData() {
            let result = this.data;
            if (this.searchQuery.orderId) {
                result = result.filter(item =>
                    item.orderId
                        .toLowerCase()
                        .includes(this.searchQuery.orderId.toLowerCase())
                );
            }
            return result;
        },
        paginatedData() {
            const start = (this.currentPage - 1) * this.perPage;
            return _.slice(this.filteredData, start, start + this.perPage);
        }
    },
    methods: {
        async fetchData() {
            $(".customerSpinner").show();
            try {
                const response = await this.$axios.get("/order/orderFilterReport", {
                    params: {
                        fromDate: this.filters.fromDate,
                        toDate: this.filters.toDate,
                        sellerId: this.filters.sellerId
                    }
                });
                this.data = response.data.orderdata.reverse();
                $(".customerSpinner").hide();
            } catch (error) {
                console.error(error);
            }
        },
      
        async alleSellerList() {
            try {
                const response = await this.$axios.get("/unauthenticate/allsellerListadmin");
                this.allsellers = response.data.data;
            } catch (error) {
                console.error(error);
            }
        },
        handleSearch() {
            this.currentPage = 1;
        },
        previousPage() {
            this.currentPage--;
        },
        nextPage() {
            this.currentPage++;
        },
        edit(orderId) {
            this.$router.push({
                path: "/orders/details",
                query: {
                    orderId: orderId
                }
            });
        }
    }
};
</script>
<style scoped>
.pagenation {
    margin-top: 10px;
}
</style>