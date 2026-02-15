<template lang="en">
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
                                    <router-link to="/" href="javascript:;"><i class="bx bx-home-alt"></i></router-link>
                                </li>
                                <li class="breadcrumb-item" aria-current="page">
                                    <router-link to="/salary/salary-setings">Salary List </router-link>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Salary update</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!--end breadcrumb-->
                
                <!-- form container  -->
                <div class="container mt-5 py-5 bg-white">
                    <div class="row">
                        <div class="col-md-6 m-auto">
                            <form @submit.prevent="addSalary()" id="sform" method="post" enctype="multipart/form-data">
                                <div class="form-group mb-2">
                                    <label for="member">Team</label>
                                    <input type="number" v-model="salary.team" class="form-control" id="member">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="amount">Amount</label>
                                    <input type="number"  v-model="salary.amount" name="amount" id="amount" placeholder="00.00" class="form-control">
                                </div>
                                <div class="form-group mb-2">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>
        <!--end page wrapper -->
    </div>
</template>


<script>
    export default {head: {
            title: 'Salary Settings',
        },
        data() {
            return {
                salary: {
                    team: '',
                    amount: '',
                },
                salaries: [],
            }
        },
        async mounted() {
            this.getsalaryList();
        },

        methods: {
            getsalaryList(){
            // console.log(this.$route.params.id);
                const id = this.$route.params.id;

                this.$axios.get(`salary/salarydetails/${id}`)
                .then(response => {
                    console.log(response.data.amount);
                    this.salary.team = response.data.team;
                    this.salary.amount = response.data.amount;

                })
            },
            addSalary(){
                const formData =  new FormData();
                formData.append('team', this.salary.team);
                formData.append('amount', this.salary.amount);
                formData.append('id', this.$route.params.id);
                // console.log(formData);
                // const id = this.$route.params.id;

                this.$axios.post('salary/update', formData)
                .then(response => {
                    console.log(response.data);
                    this.success_noti();
                    this.$router.push('/salary/salary-setings');

                })
            },
            success_noti() {
                Lobibox.notify('success', {
                    pauseDelayOnHover: true,
                    continueDelayOnInactiveTab: false,
                    position: 'top right',
                    icon: 'bx bx-check-circle',
                    msg: 'Your data has been successfully Update.'
                });
            },
        },
    }
</script>