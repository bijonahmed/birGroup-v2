<template>
<div>
    <LogoAndPayment />
    <NavbarSecond/>

    <section class="main_content">
        <div class="container">
            <div class="row">
                <div class="container mt-5">

                    <h1 class="mb-4 text-center">Refund Policy</h1>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">1. Eligibility for Returns</h3>
                            <p class="card-text">
                                To be eligible for a return, your item must meet the following conditions:
                            </p>
                            <ul>
                                <li>The item must be unused and in the same condition as received.</li>
                                <li>The item must be in its original packaging.</li>
                                <li>Return request must be made within 7 days of delivery.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">2. How to Request a Return</h3>
                            <p class="card-text">
                                To initiate a return, please follow these steps:
                            </p>
                            <ol>
                                <li>Contact our support team or assigned agent.</li>
                                <li>Provide your order ID and reason for return.</li>
                                <li>Follow the instructions provided by our agent.</li>
                            </ol>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">3. Refund Process</h3>
                            <p class="card-text">
                                Once we receive and inspect your returned item, we will notify you about the approval or rejection of your refund.
                                If approved, your refund will be processed within 5–10 business days and automatically applied to your original payment method.
                            </p>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">4. Return Shipping</h3>
                            <p class="card-text">
                                Customers are responsible for return shipping costs unless the return is due to our mistake
                                (wrong item, damaged product, or missing item). In such cases, we will cover the return shipping cost.
                            </p>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">5. Non-Refundable Cases</h3>
                            <p class="card-text">
                                Refunds may not be granted in the following cases:
                            </p>
                            <ul>
                                <li>Request made after 7 days of delivery.</li>
                                <li>Items damaged due to customer misuse.</li>
                                <li>Missing original packaging or accessories.</li>
                            </ul>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-body">
                            <h3 class="card-title">6. Contact Us</h3>
                            <p class="card-text">
                                If you have any questions about our refund policy, please contact our support agent through the
                                <nuxt-link to="/contactus">Contact Us</nuxt-link> page.
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <div class="back_top">
        <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
    </div>

    <Footer />
</div>
</template>

<script>
import NavbarSecond from '../components/NavbarSecond.vue';

export default {
    components: {
        NavbarSecond,
    },
    head: {
        title: 'Refund Policy',
    }
}
</script>