<template>
  <div>
    <LogoAndPayment />
    <NavbarSecond />

    <section class="main_content mt-3 mb-5">
      <div class="container">

        <!-- Page Title -->
        <div class="row mb-4">
          <div class="col-md-12">
            <h3 class="contact-title">Contact Us</h3>
            <hr />
          </div>
        </div>

        <!-- Map + Contact Info -->
        <div class="row g-4">

          <!-- Google Map -->
          <div class="col-md-7">
            <div class="mapouter">
              <div class="gmap_canvas">
                <iframe
                  class="gmap_iframe"
                  width="100%"
                  frameborder="0"
                  scrolling="no"
                  marginheight="0"
                  marginwidth="0"
                  src="https://maps.google.com/maps?width=600&height=400&hl=en&q=Navana+Osman+link,+214/d+Bir+Uttam+Mir+Shawkat+Sarak,+Dhaka+1208&t=&z=14&ie=UTF8&iwloc=B&output=embed"
                ></iframe>
              </div>
            </div>
          </div>

          <!-- Contact Details -->
          <div class="col-md-5">
            <div class="contact-card">
              <h5 class="contact-card__heading">Get In Touch</h5>

              <!-- Address -->
              <div class="contact-item">
                <div class="contact-item__icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                  </svg>
                </div>
                <div class="contact-item__text">
                  <span class="contact-item__label">Address</span>
                  <span>6th &amp; 7th Floor, Navana Osman Link,<br />214/d Bir Uttam Mir Shawkat Sarak,<br />Dhaka 1208</span>
                </div>
              </div>

              <!-- Email -->
              <div class="contact-item">
                <div class="contact-item__icon">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5-8-5V6l8 5 8-5v2z"/>
                  </svg>
                </div>
                <div class="contact-item__text">
                  <span class="contact-item__label">Email</span>
                  <a href="mailto:birgh.group.digital@gmail.com">birgh.group.digital@gmail.com</a>
                </div>
              </div>

              <!-- WhatsApp -->
              <div class="contact-item">
                <div class="contact-item__icon contact-item__icon--whatsapp">
                  <!-- WhatsApp SVG Icon -->
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/>
                  </svg>
                </div>
                <div class="contact-item__text">
                  <span class="contact-item__label">WhatsApp</span>
                  
                    <a :href="`https://wa.me/88${whatsappNumber}`"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="whatsapp-link"
                  >
                    {{ whatsappNumber }}
                  </a>
                </div>
              </div>

              <!-- WhatsApp Button -->
              
                <a :href="`https://wa.me/88${whatsappNumber}`"
                target="_blank"
                rel="noopener noreferrer"
                class="whatsapp-btn"
              >
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                  <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/>
                </svg>
                Chat on WhatsApp
              </a>

            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- Back to top -->
    <div class="back_top">
      <a href="#top"><i class="fa-solid fa-angle-up"></i></a>
    </div>

    <!-- Success message -->
    <div v-if="showSuccessMessage" class="success-message">
      Code copied successfully!
    </div>

    <Footer />
  </div>
</template>


<script>
import NavbarSecond from '~/components/NavbarSecond.vue';
import Common_MobileSidebar from '~/components/Common_MobileSidebar.vue';
import Common_MiniTabNavbar from '~/components/Common_MiniTabNavbar.vue';
import Common_MobileSearchProduct from '~/components/Common_MobileSearchProduct.vue';
import RecentView from '~/components/RecentView.vue';
import FlashSaleFilter from '~/components/FlashSaleFilter.vue';
import OfficialStoreProductList from '~/components/OfficialStoreProductList.vue';

export default {
  components: {
    NavbarSecond,
    Common_MobileSidebar,
    Common_MiniTabNavbar,
    Common_MobileSearchProduct,
    RecentView,
    FlashSaleFilter,
    OfficialStoreProductList,
  },

  head() {
    return {
      title: 'Contact Us - Bir Group',
      meta: [
        {
          hid: 'description',
          name: 'description',
          content: 'Contact Bir Group - 6th & 7th Floor, Navana Osman Link, 214/d Bir Uttam Mir Shawkat Sarak, Dhaka 1208',
        },
      ],
    };
  },

  data() {
    return {
      showSuccessMessage: false,
      whatsappNumber: '01329683606',
      email: 'birgh.group.digital@gmail.com',
    };
  },
};
</script>


<style scoped>
/* ── Contact Title ── */
.contact-title {
  font-weight: 700;
  color: #222;
}

/* ── Map ── */
.mapouter {
  position: relative;
  width: 100%;
  height: 420px;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.12);
}

.gmap_canvas {
  width: 100%;
  height: 100%;
  background: none !important;
  overflow: hidden;
}

.gmap_iframe {
  width: 100% !important;
  height: 420px !important;
  border: 0;
}

/* ── Contact Card ── */
.contact-card {
  background: #fff;
  border-radius: 10px;
  padding: 28px 24px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.09);
  height: 100%;
}

.contact-card__heading {
  font-weight: 700;
  margin-bottom: 24px;
  color: #222;
  font-size: 1.2rem;
  border-left: 4px solid #25d366;
  padding-left: 10px;
}

/* ── Contact Items ── */
.contact-item {
  display: flex;
  align-items: flex-start;
  gap: 14px;
  margin-bottom: 22px;
}

.contact-item__icon {
  flex-shrink: 0;
  width: 38px;
  height: 38px;
  border-radius: 50%;
  background: #f0f4ff;
  color: #4a6cf7;
  display: flex;
  align-items: center;
  justify-content: center;
}

.contact-item__icon--whatsapp {
  background: #e8faf0;
  color: #25d366;
}

.contact-item__text {
  display: flex;
  flex-direction: column;
  font-size: 0.9rem;
  color: #444;
  line-height: 1.6;
}

.contact-item__label {
  font-weight: 600;
  color: #222;
  margin-bottom: 2px;
  font-size: 0.82rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.contact-item__text a {
  color: #4a6cf7;
  text-decoration: none;
  word-break: break-all;
}

.contact-item__text a:hover {
  text-decoration: underline;
}

.whatsapp-link {
  color: #25d366 !important;
}

/* ── WhatsApp Button ── */
.whatsapp-btn {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  background: #25d366;
  color: #fff !important;
  text-decoration: none !important;
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 0.95rem;
  margin-top: 8px;
  transition: background 0.2s ease;
}

.whatsapp-btn:hover {
  background: #1ebe5d;
}

/* ── Success Message ── */
.success-message {
  position: fixed;
  bottom: 30px;
  right: 30px;
  background: #25d366;
  color: white;
  padding: 12px 20px;
  border-radius: 6px;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(0,0,0,0.15);
  z-index: 9999;
}
</style>