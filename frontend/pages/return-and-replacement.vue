<template>
    <div>
        <LogoAndPayment />
        <NavbarSecond />

        <section class="main_content">
            <div class="container">
                <div class="row">
                    <div class="container mt-5">

                        <h1 class="mb-4 text-center">
                            Returns & Replacements Policy
                        </h1>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">1. Eligibility for Returns & Replacements</h3>
                                <p class="card-text">
                                    To be eligible for a return or replacement, your item must meet the following conditions:
                                </p>
                                <ul>
                                    <li>The item must be unused and in the same condition as received.</li>
                                    <li>The item must be in its original packaging with all accessories.</li>
                                    <li>Return or replacement request must be made within 7 days of delivery.</li>
                                    <li>Proof of purchase (order ID / invoice) is required.</li>
                                </ul>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">2. How to Request</h3>
                                <p class="card-text">
                                    To initiate a return or replacement, please follow these steps:
                                </p>
                                <ol>
                                    <li>Contact our support team or assigned agent via the Contact Us page.</li>
                                    <li>Provide your order ID and reason for return or replacement.</li>
                                    <li>Follow the instructions provided by our support agent.</li>
                                </ol>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">3. Return & Replacement Process</h3>
                                <p class="card-text">
                                    Once we receive your request and returned item (if required), our team will inspect it.
                                    You will be notified about approval or rejection within 2–3 business days.
                                    Approved replacements will be shipped or processed as soon as possible.
                                </p>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">4. Shipping Policy</h3>
                                <p class="card-text">
                                    Customers are responsible for return shipping costs unless the issue is caused by our mistake
                                    (wrong item, damaged product, or missing item). In such cases, we will cover the shipping cost.
                                </p>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">5. Non-Eligible Cases</h3>
                                <p class="card-text">
                                    Returns or replacements may not be accepted in the following cases:
                                </p>
                                <ul>
                                    <li>Request made after 7 days of delivery.</li>
                                    <li>Products damaged due to misuse or improper handling.</li>
                                    <li>Missing original packaging or accessories.</li>
                                    <li>Items marked as non-returnable (if applicable).</li>
                                </ul>
                            </div>
                        </div>

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="card-title">6. Contact Us</h3>
                                <p class="card-text">
                                    If you have any questions about our returns and replacements policy,
                                    please contact our support agent through the
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
        title: 'Returns & Replacements Policy',
    },
}
</script>