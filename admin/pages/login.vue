<template>
    <div class="login-root">

        <div class="bg-layer">
            <span class="bg-circle bc-1"></span>
            <span class="bg-circle bc-2"></span>
            <span class="bg-circle bc-3"></span>
            <div class="bg-grid"></div>
        </div>

        <div class="login-card">

            <!-- ── Left Brand Panel ── -->
            <div class="brand-panel">
                <div class="brand-inner">
                    <div class="logo-wrap">
                        <img src="/images/logo.png" alt="WBiG E-Commerce" class="brand-logo" />
                    </div>
                    <div class="brand-tagline">
                        <h1 class="brand-headline">Your <span class="hl-gold">Power</span><br />Commerce<br />Platform.
                        </h1>
                        <p class="brand-desc">Manage your store, track orders and grow your business — all from one
                            powerful dashboard.</p>
                    </div>
                    <div class="brand-stats">
                        <div class="stat-item">
                            <span class="stat-num">10K+</span>
                            <span class="stat-lbl">Active Sellers</span>
                        </div>
                        <div class="stat-divider"></div>
                        <div class="stat-item">
                            <span class="stat-num">99.9%</span>
                            <span class="stat-lbl">Uptime</span>
                        </div>
                        <div class="stat-divider"></div>
                        <div class="stat-item">
                            <span class="stat-num">24/7</span>
                            <span class="stat-lbl">Support</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ── Right Form Panel ── -->
            <div class="form-panel">
                <div class="form-inner">
                    <div class="form-top">
                        <div class="form-badge">
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2.5">
                                <rect x="3" y="11" width="18" height="11" rx="2" />
                                <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                            </svg>
                            Secure Login
                        </div>
                        <h2 class="form-title">Welcome back!</h2>
                        <p class="form-sub">Sign in to your Bir account</p>
                    </div>

                    <transition name="alert-fade">
                        <div class="alert-box" v-if="loginForm.errors.errors.account">
                            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                stroke-width="2">
                                <circle cx="12" cy="12" r="10" />
                                <line x1="12" y1="8" x2="12" y2="12" />
                                <line x1="12" y1="16" x2="12.01" y2="16" />
                            </svg>
                            {{ loginForm.errors.errors.account[0] }}
                        </div>
                    </transition>

                    <form @submit.prevent="userLogin" @keydown="loginForm.onKeydown($event)" class="login-form">
                        <div class="field" :class="{ 'field--error': loginForm.errors.has('email') }">
                            <label class="field-label" for="inp-email">Email Address</label>
                            <div class="input-shell">
                                <svg class="inp-icon" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2">
                                    <path
                                        d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
                                    <polyline points="22,6 12,13 2,6" />
                                </svg>
                                <input id="inp-email" type="text" v-model="loginForm.email" name="email"
                                    placeholder="you@example.com" autocomplete="email" class="inp" />
                            </div>
                        </div>

                        <div class="field" :class="{ 'field--error': loginForm.errors.has('password') }">
                            <label class="field-label" for="inp-pw">Password</label>
                            <div class="input-shell">
                                <svg class="inp-icon" width="16" height="16" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2">
                                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
                                    <path d="M7 11V7a5 5 0 0 1 10 0v4" />
                                </svg>
                                <input id="inp-pw" :type="showPw ? 'text' : 'password'" v-model="loginForm.password"
                                    name="password" placeholder="Enter your password" autocomplete="current-password"
                                    class="inp" />
                                <button type="button" class="eye-btn" @click="showPw = !showPw" tabindex="-1">
                                    <svg v-if="!showPw" width="15" height="15" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="2">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" />
                                        <circle cx="12" cy="12" r="3" />
                                    </svg>
                                    <svg v-else width="15" height="15" viewBox="0 0 24 24" fill="none"
                                        stroke="currentColor" stroke-width="2">
                                        <path
                                            d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24" />
                                        <line x1="1" y1="1" x2="23" y2="23" />
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <!-- <div class="field-meta">
              <label class="check-label">
                <input type="checkbox" v-model="rememberMe" class="check-native" />
                <span class="check-box"></span>
                <span class="check-text">Remember me</span>
              </label>
              <a href="#" class="link-forgot">Forgot password?</a>
            </div> -->

                        <button type="submit" class="btn-submit" :disabled="loginForm.busy"
                            :class="{ 'btn--loading': loginForm.busy }">
                            <span class="btn-label">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2.2">
                                    <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4" />
                                    <polyline points="10 17 15 12 10 7" />
                                    <line x1="15" y1="12" x2="3" y2="12" />
                                </svg>
                                Sign In
                            </span>
                            <span class="btn-spin" v-if="loginForm.busy"><span class="spinner"></span></span>
                        </button>
                    </form>

                    <!-- <p class="form-footer-text">
            New to WBiG? <a href="#" class="link-register">Create an account</a>
          </p> -->
                </div>
            </div>

        </div>

        <p class="bottom-copy">© 2026 Bir E-Commerce. All rights reserved.</p>
    </div>
