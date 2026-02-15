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
                                <li class="breadcrumb-item active" aria-current="page">Salary List</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!--end breadcrumb-->
                
                <!-- form container  -->
                <div class="container mt-5 py-5 bg-white">
                    <div class="row">
                        <div class="col-md-6">
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
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>
                        </div>
                        <div class="col-md-6">
                            <h5>Salary List</h5>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Team</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Loop through your salaries and generate table rows -->
                                    <tr v-for="(salary, index) in salaries" :key="index">
                                        <th scope="row">{{ index + 1 }}</th>
                                        <td>{{ salary.team }}</td>
                                        <td>{{ salary.amount }}</td>
                                        <td>
                                            <span v-if="salary.status==1" class="badge bg-success">Active</span>
                                            <span v-else class="badge bg-danger">Inactive</span>
                                        </td>
                                        <td>
                                            <!-- Add edit button here -->
                                            <!-- <nuxt-link :to="{name: 'salary-edit-id', params: {id: salary.id}}"   class="btn btn-primary">Edit</nuxt-link> -->
                                            <nuxt-link :to="{name: 'salary-edit-id', params: {id: salary.id}}" variant="warning" size="sm">Edit
                                            </nuxt-link>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
                this.$axios.get('salary/salarylist')
                .then(response => {
                    // console.log(response.data);
                    this.salaries = response.data;

                })
            },
            addSalary(){
                const formData =  new FormData();
                formData.append('team', this.salary.team);
                formData.append('amount', this.salary.amount);
                console.log(formData);

                this.$axios.post('salary/addSalary', formData)
                .then(response => {
                    console.log(response.data);
                    this.success_noti();
                    $('sform').reset();

                })
            },
            success_noti() {
                Lobibox.notify('success', {
                    pauseDelayOnHover: true,
                    continueDelayOnInactiveTab: false,
                    position: 'top right',
                    icon: 'bx bx-check-circle',
                    msg: 'Your data has been successfully inserted.'
                });
            },
        },
    }
</script>