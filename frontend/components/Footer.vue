<template>
    <!-- <div> -->
    <footer>
        <!-- mobile footer  -->
        <div class="mobile_view">
            <div class="f_posi">
                <div class="" style="height: 20px;"></div>
                <div class="m_footer ">
                    <div class="f_option ">
                        <ul>
                            <li>
                                <Nuxt-link to="/category/all-categorys">
                                    <div class="circle"></div>
                                    <i class="fa-solid fa-table-cells-large"></i>
                                    <p>Category</p>
                                </Nuxt-link>
                            </li>
                            <li>
                                <Nuxt-link to="/user/user-whichlist">
                                    <div class="circle"></div>
                                    <i class="fa-solid fa-heart"></i>
                                    <p>Wishlist</p>
                                </Nuxt-link>
                            </li>
                            <li class="active">
                                <Nuxt-link to="/">
                                    <div class="circle"></div>
                                    <i class="fa-solid fa-house"></i>
                                    <p>Home</p>
                                </Nuxt-link>
                            </li>
                            <li>
                                <Nuxt-link to="/cart">
                                    <div class="circle"></div>
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <p>Cart</p>
                                </Nuxt-link>
                            </li>
                            <li>
                                <Nuxt-link to="/user/user-profile">
                                    <div class="circle"></div>
                                    <i class="fa-solid fa-user"></i>
                                    <p>User</p>
                                </Nuxt-link>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- mobile footer end  -->
        <!-- footer top  -->
        <div class="footer_top desktop_view d-none">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-12 m-auto">
                        <div class="logo">
                            <a href="#" class="text-white">Ecommerce <i class=" fa-regular fa-star"></i></a>
                        </div>
                    </div>
                    <div class="ccol-lg-4 col-md-4 col-sm-12 m-auto">
                        <div class="newsletter">
                            <h3>New to Ecommerce</h3>
                            <p>Subscribe to our newsletter to get updates on our latest offers!</p>
                            <div class="d-flex " style="position: relative;">
                                <i class="fas fa-envelope "></i>
                                <input type="text" class="form-control" placeholder="Enter email address" name="" id="">
                                <button type="button">Send</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 m-auto d-none">
                        <div class="store_app">
                            <div class="d-flex">
                                <div>
                                    <i class="fa-regular fa-star "></i>
                                </div>
                                <div>
                                    <h5>DOWNLOAD ECOMMERCE FREE APP</h5>
                                    <p>Get access to exclusive offers!</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <!-- App Store button -->
                                <a href="#" target="_blank" class="market-btn a" role="button">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <img src="/images/apple-logo.svg" alt="">
                                        </div>
                                        <div>
                                            <span class="market-button-subtitle">Download on the</span>
                                            <span class="market-button-title">Google Play</span>
                                        </div>
                                    </div>
                                </a>
                                <!-- Google Play button -->
                                <a href="#" target="_blank" class="market-btn " role="button">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <img src="/images/google-play-store.svg" alt="">
                                        </div>
                                        <div>
                                            <span class="market-button-subtitle">Download on the</span>
                                            <span class="market-button-title">Google Play</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer links  -->
        <div class="footer_links desktop_view" style="background-color: #f8f9fa; padding: 82px 0px;">
            <div class="container">


                <!-- Start -->
                <!-- Site Features Section -->
                <!-- Site Features Section -->
                <section class="site-features-section d-none d-sm-block">
                    <div class="container">
                        <div class="row g-4">

                            <!-- Fast Shipping -->
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-card">
                                    <div class="feature-icon">
                                        <!-- Truck SVG -->
                                        <svg width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                            <path
                                                d="M0 1a1 1 0 0 1 1-1h9a1 1 0 0 1 1 1v3h2.586a1 1 0 0 1 .707.293l1.414 1.414A1 1 0 0 1 16 6.414V11a1 1 0 0 1-1 1h-1a2 2 0 1 1-4 0H6a2 2 0 1 1-4 0H1a1 1 0 0 1-1-1V1z" />
                                        </svg>
                                    </div>
                                    <div class="feature-content">
                                        <h5>Fast Shipping</h5>
                                        <p>Fast delivery all over the country</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Returns -->
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-card">
                                    <div class="feature-icon">
                                        <!-- Arrow Repeat SVG -->
                                        <svg width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M2 2v4h4L4.5 4.5A5 5 0 1 1 3 8H1a7 7 0 1 0 1-6z" />
                                        </svg>
                                    </div>
                                    <div class="feature-content">
                                        <h5>30-Day Returns</h5>
                                        <p>Easy & hassle-free returns</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Payment -->
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-card">
                                    <div class="feature-icon">
                                        <!-- Credit Card SVG -->
                                        <svg width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                            <path
                                                d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0V4zm0 2h16v6a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6zm3 3h4v2H3V9z" />
                                        </svg>
                                    </div>
                                    <div class="feature-content">
                                        <h5>Safe Payment</h5>
                                        <p>100% secure payment system</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Support -->
                            <div class="col-lg-3 col-md-6">
                                <div class="feature-card">
                                    <div class="feature-icon">
                                        <!-- Headset SVG -->
                                        <svg width="28" height="28" fill="currentColor" viewBox="0 0 16 16">
                                            <path
                                                d="M8 1a5 5 0 0 0-5 5v4a2 2 0 0 0 2 2h1V8H4V6a4 4 0 1 1 8 0v2h-2v4h1a2 2 0 0 0 2-2V6a5 5 0 0 0-5-5z" />
                                        </svg>
                                    </div>
                                    <div class="feature-content">
                                        <h5>Customer Support</h5>
                                        <p>We’re here 24/7 to help you</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <!-- END -->


                <div class="row mt-4">
                    <div class="col-md-6 col-6">
                        <h4>Contact us</h4>
                        <small>Call us 24/7<br />
                            01329683606<br />

                            6th & 7th Floor, Navana Osman @link, 214/d Bir Uttam Mir Shawkat Sarak, Dhaka 1208<br />
                            Email:birgh.group.digital@gmail.com</small>
                    </div>
                    <div class="col-md-3 col-6">
                        <h4>Quick links </h4>
                        <ul>
                            <li>
                                <Nuxt-link to="/refund">Refund</Nuxt-link>
                            </li>
                            <li>
                                <Nuxt-link to="/return-and-replacement">Return and Replacement</Nuxt-link>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-3 col-6">
                        <h4>Brands </h4>
                        <ul>
                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=wd-40">WD-40</Nuxt-link>
                            </li>
                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=vikars">Vikars</Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=bir-tools">Bir Tools</Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=kgi-hardware">KGI Hardware</Nuxt-link>
                            </li>


                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=vtech">VTech</Nuxt-link>
                            </li>


                            <li>
                                <Nuxt-link to="/brand-product/brand-grid?slug=memoir">Memoir</Nuxt-link>
                            </li>



                        </ul>
                    </div>


                </div>

                <!-- social links  -->
                <div class="row mt-4">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-12">
                        <div class="social_links">
                            <h6>Join us on </h6>
                            <ul>
                                <li>
                                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!-- footer others web links  -->
    </footer>
    <!-- </div> -->