</template>

<script>
export default {
    auth: 'guest',
    data() {
        return {
            showPw: false,
            rememberMe: false,
            loginForm: this.$vform({ email: '', password: '' }),
        }
    },
    methods: {
        async userLogin() {
            try {
                const { data } = await this.loginForm.post('/auth/login');
                await this.$auth.setUserToken(data.access_token);
                this.loginForm.reset();
            } catch (err) { console.log(err); }
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

*,
*::before,
*::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0
}

.login-root {
    font-family: 'Plus Jakarta Sans', sans-serif;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #FFFBEA;
    position: relative;
    overflow: hidden;
    padding: 1.5rem 1rem;
    gap: 1.25rem;
}

/* Background */
.bg-layer {
    position: absolute;
    inset: 0;
    pointer-events: none;
    z-index: 0
}

.bg-circle {
    position: absolute;
    border-radius: 50%
}

.bc-1 {
    width: 600px;
    height: 600px;
    background: radial-gradient(circle, rgba(245, 184, 0, 0.22) 0%, transparent 70%);
    top: -180px;
    left: -150px;
    animation: pulse 8s ease-in-out infinite alternate
}

.bc-2 {
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(204, 28, 28, 0.10) 0%, transparent 70%);
    bottom: -100px;
    right: -80px;
    animation: pulse 10s ease-in-out infinite alternate-reverse
}

.bc-3 {
    width: 300px;
    height: 300px;
    background: radial-gradient(circle, rgba(245, 184, 0, 0.15) 0%, transparent 70%);
    top: 50%;
    right: 15%;
    animation: pulse 12s ease-in-out infinite alternate
}

@keyframes pulse {
    from {
        transform: scale(1);
        opacity: .7
    }

    to {
        transform: scale(1.12);
        opacity: 1
    }
}

.bg-grid {
    position: absolute;
    inset: 0;
    background-image: radial-gradient(circle, rgba(26, 26, 26, 0.10) 1px, transparent 1px);
    background-size: 28px 28px;
    opacity: .65
}

/* Card */
.login-card {
    position: relative;
    z-index: 1;
    display: flex;
    width: 100%;
    max-width: 960px;
    min-height: 555px;
    border-radius: 28px;
    overflow: hidden;
    box-shadow: 0 2px 0 0 #E8A800, 0 0 0 1.5px #FFE470, 0 20px 60px rgba(245, 184, 0, 0.15), 0 8px 24px rgba(26, 26, 26, 0.10);
    animation: cardIn .65s cubic-bezier(.22, 1, .36, 1) both;
}

@keyframes cardIn {
    from {
        opacity: 0;
        transform: translateY(30px) scale(.97)
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1)
    }
}

/* Brand Panel */
.brand-panel {
    flex: 0 0 44%;
    position: relative;
    display: flex;
    align-items: stretch;
    background: #1A1A1A;
    overflow: hidden;
}

.brand-panel::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    width: 6px;
    height: 100%;
    background: linear-gradient(to bottom, #F5B800, #CC1C1C)
}

.brand-panel::after {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(ellipse 80% 60% at 10% 0%, rgba(245, 184, 0, 0.18) 0%, transparent 60%), radial-gradient(ellipse 60% 60% at 90% 100%, rgba(204, 28, 28, 0.14) 0%, transparent 60%);
    pointer-events: none
}

.brand-inner {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 2.8rem 2.6rem;
    width: 100%
}

.brand-logo {
    height: 52px;
    width: auto;
    object-fit: contain;
    filter: drop-shadow(0 2px 8px rgba(245, 184, 0, 0.25));
    animation: fadeUp .7s .2s cubic-bezier(.22, 1, .36, 1) both
}

.brand-tagline {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 2rem 0
}

