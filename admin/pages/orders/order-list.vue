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
                                    <router-link to="/"><a href="javascript:;"><i
                                                class="bx bx-home-alt"></i></a></router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Order List</li>
                            </ol>
                        </nav>
                    </div>

                </div>
                <!--end breadcrumb-->
                <!-- <span class="loader"></span> -->
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control name" placeholder="Order ID"
                                        v-model="searchQuery.orderId" @input="handleSearch">
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="input-group mb-3">
                                    <button class="btn btn-primary w-100" type="button"
                                        @click="fetchData">Search</button>
                                </div>
                            </div>
                        </div>
                        <div style="display: none;" class="customerSpinner">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-sm">
                                <thead>
                                    <tr>

                                        <th>OrderId</th>
                                        <th>Order Date</th>
                                        <th>Item</th>
                                        <th>Total</th>
                                        <th class="text-center">Status</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="item in paginatedData" :key="item.id">
                                        <td>{{ item.orderId }}</td>
                                        <td>{{ item.placeOn }} </td>
                                        <td>{{ item.productName }}</td>
                                        <td>{{ item.total }}</td>
                                        <td class="text-center">{{ item.name }}</td>
                                        <td>
                                            <center>

                                                <!-- Edit Button -->
                                                <button type="button" class="btn btn-warning bg-history-light"
                                                    @click="edit(item.orderId)">

                                                    <!-- Edit SVG -->
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" viewBox="0 0 16 16">
                                                        <path
                                                            d="M12.854.146a.5.5 0 0 1 .707 0l2.293 2.293a.5.5 0 0 1 0 .707l-10 10L3 14l.854-2.854 10-10zM11.207 3L13 4.793 14.793 3 13 1.207 11.207 3zM1 13.5V16h2.5l9.793-9.793-2.5-2.5L1 13.5z" />
                                                    </svg>
                                                </button>

                                                <!-- Invoice Button -->
                                                <button type="button" class="btn btn-warning bg-history-light"
                                                    @click="makeInvoice(item.orderId)">

                                                    Invoice

                                                    <!-- Invoice SVG -->
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" viewBox="0 0 16 16">
                                                        <path d="M2 2h12v12H2z" fill="none" />
                                                        <path d="M4 4h8v1H4zm0 2h8v1H4zm0 2h5v1H4z" />
                                                    </svg>
                                                </button>

                                                <!-- Delivery Note (DN) Button -->
                                                <button type="button" class="btn btn-warning bg-history-light"
                                                    @click="makedeliveryNote(item.orderId)">

                                                    Delivery note

                                                    <!-- Delivery SVG -->
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" viewBox="0 0 16 16">
                                                        <path d="M0 1h10v9H0zM10 4h3l3 3v3h-6z" />
                                                        <circle cx="3" cy="12" r="2" />
                                                        <circle cx="11" cy="12" r="2" />
                                                    </svg>
                                                </button>

                                            </center>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pagenation">
                            <div style="text-align: right;">
                                <button @click="previousPage" :disabled="currentPage === 1"
                                    class="btn btn-primary btn-sm">
                                    <center><i class="lni lni-angle-double-left"></i></center>
                                </button>
                                <span>Page {{ currentPage }} of {{ totalPages }}</span>
                                <button @click="nextPage" :disabled="currentPage === totalPages"
                                    class="btn btn-primary btn-sm">
                                    <center><i class="lni lni-angle-double-right"></i></center>
                                </button>
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
        title: 'Order List',
    },
    data() {
        return {
            data: [],
            searchQuery: {
                name: '',
                orderId: '',
                total: '',
                status: 1
            },
            searchQueryPhone: '',
            currentPage: 1,
            perPage: 10, // Number of items per page
        };
    },
    async mounted() {
        await this.fetchData();
    },
    computed: {
        totalPages() {
            return Math.ceil(this.filteredData.length / this.perPage);
        },
        filteredData() {
            let result = this.data;
            if (this.searchQuery.orderId) {
                result = result.filter(item =>
                    item.orderId.toLowerCase().includes(this.searchQuery.orderId.toLowerCase())
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
            $(".customerSpinner").show();
            try {
                const response = await this.$axios.get(`/order/allOrdersAdmin`);
                //console.log("order" + response.data.orderdata);

                this.data = response.data.orderdata.reverse();
                $(".customerSpinner").hide();
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
                path: '/orders/details',
                query: {
                    orderId: orderId
                }
            })

        },
        makeInvoice(orderId) {
            this.$router.push({
                path: '/orders/invoice',
                query: {
                    orderId: orderId
                }
            })
        },
        makedeliveryNote(orderId) {
            this.$router.push({
                path: '/orders/delivery',
                query: {
                    orderId: orderId
                }
            })
        },
    },
};
</script>

<style scoped>
.pagenation {
    margin-top: 10px;
}

.pagination {
    /*! display: flex; */
    padding-left: 0;
    list-style: none
}
</style>