</template>
<style>
.site-features-section {
    padding: 25px 10px;
    background: linear-gradient(135deg, #f8f9fa, #eef2f7);
}

.feature-card {
    background: #ffffff;
    border-radius: 15px;
    padding: 10px 20px;
    text-align: center;
    transition: all 0.3s ease;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.05);
    height: 100%;
}

.feature-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}

.feature-icon {
    width: 70px;
    height: 70px;
    margin: 0 auto 20px;
    background: linear-gradient(135deg, #0d6efd, #00c6ff);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    transition: 0.3s;
}

.feature-icon svg {
    width: 28px;
    height: 28px;
}

.feature-card:hover .feature-icon {
    transform: rotate(8deg) scale(1.1);
}

.feature-content h5 {
    font-weight: 600;
    margin-bottom: 8px;
}

.feature-content p {
    color: #6c757d;
    font-size: 14px;
    margin-bottom: 0;
}



.row .col-md-4 ul li a {
    color: #222 !important;
    text-decoration: none !important;
}

.row .col-md-4 ul li a:hover,
.row .col-md-4 ul li a:focus,
.row .col-md-4 ul li a:active {
    color: #222 !important;
    text-decoration: none !important;
}

.footer_links a,
.footer_links a:visited,
.footer_links a:hover,
.footer_links a:active,
.footer_links a:focus {
    color: #222 !important;
    text-decoration: none !important;
    outline: none !important;
}
</style>