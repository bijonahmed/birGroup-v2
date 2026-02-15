import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from 'ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _5e923c28 = () => interopDefault(import('..\\pages\\allbrands.vue' /* webpackChunkName: "pages/allbrands" */))
const _f664255c = () => interopDefault(import('..\\pages\\allshop.vue' /* webpackChunkName: "pages/allshop" */))
const _3d4ba9f7 = () => interopDefault(import('..\\pages\\blog.vue' /* webpackChunkName: "pages/blog" */))
const _92942428 = () => interopDefault(import('..\\pages\\blog-details.vue' /* webpackChunkName: "pages/blog-details" */))
const _651e0675 = () => interopDefault(import('..\\pages\\cart.vue' /* webpackChunkName: "pages/cart" */))
const _1bb7d840 = () => interopDefault(import('..\\pages\\changepassword.vue' /* webpackChunkName: "pages/changepassword" */))
const _8d4ea936 = () => interopDefault(import('..\\pages\\changepassword copy.vue' /* webpackChunkName: "pages/changepassword copy" */))
const _548ce653 = () => interopDefault(import('..\\pages\\charity.vue' /* webpackChunkName: "pages/charity" */))
const _225caf1b = () => interopDefault(import('..\\pages\\checkout.vue' /* webpackChunkName: "pages/checkout" */))
const _0a0dd970 = () => interopDefault(import('..\\pages\\coupons.vue' /* webpackChunkName: "pages/coupons" */))
const _4d1ee262 = () => interopDefault(import('..\\pages\\customer-review.vue' /* webpackChunkName: "pages/customer-review" */))
const _e27c3112 = () => interopDefault(import('..\\pages\\flas-sale.vue' /* webpackChunkName: "pages/flas-sale" */))
const _66103a94 = () => interopDefault(import('..\\pages\\forget-password.vue' /* webpackChunkName: "pages/forget-password" */))
const _63d31738 = () => interopDefault(import('..\\pages\\login.vue' /* webpackChunkName: "pages/login" */))
const _79901365 = () => interopDefault(import('..\\pages\\login-old1.0.vue' /* webpackChunkName: "pages/login-old1.0" */))
const _4f8cc714 = () => interopDefault(import('..\\pages\\official-store.vue' /* webpackChunkName: "pages/official-store" */))
const _01bb070f = () => interopDefault(import('..\\pages\\official-store-grid.vue' /* webpackChunkName: "pages/official-store-grid" */))
const _6929b8e9 = () => interopDefault(import('..\\pages\\OfficialStoreFilter.vue' /* webpackChunkName: "pages/OfficialStoreFilter" */))
const _175404cf = () => interopDefault(import('..\\pages\\OfficialStoreFilterGrid.vue' /* webpackChunkName: "pages/OfficialStoreFilterGrid" */))
const _479d693c = () => interopDefault(import('..\\pages\\order-confirm.vue' /* webpackChunkName: "pages/order-confirm" */))
const _370ff3c1 = () => interopDefault(import('..\\pages\\payment.vue' /* webpackChunkName: "pages/payment" */))
const _681d59b9 = () => interopDefault(import('..\\pages\\product-grid.vue' /* webpackChunkName: "pages/product-grid" */))
const _b545d9de = () => interopDefault(import('..\\pages\\product-list.vue' /* webpackChunkName: "pages/product-list" */))
const _0cf378e6 = () => interopDefault(import('..\\pages\\refund.vue' /* webpackChunkName: "pages/refund" */))
const _6a19b8f4 = () => interopDefault(import('..\\pages\\required.vue' /* webpackChunkName: "pages/required" */))
const _d3b8c9d8 = () => interopDefault(import('..\\pages\\return-and-replacement.vue' /* webpackChunkName: "pages/return-and-replacement" */))
const _3dfee630 = () => interopDefault(import('..\\pages\\sell-on-ecommerce.vue' /* webpackChunkName: "pages/sell-on-ecommerce" */))
const _67dab800 = () => interopDefault(import('..\\pages\\sell-on-filter.vue' /* webpackChunkName: "pages/sell-on-filter" */))
const _308eaee6 = () => interopDefault(import('..\\pages\\seller-form.vue' /* webpackChunkName: "pages/seller-form" */))
const _67256536 = () => interopDefault(import('..\\pages\\sellerLogin.vue' /* webpackChunkName: "pages/sellerLogin" */))
const _1fef98f0 = () => interopDefault(import('..\\pages\\service.vue' /* webpackChunkName: "pages/service" */))
const _4112052d = () => interopDefault(import('..\\pages\\signup.vue' /* webpackChunkName: "pages/signup" */))
const _69eb85e6 = () => interopDefault(import('..\\pages\\today-deal.vue' /* webpackChunkName: "pages/today-deal" */))
const _18a6dd4c = () => interopDefault(import('..\\pages\\update-password.vue' /* webpackChunkName: "pages/update-password" */))
const _33fc44fc = () => interopDefault(import('..\\pages\\affiliate\\affiliate-dashboard.vue' /* webpackChunkName: "pages/affiliate/affiliate-dashboard" */))
const _ee247eae = () => interopDefault(import('..\\pages\\affiliate\\affiliate-programe.vue' /* webpackChunkName: "pages/affiliate/affiliate-programe" */))
const _3d463177 = () => interopDefault(import('..\\pages\\affiliate\\affiliate-programe-register.vue' /* webpackChunkName: "pages/affiliate/affiliate-programe-register" */))
const _86001d9a = () => interopDefault(import('..\\pages\\affiliate\\affiliate-transfer.vue' /* webpackChunkName: "pages/affiliate/affiliate-transfer" */))
const _cf6a7020 = () => interopDefault(import('..\\pages\\brand-product\\brand-grid.vue' /* webpackChunkName: "pages/brand-product/brand-grid" */))
const _49eea706 = () => interopDefault(import('..\\pages\\category\\all-categorys.vue' /* webpackChunkName: "pages/category/all-categorys" */))
const _df2f349c = () => interopDefault(import('..\\pages\\category\\category-grid.vue' /* webpackChunkName: "pages/category/category-grid" */))
const _64afc1ec = () => interopDefault(import('..\\pages\\category\\category-list.vue' /* webpackChunkName: "pages/category/category-list" */))
const _3587f1fa = () => interopDefault(import('..\\pages\\chatbox\\messages.vue' /* webpackChunkName: "pages/chatbox/messages" */))
const _1c0d8d8b = () => interopDefault(import('..\\pages\\chatbox\\messages copy.vue' /* webpackChunkName: "pages/chatbox/messages copy" */))
const _dfd40598 = () => interopDefault(import('..\\pages\\seller\\change-password.vue' /* webpackChunkName: "pages/seller/change-password" */))
const _100d5f5f = () => interopDefault(import('..\\pages\\seller\\order-details.vue' /* webpackChunkName: "pages/seller/order-details" */))
const _da288214 = () => interopDefault(import('..\\pages\\seller\\seller-account-setting.vue' /* webpackChunkName: "pages/seller/seller-account-setting" */))
const _dba036a6 = () => interopDefault(import('..\\pages\\seller\\seller-comission-history.vue' /* webpackChunkName: "pages/seller/seller-comission-history" */))
const _3cc646fe = () => interopDefault(import('..\\pages\\seller\\seller-customer-returns.vue' /* webpackChunkName: "pages/seller/seller-customer-returns" */))
const _3b7b194c = () => interopDefault(import('..\\pages\\seller\\seller-dashboard.vue' /* webpackChunkName: "pages/seller/seller-dashboard" */))
const _7e29823b = () => interopDefault(import('..\\pages\\seller\\seller-leftsidebar.vue' /* webpackChunkName: "pages/seller/seller-leftsidebar" */))
const _11b2cacd = () => interopDefault(import('..\\pages\\seller\\seller-message.vue' /* webpackChunkName: "pages/seller/seller-message" */))
const _b8250ce2 = () => interopDefault(import('..\\pages\\seller\\seller-orders.vue' /* webpackChunkName: "pages/seller/seller-orders" */))
const _7e7304da = () => interopDefault(import('..\\pages\\seller\\seller-payment-history.vue' /* webpackChunkName: "pages/seller/seller-payment-history" */))
const _9d1997e4 = () => interopDefault(import('..\\pages\\seller\\seller-products.vue' /* webpackChunkName: "pages/seller/seller-products" */))
const _208512a2 = () => interopDefault(import('..\\pages\\seller\\seller-products-post.vue' /* webpackChunkName: "pages/seller/seller-products-post" */))
const _5054b36f = () => interopDefault(import('..\\pages\\seller\\seller-profile.vue' /* webpackChunkName: "pages/seller/seller-profile" */))
const _08e1c0a3 = () => interopDefault(import('..\\pages\\seller\\seller-wallet.vue' /* webpackChunkName: "pages/seller/seller-wallet" */))
const _624fffef = () => interopDefault(import('..\\pages\\seller\\seller-wishlist.vue' /* webpackChunkName: "pages/seller/seller-wishlist" */))
const _a2689542 = () => interopDefault(import('..\\pages\\user\\account-statement.vue' /* webpackChunkName: "pages/user/account-statement" */))
const _f37595cc = () => interopDefault(import('..\\pages\\user\\my-reviews.vue' /* webpackChunkName: "pages/user/my-reviews" */))
const _74e71f59 = () => interopDefault(import('..\\pages\\user\\myPackages.vue' /* webpackChunkName: "pages/user/myPackages" */))
const _bef33a94 = () => interopDefault(import('..\\pages\\user\\mySalary.vue' /* webpackChunkName: "pages/user/mySalary" */))
const _8706c594 = () => interopDefault(import('..\\pages\\user\\old_user-withdrawal copy.vue' /* webpackChunkName: "pages/user/old_user-withdrawal copy" */))
const _d8b2775a = () => interopDefault(import('..\\pages\\user\\order-details.vue' /* webpackChunkName: "pages/user/order-details" */))
const _1c9d8f5c = () => interopDefault(import('..\\pages\\user\\track-order.vue' /* webpackChunkName: "pages/user/track-order" */))
const _139ab96b = () => interopDefault(import('..\\pages\\user\\user-affiliate.vue' /* webpackChunkName: "pages/user/user-affiliate" */))
const _b1ff6ddc = () => interopDefault(import('..\\pages\\user\\user-bloglist.vue' /* webpackChunkName: "pages/user/user-bloglist" */))
const _f0767798 = () => interopDefault(import('..\\pages\\user\\user-blogPost.vue' /* webpackChunkName: "pages/user/user-blogPost" */))
const _5b69aff4 = () => interopDefault(import('..\\pages\\user\\user-dashborad.vue' /* webpackChunkName: "pages/user/user-dashborad" */))
const _45e73ecc = () => interopDefault(import('..\\pages\\user\\user-mlm.vue' /* webpackChunkName: "pages/user/user-mlm" */))
const _6a10ce92 = () => interopDefault(import('..\\pages\\user\\user-orders.vue' /* webpackChunkName: "pages/user/user-orders" */))
const _0a8e7947 = () => interopDefault(import('..\\pages\\user\\user-profile.vue' /* webpackChunkName: "pages/user/user-profile" */))
const _53604dc8 = () => interopDefault(import('..\\pages\\user\\user-requireProduct.vue' /* webpackChunkName: "pages/user/user-requireProduct" */))
const _311a8112 = () => interopDefault(import('..\\pages\\user\\user-security.vue' /* webpackChunkName: "pages/user/user-security" */))
const _34183159 = () => interopDefault(import('..\\pages\\user\\user-whichlist.vue' /* webpackChunkName: "pages/user/user-whichlist" */))
const _cb2844f2 = () => interopDefault(import('..\\pages\\user\\user-withdrawal.vue' /* webpackChunkName: "pages/user/user-withdrawal" */))
const _034cb51b = () => interopDefault(import('..\\pages\\seller\\chatbox\\messages.vue' /* webpackChunkName: "pages/seller/chatbox/messages" */))
const _651547a0 = () => interopDefault(import('..\\pages\\seller\\products\\product-edit.vue' /* webpackChunkName: "pages/seller/products/product-edit" */))
const _7bf4cda2 = () => interopDefault(import('..\\pages\\seller\\products\\product-preview.vue' /* webpackChunkName: "pages/seller/products/product-preview" */))
const _3d1340e3 = () => interopDefault(import('..\\pages\\seller\\products\\product-varient.vue' /* webpackChunkName: "pages/seller/products/product-varient" */))
const _046ed14d = () => interopDefault(import('..\\pages\\index.vue' /* webpackChunkName: "pages/index" */))
const _2a6bddaa = () => interopDefault(import('..\\pages\\user\\invite-user\\_id.vue' /* webpackChunkName: "pages/user/invite-user/_id" */))
const _506005f6 = () => interopDefault(import('..\\pages\\business\\_slug.vue' /* webpackChunkName: "pages/business/_slug" */))
const _0ab06f3b = () => interopDefault(import('..\\pages\\product-details\\_slug.vue' /* webpackChunkName: "pages/product-details/_slug" */))
const _34be7596 = () => interopDefault(import('..\\pages\\resetpassword\\_slug.vue' /* webpackChunkName: "pages/resetpassword/_slug" */))

