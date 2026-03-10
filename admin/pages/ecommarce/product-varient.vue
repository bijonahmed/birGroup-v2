<template>
    <div>
        <div class="page-wrapper">
            <div class="page-content">
                <!-- breadcrumb -->
                <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                    <div class="ps-3">
                        <nav>
                            <ol class="breadcrumb mb-0 p-0">
                                <li class="breadcrumb-item">
                                    <router-link to="/"><i class="bx bx-home-alt"></i></router-link>
                                </li>
                                <li class="breadcrumb-item">
                                    <router-link to="/ecommarce/product-list">Product List</router-link>
                                </li>
                                <li class="breadcrumb-item active">
                                    Add Attribute Variant
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- card -->
                <div class="row">
                    <div class="col-md-8 mx-auto">
                        <div class="card border-top border-0 border-4 border-info">
                            <div class="card-body">
                                <div class="border p-4 rounded">
                                    <form @submit.prevent="insertVarientHistory">
                                        <hr>
                                        <div class="alert-dark border-0 bg-dark alert-dismissible fade show">
                                            <div class="text-white">Variant List</div>
                                        </div>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Name</th>
                                                    <th>Qty</th>
                                                    <th>Price</th>
                                                    <!-- <th>Image</th> -->
                                                    <th width="120">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(row, index) in historVarient" :key="index">
                                                    <td>{{ index + 1 }}</td>
                                                    <td>
                                                        <input type="text" class="form-control" v-model="row.name"
                                                            placeholder="Name" />
                                                    </td>
                                                    <td>
                                                        <input type="number" class="form-control" v-model="row.qty" />
                                                    </td>
                                                    <td>
                                                        <input type="number" class="form-control" v-model="row.price" />
                                                    </td>
                                                    <!-- <td>
                                                        <input type="file" @change="onFileChange(index, $event)"
                                                            accept="image/*" />
                                                    </td> -->
                                                    <td>
                                                        <button type="button" class="btn btn-danger btn-sm"
                                                            @click="removeRow(index, row.varient_id)">
                                                            DEL
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <!-- add row -->
                                        <button type="button" class="btn btn-success btn-sm w-100" @click="addRow">
                                            + Add Variant
                                        </button>
                                        <br><br>
                                        <button class="btn btn-dark btn-sm w-100" type="submit">
                                            Submit Variant
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
.bg-dark {
    background: #0d4b88 !important;
}
</style>
<script>
export default {
    head: {
        title: 'Attribute Variant'
    },
    data() {
        return {
            historVarient: [
                {
                    varient_id: '',
                    name: '',
                    qty: 1,
                    price: '',
                    file: null
                }
            ],
            errors: {}
        }
    },
    async mounted() {
        this.fetchVarientDataList()
    },
    methods: {
        /* add new row */
        addRow() {
            this.historVarient.push({
                varient_id: '',
                name: '',
                qty: 1,
                price: '',
                file: null
            })
        },
        /* remove row */
        async removeRow(index, id) {
            if (id) {
                const confirmDelete = confirm("Delete this variant?")
                if (confirmDelete) {
                    await this.$axios.post('/product/deleteVarient', {
                        id: id
                    })
                }
            }
            this.historVarient.splice(index, 1)
        },
        /* image upload */
        onFileChange(index, event) {
            const file = event.target.files[0]
            this.historVarient[index].file = file
        },
        /* submit */
        insertVarientHistory() {
            const formData = new FormData()
            const product_id = this.$route.query.parameter;
            this.historVarient.forEach(row => {
                formData.append('id[]', row.varient_id)
                formData.append('name[]', row.name)
                formData.append('qty[]', row.qty)
                formData.append('price[]', row.price)
                formData.append('product_id', product_id)
                // if (row.file) {
                //     formData.append('images[]', row.file)
                // }
            })
            this.$axios.post('/product/insertVarient', formData)
                .then(() => {
                    alert("Variant Saved Successfully")
                    const product_id = this.$route.query.parameter
                    this.$router.push({
                        path: '/ecommarce/product-preview',
                        query: { parameter: product_id }
                    })
                })
                .catch(error => {
                    console.log(error)
                })
        },
        /* fetch variant */
        async fetchVarientDataList() {
            try {
                const product_id = this.$route.query.parameter
                const res = await this.$axios.get(`/product/varient-list/${product_id}`)
                if (res.data.varient.length) {
                    this.historVarient = res.data.varient
                }
            } catch (err) {
                console.log(err)
            }
        }
    }
}
</script>
<style scoped>
.table input {
    width: 100%;
}
</style>