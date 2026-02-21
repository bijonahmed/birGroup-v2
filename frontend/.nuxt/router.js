import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from 'ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _953f83dc = () => interopDefault(import('..\\pages\\allbrands.vue' /* webpackChunkName: "pages/allbrands" */))
const _4c2761bc = () => interopDefault(import('..\\pages\\allshop.vue' /* webpackChunkName: "pages/allshop" */))
const _f7eac466 = () => interopDefault(import('..\\pages\\blog.vue' /* webpackChunkName: "pages/blog" */))
const _4606abc2 = () => interopDefault(import('..\\pages\\blog-details.vue' /* webpackChunkName: "pages/blog-details" */))
const _a8460b6a = () => interopDefault(import('..\\pages\\cart.vue' /* webpackChunkName: "pages/cart" */))
const _1f869794 = () => interopDefault(import('..\\pages\\changepassword.vue' /* webpackChunkName: "pages/changepassword" */))
const _6464d0cf = () => interopDefault(import('..\\pages\\changepassword copy.vue' /* webpackChunkName: "pages/changepassword copy" */))
const _1be65abd = () => interopDefault(import('..\\pages\\charity.vue' /* webpackChunkName: "pages/charity" */))
const _4631c7f1 = () => interopDefault(import('..\\pages\\checkout.vue' /* webpackChunkName: "pages/checkout" */))
const _7b5af09c = () => interopDefault(import('..\\pages\\coupons.vue' /* webpackChunkName: "pages/coupons" */))
const _121a4ccc = () => interopDefault(import('..\\pages\\customer-review.vue' /* webpackChunkName: "pages/customer-review" */))
const _34e02d3e = () => interopDefault(import('..\\pages\\flas-sale.vue' /* webpackChunkName: "pages/flas-sale" */))
const _dc1965c0 = () => interopDefault(import('..\\pages\\forget-password.vue' /* webpackChunkName: "pages/forget-password" */))
const _5f35fb4e = () => interopDefault(import('..\\pages\\login.vue' /* webpackChunkName: "pages/login" */))
const _08e0d13b = () => interopDefault(import('..\\pages\\login-old1.0.vue' /* webpackChunkName: "pages/login-old1.0" */))
const _4da5676a = () => interopDefault(import('..\\pages\\official-store.vue' /* webpackChunkName: "pages/official-store" */))
const _a671a70e = () => interopDefault(import('..\\pages\\official-store-grid.vue' /* webpackChunkName: "pages/official-store-grid" */))
const _1435de53 = () => interopDefault(import('..\\pages\\OfficialStoreFilter.vue' /* webpackChunkName: "pages/OfficialStoreFilter" */))
const _6b9b6539 = () => interopDefault(import('..\\pages\\OfficialStoreFilterGrid.vue' /* webpackChunkName: "pages/OfficialStoreFilterGrid" */))
const _bb3733b4 = () => interopDefault(import('..\\pages\\order-confirm.vue' /* webpackChunkName: "pages/order-confirm" */))
const _032d2faa = () => interopDefault(import('..\\pages\\payment.vue' /* webpackChunkName: "pages/payment" */))
const _1123d0e2 = () => interopDefault(import('..\\pages\\product-grid.vue' /* webpackChunkName: "pages/product-grid" */))
const _34add0e7 = () => interopDefault(import('..\\pages\\product-list.vue' /* webpackChunkName: "pages/product-list" */))
const _e750cc3a = () => interopDefault(import('..\\pages\\refund.vue' /* webpackChunkName: "pages/refund" */))
const _e4225c6c = () => interopDefault(import('..\\pages\\required.vue' /* webpackChunkName: "pages/required" */))
const _deccf52c = () => interopDefault(import('..\\pages\\return-and-replacement.vue' /* webpackChunkName: "pages/return-and-replacement" */))
const _54cb04d2 = () => interopDefault(import('..\\pages\\sell-on-ecommerce.vue' /* webpackChunkName: "pages/sell-on-ecommerce" */))
const _65f35856 = () => interopDefault(import('..\\pages\\sell-on-filter.vue' /* webpackChunkName: "pages/sell-on-filter" */))
const _79e45012 = () => interopDefault(import('..\\pages\\seller-form.vue' /* webpackChunkName: "pages/seller-form" */))
const _b07b0662 = () => interopDefault(import('..\\pages\\sellerLogin.vue' /* webpackChunkName: "pages/sellerLogin" */))
const _316de54c = () => interopDefault(import('..\\pages\\service.vue' /* webpackChunkName: "pages/service" */))
const _583948fa = () => interopDefault(import('..\\pages\\signup.vue' /* webpackChunkName: "pages/signup" */))
const _4dfc7863 = () => interopDefault(import('..\\pages\\today-deal.vue' /* webpackChunkName: "pages/today-deal" */))
const _8eb00878 = () => interopDefault(import('..\\pages\\update-password.vue' /* webpackChunkName: "pages/update-password" */))
const _45e57952 = () => interopDefault(import('..\\pages\\affiliate\\affiliate-dashboard.vue' /* webpackChunkName: "pages/affiliate/affiliate-dashboard" */))
const _ecfcacda = () => interopDefault(import('..\\pages\\affiliate\\affiliate-programe.vue' /* webpackChunkName: "pages/affiliate/affiliate-programe" */))
const _0bb8afcd = () => interopDefault(import('..\\pages\\affiliate\\affiliate-programe-register.vue' /* webpackChunkName: "pages/affiliate/affiliate-programe-register" */))
const _84d84bc6 = () => interopDefault(import('..\\pages\\affiliate\\affiliate-transfer.vue' /* webpackChunkName: "pages/affiliate/affiliate-transfer" */))
const _0f88944c = () => interopDefault(import('..\\pages\\brand-product\\brand-grid.vue' /* webpackChunkName: "pages/brand-product/brand-grid" */))
const _c393f120 = () => interopDefault(import('..\\pages\\category\\all-categorys.vue' /* webpackChunkName: "pages/category/all-categorys" */))
const _36a073c8 = () => interopDefault(import('..\\pages\\category\\category-grid.vue' /* webpackChunkName: "pages/category/category-grid" */))
const _21ef7f74 = () => interopDefault(import('..\\pages\\category\\category-list.vue' /* webpackChunkName: "pages/category/category-list" */))
const _ad5b2c38 = () => interopDefault(import('..\\pages\\chatbox\\messages.vue' /* webpackChunkName: "pages/chatbox/messages" */))
const _168377e1 = () => interopDefault(import('..\\pages\\chatbox\\messages copy.vue' /* webpackChunkName: "pages/chatbox/messages copy" */))
const _374544c4 = () => interopDefault(import('..\\pages\\seller\\change-password.vue' /* webpackChunkName: "pages/seller/change-password" */))
const _28a5d249 = () => interopDefault(import('..\\pages\\seller\\order-details.vue' /* webpackChunkName: "pages/seller/order-details" */))
const _b6561968 = () => interopDefault(import('..\\pages\\seller\\seller-account-setting.vue' /* webpackChunkName: "pages/seller/seller-account-setting" */))
const _62c548fa = () => interopDefault(import('..\\pages\\seller\\seller-comission-history.vue' /* webpackChunkName: "pages/seller/seller-comission-history" */))
const _68039d68 = () => interopDefault(import('..\\pages\\seller\\seller-customer-returns.vue' /* webpackChunkName: "pages/seller/seller-customer-returns" */))
const _16e72030 = () => interopDefault(import('..\\pages\\seller\\seller-dashboard.vue' /* webpackChunkName: "pages/seller/seller-dashboard" */))
const _1c565191 = () => interopDefault(import('..\\pages\\seller\\seller-leftsidebar.vue' /* webpackChunkName: "pages/seller/seller-leftsidebar" */))
const _0c28b523 = () => interopDefault(import('..\\pages\\seller\\seller-message.vue' /* webpackChunkName: "pages/seller/seller-message" */))
const _86f4270e = () => interopDefault(import('..\\pages\\seller\\seller-orders.vue' /* webpackChunkName: "pages/seller/seller-orders" */))
const _5aa09c2e = () => interopDefault(import('..\\pages\\seller\\seller-payment-history.vue' /* webpackChunkName: "pages/seller/seller-payment-history" */))
const _05ba9478 = () => interopDefault(import('..\\pages\\seller\\seller-products.vue' /* webpackChunkName: "pages/seller/seller-products" */))
const _94186ef6 = () => interopDefault(import('..\\pages\\seller\\seller-products-post.vue' /* webpackChunkName: "pages/seller/seller-products-post" */))
const _4aca9dc5 = () => interopDefault(import('..\\pages\\seller\\seller-profile.vue' /* webpackChunkName: "pages/seller/seller-profile" */))
const _217a338d = () => interopDefault(import('..\\pages\\seller\\seller-wallet.vue' /* webpackChunkName: "pages/seller/seller-wallet" */))
const _92d13f4e = () => interopDefault(import('..\\pages\\seller\\seller-wishlist.vue' /* webpackChunkName: "pages/seller/seller-wishlist" */))
const _031315c9 = () => interopDefault(import('..\\pages\\user\\account-statement.vue' /* webpackChunkName: "pages/user/account-statement" */))
const _60b717f0 = () => interopDefault(import('..\\pages\\user\\my-reviews.vue' /* webpackChunkName: "pages/user/my-reviews" */))
const _4f59022f = () => interopDefault(import('..\\pages\\user\\myPackages.vue' /* webpackChunkName: "pages/user/myPackages" */))
const _c2c1f9e8 = () => interopDefault(import('..\\pages\\user\\mySalary.vue' /* webpackChunkName: "pages/user/mySalary" */))
const _63345ce8 = () => interopDefault(import('..\\pages\\user\\old_user-withdrawal copy.vue' /* webpackChunkName: "pages/user/old_user-withdrawal copy" */))
const _3eb2e9bd = () => interopDefault(import('..\\pages\\user\\order-details.vue' /* webpackChunkName: "pages/user/order-details" */))
const _df2ff174 = () => interopDefault(import('..\\pages\\user\\track-order.vue' /* webpackChunkName: "pages/user/track-order" */))
const _6bd97d7e = () => interopDefault(import('..\\pages\\user\\user-affiliate.vue' /* webpackChunkName: "pages/user/user-affiliate" */))
const _520c6e7c = () => interopDefault(import('..\\pages\\user\\user-bloglist.vue' /* webpackChunkName: "pages/user/user-bloglist" */))
const _32d0e99e = () => interopDefault(import('..\\pages\\user\\user-blogPost.vue' /* webpackChunkName: "pages/user/user-blogPost" */))
const _11e237ca = () => interopDefault(import('..\\pages\\user\\user-dashborad.vue' /* webpackChunkName: "pages/user/user-dashborad" */))
const _43ffdf22 = () => interopDefault(import('..\\pages\\user\\user-mlm.vue' /* webpackChunkName: "pages/user/user-mlm" */))
const _3ec210a1 = () => interopDefault(import('..\\pages\\user\\user-orders.vue' /* webpackChunkName: "pages/user/user-orders" */))
const _1012fe9d = () => interopDefault(import('..\\pages\\user\\user-profile.vue' /* webpackChunkName: "pages/user/user-profile" */))
const _3640c706 = () => interopDefault(import('..\\pages\\user\\user-requireProduct.vue' /* webpackChunkName: "pages/user/user-requireProduct" */))
const _47b2b308 = () => interopDefault(import('..\\pages\\user\\user-security.vue' /* webpackChunkName: "pages/user/user-security" */))
const _2ade8da2 = () => interopDefault(import('..\\pages\\user\\user-whichlist.vue' /* webpackChunkName: "pages/user/user-whichlist" */))
const _99f75f1e = () => interopDefault(import('..\\pages\\user\\user-withdrawal.vue' /* webpackChunkName: "pages/user/user-withdrawal" */))
const _633da305 = () => interopDefault(import('..\\pages\\seller\\chatbox\\messages.vue' /* webpackChunkName: "pages/seller/chatbox/messages" */))
const _76fe7bf6 = () => interopDefault(import('..\\pages\\seller\\products\\product-edit.vue' /* webpackChunkName: "pages/seller/products/product-edit" */))
const _65939ce8 = () => interopDefault(import('..\\pages\\seller\\products\\product-preview.vue' /* webpackChunkName: "pages/seller/products/product-preview" */))
const _e356b666 = () => interopDefault(import('..\\pages\\seller\\products\\product-varient.vue' /* webpackChunkName: "pages/seller/products/product-varient" */))
const _d4e34f92 = () => interopDefault(import('..\\pages\\index.vue' /* webpackChunkName: "pages/index" */))
const _358008fe = () => interopDefault(import('..\\pages\\user\\invite-user\\_id.vue' /* webpackChunkName: "pages/user/invite-user/_id" */))
const _c6693122 = () => interopDefault(import('..\\pages\\business\\_slug.vue' /* webpackChunkName: "pages/business/_slug" */))
const _05265991 = () => interopDefault(import('..\\pages\\product-details\\_slug.vue' /* webpackChunkName: "pages/product-details/_slug" */))
const _c7cd65ea = () => interopDefault(import('..\\pages\\resetpassword\\_slug.vue' /* webpackChunkName: "pages/resetpassword/_slug" */))

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
    component: _953f83dc,
    name: "allbrands"
  }, {
    path: "/allshop",
    component: _4c2761bc,
    name: "allshop"
  }, {
    path: "/blog",
    component: _f7eac466,
    name: "blog"
  }, {
    path: "/blog-details",
    component: _4606abc2,
    name: "blog-details"
  }, {
    path: "/cart",
    component: _a8460b6a,
    name: "cart"
  }, {
    path: "/changepassword",
    component: _1f869794,
    name: "changepassword"
  }, {
    path: "/changepassword%20copy",
    component: _6464d0cf,
    name: "changepassword copy"
  }, {
    path: "/charity",
    component: _1be65abd,
    name: "charity"
  }, {
    path: "/checkout",
    component: _4631c7f1,
    name: "checkout"
  }, {
    path: "/coupons",
    component: _7b5af09c,
    name: "coupons"
  }, {
    path: "/customer-review",
    component: _121a4ccc,
    name: "customer-review"
  }, {
    path: "/flas-sale",
    component: _34e02d3e,
    name: "flas-sale"
  }, {
    path: "/forget-password",
    component: _dc1965c0,
    name: "forget-password"
  }, {
    path: "/login",
    component: _5f35fb4e,
    name: "login"
  }, {
    path: "/login-old1.0",
    component: _08e0d13b,
    name: "login-old1.0"
  }, {
    path: "/official-store",
    component: _4da5676a,
    name: "official-store"
  }, {
    path: "/official-store-grid",
    component: _a671a70e,
    name: "official-store-grid"
  }, {
    path: "/OfficialStoreFilter",
    component: _1435de53,
    name: "OfficialStoreFilter"
  }, {
    path: "/OfficialStoreFilterGrid",
    component: _6b9b6539,
    name: "OfficialStoreFilterGrid"
  }, {
    path: "/order-confirm",
    component: _bb3733b4,
    name: "order-confirm"
  }, {
    path: "/payment",
    component: _032d2faa,
    name: "payment"
  }, {
    path: "/product-grid",
    component: _1123d0e2,
    name: "product-grid"
  }, {
    path: "/product-list",
    component: _34add0e7,
    name: "product-list"
  }, {
    path: "/refund",
    component: _e750cc3a,
    name: "refund"
  }, {
    path: "/required",
    component: _e4225c6c,
    name: "required"
  }, {
    path: "/return-and-replacement",
    component: _deccf52c,
    name: "return-and-replacement"
  }, {
    path: "/sell-on-ecommerce",
    component: _54cb04d2,
    name: "sell-on-ecommerce"
  }, {
    path: "/sell-on-filter",
    component: _65f35856,
    name: "sell-on-filter"
  }, {
    path: "/seller-form",
    component: _79e45012,
    name: "seller-form"
  }, {
    path: "/sellerLogin",
    component: _b07b0662,
    name: "sellerLogin"
  }, {
    path: "/service",
    component: _316de54c,
    name: "service"
  }, {
    path: "/signup",
    component: _583948fa,
    name: "signup"
  }, {
    path: "/today-deal",
    component: _4dfc7863,
    name: "today-deal"
  }, {
    path: "/update-password",
    component: _8eb00878,
    name: "update-password"
  }, {
    path: "/affiliate/affiliate-dashboard",
    component: _45e57952,
    name: "affiliate-affiliate-dashboard"
  }, {
    path: "/affiliate/affiliate-programe",
    component: _ecfcacda,
    name: "affiliate-affiliate-programe"
  }, {
    path: "/affiliate/affiliate-programe-register",
    component: _0bb8afcd,
    name: "affiliate-affiliate-programe-register"
  }, {
    path: "/affiliate/affiliate-transfer",
    component: _84d84bc6,
    name: "affiliate-affiliate-transfer"
  }, {
    path: "/brand-product/brand-grid",
    component: _0f88944c,
    name: "brand-product-brand-grid"
  }, {
    path: "/category/all-categorys",
    component: _c393f120,
    name: "category-all-categorys"
  }, {
    path: "/category/category-grid",
    component: _36a073c8,
    name: "category-category-grid"
  }, {
    path: "/category/category-list",
    component: _21ef7f74,
    name: "category-category-list"
  }, {
    path: "/chatbox/messages",
    component: _ad5b2c38,
    name: "chatbox-messages"
  }, {
    path: "/chatbox/messages%20copy",
    component: _168377e1,
    name: "chatbox-messages copy"
  }, {
    path: "/seller/change-password",
    component: _374544c4,
    name: "seller-change-password"
  }, {
    path: "/seller/order-details",
    component: _28a5d249,
    name: "seller-order-details"
  }, {
    path: "/seller/seller-account-setting",
    component: _b6561968,
    name: "seller-seller-account-setting"
  }, {
    path: "/seller/seller-comission-history",
    component: _62c548fa,
    name: "seller-seller-comission-history"
  }, {
    path: "/seller/seller-customer-returns",
    component: _68039d68,
    name: "seller-seller-customer-returns"
  }, {
    path: "/seller/seller-dashboard",
    component: _16e72030,
    name: "seller-seller-dashboard"
  }, {
    path: "/seller/seller-leftsidebar",
    component: _1c565191,
    name: "seller-seller-leftsidebar"
  }, {
    path: "/seller/seller-message",
    component: _0c28b523,
    name: "seller-seller-message"
  }, {
    path: "/seller/seller-orders",
    component: _86f4270e,
    name: "seller-seller-orders"
  }, {
    path: "/seller/seller-payment-history",
    component: _5aa09c2e,
    name: "seller-seller-payment-history"
  }, {
    path: "/seller/seller-products",
    component: _05ba9478,
    name: "seller-seller-products"
  }, {
    path: "/seller/seller-products-post",
    component: _94186ef6,
    name: "seller-seller-products-post"
  }, {
    path: "/seller/seller-profile",
    component: _4aca9dc5,
    name: "seller-seller-profile"
  }, {
    path: "/seller/seller-wallet",
    component: _217a338d,
    name: "seller-seller-wallet"
  }, {
    path: "/seller/seller-wishlist",
    component: _92d13f4e,
    name: "seller-seller-wishlist"
  }, {
    path: "/user/account-statement",
    component: _031315c9,
    name: "user-account-statement"
  }, {
    path: "/user/my-reviews",
    component: _60b717f0,
    name: "user-my-reviews"
  }, {
    path: "/user/myPackages",
    component: _4f59022f,
    name: "user-myPackages"
  }, {
    path: "/user/mySalary",
    component: _c2c1f9e8,
    name: "user-mySalary"
  }, {
    path: "/user/old_user-withdrawal%20copy",
    component: _63345ce8,
    name: "user-old_user-withdrawal copy"
  }, {
    path: "/user/order-details",
    component: _3eb2e9bd,
    name: "user-order-details"
  }, {
    path: "/user/track-order",
    component: _df2ff174,
    name: "user-track-order"
  }, {
    path: "/user/user-affiliate",
    component: _6bd97d7e,
    name: "user-user-affiliate"
  }, {
    path: "/user/user-bloglist",
    component: _520c6e7c,
    name: "user-user-bloglist"
  }, {
    path: "/user/user-blogPost",
    component: _32d0e99e,
    name: "user-user-blogPost"
  }, {
    path: "/user/user-dashborad",
    component: _11e237ca,
    name: "user-user-dashborad"
  }, {
    path: "/user/user-mlm",
    component: _43ffdf22,
    name: "user-user-mlm"
  }, {
    path: "/user/user-orders",
    component: _3ec210a1,
    name: "user-user-orders"
  }, {
    path: "/user/user-profile",
    component: _1012fe9d,
    name: "user-user-profile"
  }, {
    path: "/user/user-requireProduct",
    component: _3640c706,
    name: "user-user-requireProduct"
  }, {
    path: "/user/user-security",
    component: _47b2b308,
    name: "user-user-security"
  }, {
    path: "/user/user-whichlist",
    component: _2ade8da2,
    name: "user-user-whichlist"
  }, {
    path: "/user/user-withdrawal",
    component: _99f75f1e,
    name: "user-user-withdrawal"
  }, {
    path: "/seller/chatbox/messages",
    component: _633da305,
    name: "seller-chatbox-messages"
  }, {
    path: "/seller/products/product-edit",
    component: _76fe7bf6,
    name: "seller-products-product-edit"
  }, {
    path: "/seller/products/product-preview",
    component: _65939ce8,
    name: "seller-products-product-preview"
  }, {
    path: "/seller/products/product-varient",
    component: _e356b666,
    name: "seller-products-product-varient"
  }, {
    path: "/",
    component: _d4e34f92,
    name: "index"
  }, {
    path: "/user/invite-user/:id?",
    component: _358008fe,
    name: "user-invite-user-id"
  }, {
    path: "/business/:slug?",
    component: _c6693122,
    name: "business-slug"
  }, {
    path: "/product-details/:slug?",
    component: _05265991,
    name: "product-details-slug"
  }, {
    path: "/resetpassword/:slug?",
    component: _c7cd65ea,
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
