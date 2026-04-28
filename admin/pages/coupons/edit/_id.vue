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
                                <li class="breadcrumb-item active" aria-current="page">Update Coupons</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="ms-auto">
                        <div class="btn-group">
                            <Nuxt-link to="/coupons/all-coupons"><button type="button" class="btn btn-primary"><i
                                        class="bx bx-plus"></i>Back to List</button></Nuxt-link>
                        </div>
                    </div>
                </div>
                <!--end breadcrumb-->
                <!--top header banner row-->
                <div class="row">
                    <div class="col-md-8 m-auto">

                        <!-- ✅ Loader -->
                        <div v-if="loading" class="text-center py-5">
                            <div class="spinner-border text-success" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                            <p class="mt-2 text-muted">Please wait...</p>
                        </div>

                        <div v-else class="form_container bg-white p-3">
                         
                            <form @submit.prevent="updatecoupon()" id="couponform" class="forms-sample"
                                enctype="multipart/form-data">
                                <div class="form-group mb-2">
                                    <label class="text-dark fs-6">Promo Name <span class="text-danger">*</span></label>
                                    <input type="text" name="name" v-model="insertdata.name" class="form-control" ref="name">
                                    <input type="text" name="id" v-model="insertdata.id" class="form-control d-none" ref="id">
                                    <p v-if="errors.name" class="text-danger mt-1">{{ errors.name[0] }}</p>
                                </div>

                                <div class="form-group mb-2">
                                    <label class="text-dark fs-6">Promo Code <span class="text-danger">*</span></label>
                                    <input type="text" name="promocode" v-model="insertdata.promocode" class="form-control" ref="promocode">
                                    <p v-if="errors.promocode" class="text-danger mt-1">{{ errors.promocode[0] }}</p>
                                </div>

                                <div class="form-group mb-2">
                                    <label class="text-dark fs-6">Discount in percentage(%)</label>
                                    <input type="text" name="d_percent" v-model="insertdata.d_percent"
                                        @keypress="onlyNumber" @input="validateNumber"
                                        class="form-control" ref="d_percent">
                                    <p v-if="verrors" class="text-danger mt-1">{{ verrors }}</p>
                                </div>

                                <div class="form-group mb-2">
                                    <label class="text-dark fs-6">Status <span class="text-danger">*</span></label>
                                    <select name="status" v-model="insertdata.status" ref="status" class="form-control">
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>

                                <div class="form-group mb-2">
                                    <button type="submit" :disabled="submitting || !!verrors"
                                        class="btn-success w-100 py-1 border-0">
                                        <!-- ✅ Submit button loader -->
                                        <span v-if="submitting">
                                            <span class="spinner-border spinner-border-sm me-1" role="status"></span>
                                            Saving...
                                        </span>
                                        <span v-else>
                                            <i class="bx bx-check-circle mr-1"></i>Submit
                                        </span>
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <!--end row-->
            </div>
        </div>
        <!--end page wrapper -->
    </div>
</template>

<script>
export default {
    head: {
        title: 'Update Coupon',
    },
    data() {
        return {
            insertdata: {
                id: '',
                name: '',
                promocode: '',
                code_type: '',
                status: '',
                d_percent: null,
                d_fvalue: null,
                min_shopping: null,
            },
            errors: {},
            verrors: '',
            loading: false, 
            submitting: false, 
        };
    },
    created() {
        this.getData();
    },
    methods: {

        onlyNumber(event) {
            const char = String.fromCharCode(event.keyCode);
            if (!/^[0-9.]$/.test(char)) {
                event.preventDefault();
            }
        },

        validateNumber() {
            let value = this.insertdata.d_percent;
            value = value.toString().replace(/[^0-9.]/g, '');

            // Prevent multiple dots
            const parts = value.split('.');
            if (parts.length > 2) {
                value = parts[0] + '.' + parts[1];
            }

            // Validate range 1–100
            const numeric = parseFloat(value);
            if (isNaN(numeric) || numeric < 1 || numeric > 100) {
                this.verrors = 'Percentage must be between 1 and 100.';
            } else {
                this.verrors = '';
            }

            this.insertdata.d_percent = value;
        },

        updatecoupon() {
            // ✅ Client-side validation
            if (!this.insertdata.name.trim()) {
                this.errors = { name: ['Promo Name is required.'] };
                return;
            }
            if (!this.insertdata.promocode.trim()) {
                this.errors = { promocode: ['Promo Code is required.'] };
                return;
            }
            if (this.verrors) return;

            this.submitting = true; // ✅ Start submit loader
            this.errors = {};

            const cid = this.insertdata.id;
            const formData = new FormData();
            formData.append('id', this.insertdata.id);
            formData.append('name', this.insertdata.name);
            formData.append('promocode', this.insertdata.promocode);
            formData.append('d_percent', this.insertdata.d_percent);
            formData.append('status', this.insertdata.status);

            // ✅ Fixed: was using single quotes so ${cid} was not interpolated
            this.$axios.post(`/setting/updatecoupon?id=${cid}`, formData, {
                headers: { 'Content-Type': 'multipart/form-data' }
            })
                .then(() => {
                    Lobibox.notify('success', {
                        pauseDelayOnHover: true,
                        continueDelayOnInactiveTab: false,
                        position: 'top right',
                        icon: 'bx bx-check-circle',
                        msg: 'Your Coupon has been successfully Updated.'
                    });
                    this.$router.push('/coupons/all-coupons');
                })
                .catch(error => {
                    if (error.response?.status === 422) {
                        this.errors = error.response.data.errors;
                    } else {
                        Lobibox.notify('error', {
                            pauseDelayOnHover: true,
                            continueDelayOnInactiveTab: false,
                            position: 'top right',
                            icon: 'bx bx-error-circle',
                            msg: error.response?.data?.message || 'An error occurred while updating.'
                        });
                    }
                })
                .finally(() => {
                    this.submitting = false; // ✅ Stop submit loader
                });
        },

        getData() {
            this.loading = true; // ✅ Start fetch loader
            const id = this.$route.params.id;

            this.$axios.get(`/setting/getcoupons/${id}`)
                .then(response => {
                    const data = response.data.data;
                    this.insertdata.id          = data.id;
                    this.insertdata.name        = data.name;
                    this.insertdata.promocode   = data.promocode;
                    this.insertdata.code_type   = data.code_type;
                    this.insertdata.status      = data.status;
                    this.insertdata.d_percent   = data.d_percent;
                    this.insertdata.d_fvalue    = data.d_fvalue;
                    this.insertdata.min_shopping = data.min_shopping;
                })
                .catch(() => {
                    Lobibox.notify('error', {
                        pauseDelayOnHover: true,
                        continueDelayOnInactiveTab: false,
                        position: 'top right',
                        icon: 'bx bx-error-circle',
                        msg: 'Failed to load coupon data.'
                    });
                })
                .finally(() => {
                    this.loading = false; // ✅ Stop fetch loader
                });
        },
    }
};
</script>

<style>
.subBTN:disabled,
button:disabled {
    background-color: lightgray;
    cursor: not-allowed;
}
</style>