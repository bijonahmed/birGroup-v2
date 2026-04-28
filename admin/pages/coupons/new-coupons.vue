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
                                <li class="breadcrumb-item active" aria-current="page">Add New Coupons</li>
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
                        <div class="form_container bg-white p-3">
                      
                            <form @submit.prevent="savecoupon()" id="couponform" class="forms-sample"
                                enctype="multipart/form-data">
                                <div class="form-group mb-2">
                                    <label for="" class="text-dark fs-6">Promo Name <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="name" autocomplete="off" id="" class="form-control"
                                        ref="name">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="" class="text-dark fs-6">Promo Code <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" name="promocode" autocomplete="off" id="" class="form-control"
                                        ref="promocode">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="" class="text-dark fs-6">Discount in percentage(%) <span
                                            class="text-secondary" style="font-size: 12px;"></span></label>
                                    <input type="text" name="d_percent" id="numericInput" autocomplete="off"
                                        v-model="insertData.percentage" @input="validateNumber" @keypress="onlyNumber"
                                        class="form-control" ref="d_percent" />
                                    <p v-if="verrors" class="text-danger mt-1">{{ verrors }}</p>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="" class="text-dark fs-6">Status <span
                                            class="text-danger">*</span></label>
                                    <select name="status" ref="status" id="" class="form-control">
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <button type="submit" :disabled="!!discountError || !!error"
                                        class="btn-success subBTN w-100 py-1 border-0">
                                        <i class="bx bx-check-circle mr-1"></i>Submit
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--top header banner row-->
            </div>
        </div>
        <!--end page wrapper -->
    </div>
</template>
<script>
export default {
    head: {
        title: 'Coupon Management',
    },
    data() {
        return {
            promocode: null,
            status: "1",
            errors: {},
            insertData: {
                percentage: '',
            },
            amount: null,
            discount: null,
            discountError: '',
            error: '',
            verrors: '',
        };
    },
    mounted() { },
    methods: {
        validateDiscount() {
            if (this.discount > this.amount) {
                this.discountError = 'Discount amount cannot be greater than the total amount.';
            } else {
                this.discountError = '';
            }
        },

        onlyNumber(event) {
            const char = String.fromCharCode(event.keyCode);
            if (!/^[0-9.]$/.test(char)) {
                event.preventDefault();
            }
        },

        validateNumber() {
            let value = this.insertData.percentage; // ✅ Fixed: was using wrong variable
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

            this.insertData.percentage = value;
        },

        resetForm() { // ✅ Properly resets both DOM and Vue reactive data
            this.$refs.name.value = '';
            this.$refs.promocode.value = '';
            this.$refs.status.value = '1';
            this.insertData.percentage = '';
            this.verrors = '';
            this.error = '';
            this.discountError = '';
        },

        savecoupon() {
            // ✅ Client-side validation before sending
            const name = this.$refs.name.value.trim();
            const promocode = this.$refs.promocode.value.trim();
            const percentage = this.insertData.percentage;

            if (!name) {
                this.error = 'Promo Name is required.';
                return;
            }
            if (!promocode) {
                this.error = 'Promo Code is required.';
                return;
            }
            if (!percentage || this.verrors) {
                this.error = 'Please enter a valid discount percentage.';
                return;
            }

            this.error = ''; // Clear previous errors

            const formData = new FormData();
            formData.append('name', name);
            formData.append('promocode', promocode);
            formData.append('d_percent', percentage);
            formData.append('status', this.$refs.status.value);

            this.$axios.post('/setting/addcoupons', formData)
                .then(response => {
                    Lobibox.notify('success', {
                        pauseDelayOnHover: true,
                        continueDelayOnInactiveTab: false,
                        position: 'top right',
                        icon: 'bx bx-check-circle',
                        msg: 'Your Coupon has been successfully Created.'
                    });
                    this.resetForm(); // ✅ Use Vue-aware reset instead of jQuery
                    this.$router.push('/coupons/all-coupons');
                })
                .catch(error => {
                    // ✅ Show server error message if available
                    const msg = error?.response?.data?.message || 'An error occurred while saving data.';
                    Lobibox.notify('error', {
                        pauseDelayOnHover: true,
                        continueDelayOnInactiveTab: false,
                        position: 'top right',
                        icon: 'bx bx-error-circle',
                        msg: msg
                    });
                });
        },
    }
};
</script>
<style>
.subBTN:disabled {
    background-color: lightgray;
}
</style>