.brand-headline {
    font-size: 2.6rem;
    font-weight: 800;
    line-height: 1.1;
    color: #fff;
    letter-spacing: -.03em;
    margin-bottom: 1rem;
    animation: fadeUp .7s .3s cubic-bezier(.22, 1, .36, 1) both
}

.hl-gold {
    color: #F5B800
}

.brand-desc {
    font-size: .85rem;
    line-height: 1.75;
    color: rgba(255, 255, 255, 0.42);
    max-width: 240px;
    animation: fadeUp .7s .4s cubic-bezier(.22, 1, .36, 1) both
}

.brand-stats {
    display: flex;
    align-items: center;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 14px;
    padding: 1rem 1.2rem;
    animation: fadeUp .7s .5s cubic-bezier(.22, 1, .36, 1) both
}

.stat-item {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 3px
}

.stat-num {
    font-size: 1.15rem;
    font-weight: 800;
    color: #F5B800;
    letter-spacing: -.02em
}

.stat-lbl {
    font-size: .66rem;
    color: rgba(255, 255, 255, 0.38);
    font-weight: 500;
    letter-spacing: .05em;
    text-transform: uppercase
}

.stat-divider {
    width: 1px;
    height: 32px;
    background: rgba(255, 255, 255, 0.1);
    margin: 0 .5rem
}

/* Form Panel */
.form-panel {
    flex: 1;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2.5rem 2.8rem
}

.form-inner {
    width: 100%;
    max-width: 360px;
    animation: fadeUp .7s .1s cubic-bezier(.22, 1, .36, 1) both
}

.form-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: #FFF3C0;
    color: #C98D00;
    font-size: .68rem;
    font-weight: 700;
    letter-spacing: .08em;
    text-transform: uppercase;
    padding: 5px 12px;
    border-radius: 100px;
    border: 1px solid #FFE470;
    margin-bottom: 1rem
}

.form-title {
    font-size: 1.85rem;
    font-weight: 800;
    color: #1A1A1A;
    letter-spacing: -.03em;
    line-height: 1.15;
    margin-bottom: .35rem
}

.form-sub {
    font-size: .85rem;
    color: rgba(26, 26, 26, 0.55);
    margin-bottom: 1.75rem
}

.alert-box {
    display: flex;
    align-items: center;
    gap: 8px;
    background: #FFF1F1;
    border: 1px solid rgba(204, 28, 28, 0.25);
    border-radius: 10px;
    padding: .7rem 1rem;
    color: #CC1C1C;
    font-size: .82rem;
    font-weight: 500;
    margin-bottom: 1.25rem
}

.alert-fade-enter-active {
    transition: all .3s ease
}

.alert-fade-leave-active {
    transition: all .2s ease
}

.alert-fade-enter-from,
.alert-fade-leave-to {
    opacity: 0;
    transform: translateY(-6px)
}

.login-form {
    display: flex;
    flex-direction: column;
    gap: 1rem
}

.field {
    display: flex;
    flex-direction: column;
    gap: .4rem
}

.field-label {
    font-size: .78rem;
    font-weight: 600;
    color: #1A1A1A;
    letter-spacing: .01em
}

.input-shell {
    position: relative;
    display: flex;
    align-items: center
}

.inp-icon {
    position: absolute;
    left: 14px;
    color: rgba(26, 26, 26, 0.30);
    pointer-events: none;
    transition: color .2s;
    z-index: 1
}

.inp {
    width: 100%;
    height: 48px;
    padding: 0 44px 0 44px;
    background: #FFFBEA;
    border: 1.5px solid #FFE470;
    border-radius: 12px;
    color: #1A1A1A;
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: .875rem;
    outline: none;
    transition: border-color .2s, background .2s, box-shadow .2s;
    caret-color: #E8A800
}

.inp::placeholder {
    color: rgba(26, 26, 26, 0.30)
}

.inp:hover {
    border-color: #F5B800;
    background: #FFF3C0
}

.inp:focus {
    border-color: #E8A800;
    background: #fff;
    box-shadow: 0 0 0 3.5px rgba(245, 184, 0, 0.18)
}

.input-shell:focus-within .inp-icon {
    color: #C98D00
}

.field--error .inp {
    border-color: #CC1C1C;
    background: #FFF5F5
}

.field--error .inp:focus {
    box-shadow: 0 0 0 3.5px rgba(204, 28, 28, 0.12)
}

.eye-btn {
    position: absolute;
    right: 12px;
    background: none;
    border: none;
    cursor: pointer;
    color: rgba(26, 26, 26, 0.30);
    display: flex;
    align-items: center;
    padding: 5px;
    border-radius: 6px;
    transition: color .2s, background .2s
}

