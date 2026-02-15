<template>
    <div>
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
                                <li class="breadcrumb-item active" aria-current="page">Edit Blog</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <!-- form container  -->
                <div class="container mt-5 bg-white py-5">
                    <div class="row">
                        <div class="col-md-6 m-auto">
                            <form @submit.prevent="addblog()" id="addCat" method="post" enctype="multipart/form-data">
                                    <input type="text" hidden v-model="blog.id" class="form-control" id="categoryName"
                                        placeholder="Enter category name" required>
                                <div class="mb-3">
                                    <label for="categoryName" class="form-label">Title</label>
                                    <input type="text" v-model="blog.title" class="form-control" id="categoryName"
                                        placeholder="Enter category name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="categoryName" class="form-label">Category</label>
                                    <select name="" id="" v-model="blog.category" class="form-control">
                                        <option value="" disabled selected>Select category</option>
                                        <option v-for="category in categories" :key="category.id" :value="category.id">{{ category.name }}</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="categoryDescription" class="form-label">Category Description</label>
                                    <client-only placeholder="loading...">
                                        <ckeditor-nuxt v-model="blog.desc" :config="editorConfig"
                                            class="form-control" />
                                    </client-only>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="categoryName" class="form-label">Status</label> 
                                    <select name="" id="" v-model="blog.status" class="form-control">
                                        <option value="" disabled selected>Select Status</option>
                                        <option value="1" :selected="blog.status==1" >Approve</option>
                                        <option value="2" :selected="blog.status==2">Pending</option>
                                        <option value="3"  :selected="blog.status==3">Reject</option>
                                        <!-- <option v-for="category in categories" :key="category.id" :value="category.id">{{ category.name }}</option> -->
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="imageInput">Thumbnail</label>
                                    <input type="file" ref="image" @change="onFileChange" class="form-control mb-2">
                                    <img :src="thumbnail" alt="" class="img-fluid thumbnail">
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import _ from 'lodash';
export default {
    data() {
        return {
            editorConfig: {
                removePlugins: ['Title'],
                simpleUpload: {
                    uploadUrl: 'path_to_image_controller',
                    headers: {
                        'Authorization': 'optional_token'
                    }
                }
            },
            blog: {
                id:'',
                title: '',
                category: '',
                desc: '',
                status: '',
            },
            thumbnail: '/images/gallery/01.png',
            categories: '',

        };
    },
    components: {
        'ckeditor-nuxt': () => {
            if (process.client) {
                return import('@blowstack/ckeditor-nuxt')
            }
        },
    },
    computed: {

        loggedIn() {
            return this.$store.state.auth.loggedIn;
        },
        user() {
            return this.$store.state.auth.user
        },

    },
    head: {
        title: 'Blog Add',
    },
    async mounted() {
        await this.loadCKEditor();
        CKEDITOR.replace('editor');
        this.catList();
        this.dataLoading();
    },

    methods: {
        catList(){
            this.$axios.get('/blog/blogcatlist')
                    .then(response => {
                        this.categories = response.data.data;
                        // console.log(response.data);
                    });
        },
        dataLoading(){
            const paramSlug = this.$route.query.slug;
            console.log(paramSlug);
            this.$axios.get(`blog/blog-details/${paramSlug}`)
            .then(response => {
                console.log('Test:'+ response.data);
                
                this.blog.id = response.data.id;
                this.blog.title = response.data.title;
                this.blog.category  = response.data.category;
                this.blog.desc = response.data.content;
                this.blog.status = response.data.status;
                this.thumbnail = response.data.image;
            })
        },
        addblog() {
            const formData = new FormData();
            formData.append('id', this.blog.id);
            formData.append('title', this.blog.title);
            formData.append('status', this.blog.status);
            formData.append('category', this.blog.category);
            formData.append('content', this.blog.desc);
            formData.append('image', this.$refs.image.files[0]);
            // formData.append('user_id', this.user.id);

            // console.log(formData);
            const headers = {
                'Content-Type': 'multipart/form-data'
            };
            this.$axios.post('/blog/updateBlog',
                formData, {
                headers
            })
                .then(response => {
                    Lobibox.notify('success', {
                        pauseDelayOnHover: true,
                        continueDelayOnInactiveTab: false,
                        position: 'top right',
                        icon: 'bx bx-check-circle',
                        msg: "Successfully blog created"
                    });
                    this.$router.push('/blog/blog-list');
                })
                .catch(error => {
                    if (error.response && error.response.status === 422) {
                        const validationErrors = error.response.data.errors;
                        console.log('Validation errors:', validationErrors);

                        Object.values(validationErrors).forEach(errors => {
                            errors.forEach(errorMessage => {
                                Lobibox.notify('error', {
                                    pauseDelayOnHover: true,
                                    continueDelayOnInactiveTab: false,
                                    position: 'top right',
                                    icon: 'bx bx-check-circle',
                                    msg: errorMessage
                                });
                            });
                        });
                    } else {
                        console.error('Error adding blog:', error.message);
                    }
                });
        },
        onFileChange(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => {
                    this.thumbnail = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        },
        loadCKEditor() {
            return new Promise((resolve) => {
                if (typeof CKEDITOR === 'undefined') {
                    const script = document.createElement('script');
                    // script.src = 'https://cdn.ckeditor.com/4.17.1/standard/ckeditor.js';
                    script.async = true;
                    script.onload = resolve;
                    document.head.appendChild(script);
                } else {
                    resolve();
                }
            });
        }
    }
}

</script>

<style scoped>
/* Scoped styles for this component */
.thumbnail {
    height: 80px;
    width: 80px;
    object-fit: cover;
    /* 1300x650 */
}
</style>