const emptyFn = () => {}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/allbrands",
    component: _5e923c28,
    name: "allbrands"
  }, {
    path: "/allshop",
    component: _f664255c,
    name: "allshop"
  }, {
    path: "/blog",
    component: _3d4ba9f7,
    name: "blog"
  }, {
    path: "/blog-details",
    component: _92942428,
    name: "blog-details"
  }, {
    path: "/cart",
    component: _651e0675,
    name: "cart"
  }, {
    path: "/changepassword",
    component: _1bb7d840,
    name: "changepassword"
  }, {
    path: "/changepassword%20copy",
    component: _8d4ea936,
    name: "changepassword copy"
  }, {
    path: "/charity",
    component: _548ce653,
    name: "charity"
  }, {
    path: "/checkout",
    component: _225caf1b,
    name: "checkout"
  }, {
    path: "/coupons",
    component: _0a0dd970,
    name: "coupons"
  }, {
    path: "/customer-review",
    component: _4d1ee262,
    name: "customer-review"
  }, {
    path: "/flas-sale",
    component: _e27c3112,
    name: "flas-sale"
  }, {
    path: "/forget-password",
    component: _66103a94,
    name: "forget-password"
  }, {
    path: "/login",
    component: _63d31738,
    name: "login"
  }, {
    path: "/login-old1.0",
    component: _79901365,
    name: "login-old1.0"
  }, {
    path: "/official-store",
    component: _4f8cc714,
    name: "official-store"
  }, {
    path: "/official-store-grid",
    component: _01bb070f,
    name: "official-store-grid"
  }, {
    path: "/OfficialStoreFilter",
    component: _6929b8e9,
    name: "OfficialStoreFilter"
  }, {
    path: "/OfficialStoreFilterGrid",
    component: _175404cf,
    name: "OfficialStoreFilterGrid"
  }, {
    path: "/order-confirm",
    component: _479d693c,
    name: "order-confirm"
  }, {
    path: "/payment",
    component: _370ff3c1,
    name: "payment"
  }, {
    path: "/product-grid",
    component: _681d59b9,
    name: "product-grid"
  }, {
    path: "/product-list",
    component: _b545d9de,
    name: "product-list"
  }, {
    path: "/refund",
    component: _0cf378e6,
    name: "refund"
  }, {
    path: "/required",
    component: _6a19b8f4,
    name: "required"
  }, {
    path: "/return-and-replacement",
    component: _d3b8c9d8,
    name: "return-and-replacement"
  }, {
    path: "/sell-on-ecommerce",
    component: _3dfee630,
    name: "sell-on-ecommerce"
  }, {
    path: "/sell-on-filter",
    component: _67dab800,
    name: "sell-on-filter"
  }, {
    path: "/seller-form",
    component: _308eaee6,
    name: "seller-form"
  }, {
    path: "/sellerLogin",
    component: _67256536,
    name: "sellerLogin"
  }, {
    path: "/service",
    component: _1fef98f0,
    name: "service"
  }, {
    path: "/signup",
    component: _4112052d,
    name: "signup"
  }, {
    path: "/today-deal",
    component: _69eb85e6,
    name: "today-deal"
  }, {
    path: "/update-password",
    component: _18a6dd4c,
    name: "update-password"
  }, {
    path: "/affiliate/affiliate-dashboard",
    component: _33fc44fc,
    name: "affiliate-affiliate-dashboard"
  }, {
    path: "/affiliate/affiliate-programe",
    component: _ee247eae,
    name: "affiliate-affiliate-programe"
  }, {
    path: "/affiliate/affiliate-programe-register",
    component: _3d463177,
    name: "affiliate-affiliate-programe-register"
  }, {
    path: "/affiliate/affiliate-transfer",
    component: _86001d9a,
    name: "affiliate-affiliate-transfer"
  }, {
    path: "/brand-product/brand-grid",
    component: _cf6a7020,
    name: "brand-product-brand-grid"
  }, {
    path: "/category/all-categorys",
    component: _49eea706,
    name: "category-all-categorys"
  }, {
    path: "/category/category-grid",
    component: _df2f349c,
    name: "category-category-grid"
  }, {
    path: "/category/category-list",
    component: _64afc1ec,
    name: "category-category-list"
  }, {
    path: "/chatbox/messages",
    component: _3587f1fa,
    name: "chatbox-messages"
  }, {
    path: "/chatbox/messages%20copy",
    component: _1c0d8d8b,
    name: "chatbox-messages copy"
  }, {
    path: "/seller/change-password",
    component: _dfd40598,
    name: "seller-change-password"
  }, {
    path: "/seller/order-details",
    component: _100d5f5f,
    name: "seller-order-details"
  }, {
    path: "/seller/seller-account-setting",
    component: _da288214,
    name: "seller-seller-account-setting"
  }, {
    path: "/seller/seller-comission-history",
    component: _dba036a6,
    name: "seller-seller-comission-history"
  }, {
    path: "/seller/seller-customer-returns",
    component: _3cc646fe,
    name: "seller-seller-customer-returns"
  }, {
    path: "/seller/seller-dashboard",
    component: _3b7b194c,
    name: "seller-seller-dashboard"
  }, {
    path: "/seller/seller-leftsidebar",
    component: _7e29823b,
    name: "seller-seller-leftsidebar"
  }, {
    path: "/seller/seller-message",
    component: _11b2cacd,
    name: "seller-seller-message"
  }, {
    path: "/seller/seller-orders",
    component: _b8250ce2,
    name: "seller-seller-orders"
  }, {
    path: "/seller/seller-payment-history",
    component: _7e7304da,
    name: "seller-seller-payment-history"
  }, {
    path: "/seller/seller-products",
    component: _9d1997e4,
    name: "seller-seller-products"
  }, {
    path: "/seller/seller-products-post",
    component: _208512a2,
    name: "seller-seller-products-post"
  }, {
    path: "/seller/seller-profile",
    component: _5054b36f,
    name: "seller-seller-profile"
  }, {
    path: "/seller/seller-wallet",
    component: _08e1c0a3,
    name: "seller-seller-wallet"
  }, {
    path: "/seller/seller-wishlist",
    component: _624fffef,
    name: "seller-seller-wishlist"
  }, {
    path: "/user/account-statement",
    component: _a2689542,
    name: "user-account-statement"
  }, {
    path: "/user/my-reviews",
    component: _f37595cc,
    name: "user-my-reviews"
  }, {
    path: "/user/myPackages",
    component: _74e71f59,
    name: "user-myPackages"
  }, {
    path: "/user/mySalary",
    component: _bef33a94,
    name: "user-mySalary"
  }, {
    path: "/user/old_user-withdrawal%20copy",
    component: _8706c594,
    name: "user-old_user-withdrawal copy"
  }, {
    path: "/user/order-details",
    component: _d8b2775a,
    name: "user-order-details"
  }, {
    path: "/user/track-order",
    component: _1c9d8f5c,
    name: "user-track-order"
  }, {
    path: "/user/user-affiliate",
    component: _139ab96b,
    name: "user-user-affiliate"
  }, {
    path: "/user/user-bloglist",
    component: _b1ff6ddc,
    name: "user-user-bloglist"
  }, {
    path: "/user/user-blogPost",
    component: _f0767798,
    name: "user-user-blogPost"
  }, {
    path: "/user/user-dashborad",
    component: _5b69aff4,
    name: "user-user-dashborad"
  }, {
    path: "/user/user-mlm",
    component: _45e73ecc,
    name: "user-user-mlm"
  }, {
    path: "/user/user-orders",
    component: _6a10ce92,
    name: "user-user-orders"
  }, {
    path: "/user/user-profile",
    component: _0a8e7947,
    name: "user-user-profile"
  }, {
    path: "/user/user-requireProduct",
    component: _53604dc8,
    name: "user-user-requireProduct"
  }, {
    path: "/user/user-security",
    component: _311a8112,
    name: "user-user-security"
  }, {
    path: "/user/user-whichlist",
    component: _34183159,
    name: "user-user-whichlist"
  }, {
    path: "/user/user-withdrawal",
    component: _cb2844f2,
    name: "user-user-withdrawal"
  }, {
    path: "/seller/chatbox/messages",
    component: _034cb51b,
    name: "seller-chatbox-messages"
  }, {
    path: "/seller/products/product-edit",
    component: _651547a0,
    name: "seller-products-product-edit"
  }, {
    path: "/seller/products/product-preview",
    component: _7bf4cda2,
    name: "seller-products-product-preview"
  }, {
    path: "/seller/products/product-varient",
    component: _3d1340e3,
    name: "seller-products-product-varient"
  }, {
    path: "/",
    component: _046ed14d,
    name: "index"
  }, {
    path: "/user/invite-user/:id?",
    component: _2a6bddaa,
    name: "user-invite-user-id"
  }, {
    path: "/business/:slug?",
    component: _506005f6,
    name: "business-slug"
  }, {
    path: "/product-details/:slug?",
    component: _0ab06f3b,
    name: "product-details-slug"
  }, {
    path: "/resetpassword/:slug?",
    component: _34be7596,
    name: "resetpassword-slug"
  }],

  fallback: false
}

export function createRouter (ssrContext, config) {
  const base = (config._app && config._app.basePath) || routerOptions.base
  const router = new Router({ ...routerOptions, base  })

  // TODO: remove in Nuxt 3
  const originalPush = router.push
  router.push = function push (location, onComplete = emptyFn, onAbort) {
    return originalPush.call(this, location, onComplete, onAbort)
  }

  const resolve = router.resolve.bind(router)
  router.resolve = (to, current, append) => {
    if (typeof to === 'string') {
      to = normalizeURL(to)
    }
    return resolve(to, current, append)
  }

  return router
}