.eye-btn:hover {
    color: #C98D00;
    background: #FFF3C0
}

.field-meta {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: .1rem
}

.check-label {
    display: flex;
    align-items: center;
    gap: 8px;
    cursor: pointer
}

.check-native {
    display: none
}

.check-box {
    width: 17px;
    height: 17px;
    border: 1.5px solid #F5B800;
    border-radius: 5px;
    background: #FFFBEA;
    flex-shrink: 0;
    position: relative;
    transition: background .2s, border-color .2s
}

.check-native:checked+.check-box {
    background: #F5B800;
    border-color: #E8A800
}

.check-native:checked+.check-box::after {
    content: '';
    position: absolute;
    left: 3px;
    top: 1px;
    width: 9px;
    height: 5px;
    border-left: 2px solid #1A1A1A;
    border-bottom: 2px solid #1A1A1A;
    transform: rotate(-45deg)
}

.check-text {
    font-size: .8rem;
    color: rgba(26, 26, 26, 0.55);
    font-weight: 500
}

.link-forgot {
    font-size: .8rem;
    color: #CC1C1C;
    text-decoration: none;
    font-weight: 600;
    transition: color .2s
}

.link-forgot:hover {
    color: #B01818;
    text-decoration: underline
}

/* Submit */
.btn-submit {
    position: relative;
    width: 100%;
    height: 50px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #F5B800 0%, #E8A800 50%, #D49700 100%);
    background-size: 200% 200%;
    color: #1A1A1A;
    font-family: 'Plus Jakarta Sans', sans-serif;
    font-size: .9rem;
    font-weight: 700;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: .5rem;
    overflow: hidden;
    letter-spacing: .01em;
    box-shadow: 0 2px 0 0 #C98D00, 0 6px 20px rgba(245, 184, 0, 0.40);
    transition: transform .18s, box-shadow .25s;
    animation: bgShimmer 3s ease infinite alternate;
}

@keyframes bgShimmer {
    from {
        background-position: 0% 50%
    }

    to {
        background-position: 100% 50%
    }
}

.btn-submit::before {
    content: '';
    position: absolute;
    top: 0;
    left: -60%;
    width: 40%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.35), transparent);
    transform: skewX(-20deg);
    animation: shimmer 2.8s ease-in-out infinite;
}

@keyframes shimmer {
    0% {
        left: -60%
    }

    100% {
        left: 130%
    }
}

.btn-submit:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 4px 0 0 #C98D00, 0 10px 28px rgba(245, 184, 0, 0.50)
}

.btn-submit:active:not(:disabled) {
    transform: translateY(1px);
    box-shadow: 0 1px 0 0 #C98D00, 0 4px 12px rgba(245, 184, 0, 0.25)
}

.btn-submit:disabled {
    opacity: .65;
    cursor: not-allowed;
    transform: none
}

.btn-label {
    display: flex;
    align-items: center;
    gap: 8px;
    transition: opacity .2s;
    position: relative;
    z-index: 1
}

.btn--loading .btn-label {
    opacity: 0
}

.btn-spin {
    position: absolute;
    display: flex;
    align-items: center;
    justify-content: center
}

.spinner {
    width: 20px;
    height: 20px;
    border: 2.5px solid rgba(26, 26, 26, 0.25);
    border-top-color: #1A1A1A;
    border-radius: 50%;
    animation: spin .65s linear infinite
}

@keyframes spin {
    to {
        transform: rotate(360deg)
    }
}

.form-footer-text {
    text-align: center;
    font-size: .82rem;
    color: rgba(26, 26, 26, 0.35);
    margin-top: 1.4rem
}

.link-register {
    color: #CC1C1C;
    text-decoration: none;
    font-weight: 700;
    transition: color .2s
}

.link-register:hover {
    color: #B01818;
    text-decoration: underline
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(20px)
    }

    to {
        opacity: 1;
        transform: translateY(0)
    }
}

.bottom-copy {
    position: relative;
    z-index: 1;
    font-size: .72rem;
    color: rgba(26, 26, 26, 0.30);
    letter-spacing: .02em
}

@media(max-width:700px) {
    .brand-panel {
        display: none
    }

    .login-card {
        border-radius: 20px
    }

    .form-panel {
        padding: 2rem 1.5rem
    }
}
</style>