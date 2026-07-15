<template>
    <div class="page-wrapper" v-if="$auth.loggedIn">
        <div class="page-content">

            <div class="welcome-banner">
                <div class="welcome-text">
                    <h4 class="welcome-title text-white">Dashboard Overview</h4>
                    <p class="welcome-sub">Here's what's happening with your store today</p>
                </div>
                <div class="welcome-date">
                    <i class="bx bx-calendar"></i>
                    <span>{{ todayFormatted }}</span>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-6 col-lg-3" v-for="(stat, idx) in statCards" :key="idx">
                    <div class="kpi-card" :class="'kpi-' + stat.theme">
                        <div class="kpi-top">
                            <div class="kpi-icon"><i :class="stat.icon"></i></div>
                            <div class="kpi-badge" v-if="stat.badge">{{ stat.badge }}</div>
                        </div>
                        <div class="kpi-value">{{ stat.value }}</div>
                        <div class="kpi-label">{{ stat.label }}</div>
                        <div class="kpi-bar">
                            <div class="kpi-bar-fill" :style="{ width: stat.bar + '%' }"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-xl-8">
                    <div class="panel">
                        <div class="panel-head">
                            <div class="panel-title">
                                <span class="panel-dot"></span>
                                7-Day Order &amp; Revenue Report
                            </div>
                            <div class="pill-group">
                                <button :class="['pill', chartView === 'orders' ? 'pill-active' : '']" @click="switchView('orders')">
                                    <i class="bx bx-bar-chart-alt-2"></i> Orders
                                </button>
                                <button :class="['pill', chartView === 'revenue' ? 'pill-active' : '']" @click="switchView('revenue')">
                                    <i class="bx bx-dollar"></i> Revenue
                                </button>
                                <button :class="['pill', chartView === 'both' ? 'pill-active' : '']" @click="switchView('both')">
                                    <i class="bx bx-layer"></i> Both
                                </button>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div v-if="loading" class="panel-loader">
                                <div class="loader-ring"></div>
                            </div>
                            <div id="chartCylinder" style="width:100%;min-height:390px;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="panel h-100">
                        <div class="panel-head">
                            <div class="panel-title">
                                <span class="panel-dot dot-green"></span>
                                Order Status
                            </div>
                        </div>
                        <div class="panel-body">
                            <div v-if="loading" class="panel-loader"><div class="loader-ring"></div></div>
                            <div id="chartSolidGauge" style="width:100%;min-height:260px;"></div>
                            <div class="status-legend" v-if="!loading && statusData.length">
                                <div class="legend-item" v-for="(s, i) in statusData" :key="i">
                                    <span class="legend-dot" :style="{ background: statusColors[i % statusColors.length] }"></span>
                                    <span class="legend-name">{{ s.name }}</span>
                                    <span class="legend-count">{{ s.count }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-lg-4">
                    <div class="panel h-100">
                        <div class="panel-head">
                            <div class="panel-title">
                                <span class="panel-dot dot-purple"></span>
                                Daily Trend
                            </div>
                        </div>
                        <div class="panel-body">
                            <div id="chartSpline" style="width:100%;min-height:290px;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="panel h-100">
                        <div class="panel-head">
                            <div class="panel-title">
                                <span class="panel-dot dot-orange"></span>
                                Day-by-Day Breakdown
                            </div>
                        </div>
                        <div class="panel-body table-scroll">
                            <div v-if="loading" class="panel-loader"><div class="loader-ring"></div></div>
                            <table class="data-table" v-else>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Day</th>
                                        <th>Date</th>
                                        <th class="text-end">Orders</th>
                                        <th class="text-end">Revenue (TK)</th>
                                        <th class="text-center">Activity</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(d, i) in dailyData" :key="i">
                                        <td class="cell-num">{{ i + 1 }}</td>
                                        <td class="cell-day">{{ d.dayName }}</td>
                                        <td class="cell-date">{{ formatDate(d.date) }}</td>
                                        <td class="text-end cell-orders">{{ d.orders }}</td>
                                        <td class="text-end cell-rev">{{ d.revenue.toLocaleString() }}</td>
                                        <td class="text-center">
                                            <div class="mini-bar-wrap">
                                                <div class="mini-bar" :style="{ width: getBarWidth(d.orders) + '%' }"></div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <button class="action-btn" @click="openDayHistory(i)" :disabled="!d.items.length" :title="d.items.length ? 'View order history' : 'No orders'">
                                                <i class="bx bx-history"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <transition name="modal-fade">
                <div class="modal-overlay" v-if="showHistoryModal" @click.self="showHistoryModal = false">
                    <div class="modal-card">
                        <div class="modal-head">
                            <div class="modal-title">
                                <i class="bx bx-history"></i>
                                <span>Order History — {{ historyDay.dayName }}, {{ formatDate(historyDay.date) }}</span>
                            </div>
                            <button class="modal-close" @click="showHistoryModal = false"><i class="bx bx-x"></i></button>
                        </div>
                        <div class="modal-body">
                            <div class="modal-stats">
                                <div class="modal-stat">
                                    <span class="modal-stat-val">{{ historyDay.items.length }}</span>
                                    <span class="modal-stat-lbl">Orders</span>
                                </div>
                                <div class="modal-stat">
                                    <span class="modal-stat-val">{{ historyDay.revenue.toLocaleString() }} TK</span>
                                    <span class="modal-stat-lbl">Revenue</span>
                                </div>
                                <div class="modal-stat">
                                    <span class="modal-stat-val">{{ historyDay.items.length ? Math.round(historyDay.revenue / historyDay.items.length).toLocaleString() : 0 }} TK</span>
                                    <span class="modal-stat-lbl">Avg Order</span>
                                </div>
                            </div>

                            <div v-if="!historyDay.items.length" class="modal-empty">
                                <i class="bx bx-package"></i>
                                <p>No orders for this day</p>
                            </div>

                            <div class="order-list" v-else>
                                <div class="order-item" v-for="(item, idx) in historyDay.items" :key="idx">
                                    <div class="order-left">
                                        <div class="order-avatar">{{ (item.product_name || 'P').charAt(0).toUpperCase() }}</div>
                                        <div class="order-info">
                                            <div class="order-product">{{ item.product_name }}</div>
                                            <div class="order-meta">
                                                <span class="order-id-tag">#{{ item.orderId }}</span>
                                                <span class="order-seller">{{ item.seller_name }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order-right">
                                        <div class="order-amount">{{ Number(item.total).toLocaleString() }} TK</div>
                                        <span :class="['order-status', statusBadgeClass(item.status_name)]">{{ item.status_name }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </transition>

            <div class="row g-3 mb-4">
                <div class="col-6 col-md-4 col-lg" v-for="(nav, idx) in navCards" :key="idx">
                    <Nuxt-link :to="nav.to" class="nav-link-card" :class="'nav-' + nav.theme">
                        <div class="nav-icon-wrap">
                            <i :class="nav.icon"></i>
                        </div>
                        <div class="nav-info">
                            <div class="nav-title">{{ nav.title }}</div>
                            <div class="nav-desc">{{ nav.desc }}</div>
                        </div>
                        <i class="bx bx-right-arrow-alt nav-arrow"></i>
                    </Nuxt-link>
                </div>
            </div>
            <br/>

            <div class="overlay toggle-icon"></div>
            <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        </div>
    </div>
</template>

<script>
export default {
    head: {
        title: 'Dashboard',
    },
    data() {
        return {
            userData: { role_id: '' },
            todayOrders: 0,
            allproducts: 0,
            rawOrders: [],
            loading: false,
            chartView: 'both',
            weekStats: { totalOrders: 0, totalRevenue: 0, maxOrders: 0 },
            dailyData: [],
            statusData: [],
            statusColors: ['#3d6be4', '#1aad68', '#f59e0b', '#e03b3b', '#7c4dff', '#06b6d4', '#ec4899'],
            showHistoryModal: false,
            historyDay: { dayName: '', date: '', revenue: 0, items: [] },
        };
    },
    mounted() {
        this.loadHighchartsScripts().then(() => {
            this.defaultLoadingData();
            this.todayOrdersData();
            this.fetchWeekOrders();
        });
    },
    computed: {
        loggedIn() { return this.$store.state.auth.loggedIn; },
        user() { return this.$store.state.auth.user; },
        todayFormatted() {
            return new Date().toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });
        },
        statCards() {
            return [
                { icon: 'bx bx-cart', label: 'Today Orders', value: this.todayOrders, theme: 'blue', badge: 'today', bar: this.todayOrders ? Math.min(this.todayOrders * 20, 100) : 5 },
                { icon: 'bx bx-box', label: 'Total Products', value: this.allproducts, theme: 'green', badge: null, bar: this.allproducts ? Math.min(this.allproducts * 5, 100) : 10 },
                { icon: 'bx bx-receipt', label: '7-Day Orders', value: this.weekStats.totalOrders, theme: 'purple', badge: 'week', bar: this.weekStats.maxOrders ? Math.min((this.weekStats.totalOrders / 7) / this.weekStats.maxOrders * 100, 100) : 5 },
                { icon: 'bx bx-dollar-circle', label: '7-Day Revenue', value: this.weekStats.totalRevenue.toLocaleString() + ' TK', theme: 'orange', badge: 'week', bar: 75 },
            ];
        },
        navCards() {
            return [
                { to: '/ecommarce/product-list', icon: 'bx bx-package', title: 'Products', desc: 'Manage inventory', theme: 'blue' },
                { to: '/orders/order-list', icon: 'bx bx-shopping-bag', title: 'Orders', desc: 'View all orders', theme: 'orange' },
                { to: '/orders/order-report', icon: 'bx bx-bar-chart', title: 'Reports', desc: 'Sales analytics', theme: 'green' },
                { to: '/ecommarce/category-list', icon: 'bx bx-category', title: 'Categories', desc: 'Browse types', theme: 'purple' },
                { to: '/brands/brands-list', icon: 'bx bx-badge', title: 'Brands', desc: 'Brand catalog', theme: 'teal' },
            ];
        },
    },
    methods: {
        loadScript(src) {
            return new Promise((resolve, reject) => {
                if (document.querySelector(`script[src="${src}"]`)) { resolve(); return; }
                const s = document.createElement('script');
                s.src = src;
                s.onload = resolve;
                s.onerror = reject;
                document.head.appendChild(s);
            });
        },
        async loadHighchartsScripts() {
            const base = '/plugins/highcharts/js/';
            await this.loadScript(base + 'highcharts.js');
            await this.loadScript(base + 'highcharts-3d.js');
            await this.loadScript(base + 'highcharts-more.js');
            await Promise.all([
                this.loadScript(base + 'solid-gauge.js'),
                this.loadScript(base + 'cylinder.js'),
            ]);
            await this.loadScript(base + 'exporting.js');
            await this.loadScript(base + 'accessibility.js');
        },
        defaultLoadingData() {
            this.$axios.get('/auth/showProfileData').then(r => {
                this.userData.role_id = r.data.data.role_id;
            });
        },
        todayOrdersData() {
            this.$axios.get('/order/checkOrders').then(r => {
                this.todayOrders = r.data.orders;
                this.allproducts = r.data.products;
            });
        },
        getDateString(daysAgo) {
            const d = new Date();
            d.setDate(d.getDate() - daysAgo);
            return d.toISOString().split('T')[0];
        },
        formatDate(dateStr) {
            const d = new Date(dateStr);
            return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
        },
        getBarWidth(orders) {
            return this.weekStats.maxOrders ? Math.min((orders / this.weekStats.maxOrders) * 100, 100) : 0;
        },
        openDayHistory(index) {
            const day = this.dailyData[index];
            this.historyDay = { dayName: day.dayName, date: day.date, revenue: day.revenue, items: day.items };
            this.showHistoryModal = true;
        },
        statusBadgeClass(status) {
            if (!status) return 'badge-default';
            const s = status.toLowerCase();
            if (s.includes('deliver') || s.includes('complet')) return 'badge-success';
            if (s.includes('cancel') || s.includes('reject')) return 'badge-danger';
            if (s.includes('pending') || s.includes('process')) return 'badge-warning';
            return 'badge-default';
        },
        async fetchWeekOrders() {
            this.loading = true;
            try {
                const r = await this.$axios.get('/order/orderFilterReport', {
                    params: { fromDate: this.getDateString(6), toDate: this.getDateString(0), sellerId: '', orderStatus: '' }
                });
                this.rawOrders = r.data.orderdata || [];
                this.processData();
                this.renderCharts();
            } catch (e) {
                console.error(e);
            } finally {
                this.loading = false;
            }
        },
        processData() {
            const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            const dailyMap = {};
            const statusMap = {};

            for (let i = 6; i >= 0; i--) {
                const d = new Date();
                d.setDate(d.getDate() - i);
                const key = d.toISOString().split('T')[0];
                dailyMap[key] = { dayName: dayNames[d.getDay()], date: key, orders: 0, revenue: 0, items: [] };
            }

            this.rawOrders.forEach(o => {
                const od = (o.created_at || '').split('T')[0];
                if (dailyMap[od]) {
                    dailyMap[od].orders += 1;
                    dailyMap[od].revenue += Number(o.total || 0);
                    dailyMap[od].items.push(o);
                }
                const sn = o.status_name || 'Unknown';
                if (!statusMap[sn]) statusMap[sn] = { name: sn, count: 0 };
                statusMap[sn].count += 1;
            });

            this.dailyData = Object.values(dailyMap);
            this.weekStats = this.dailyData.reduce((a, d) => {
                a.totalOrders += d.orders;
                a.totalRevenue += d.revenue;
                if (d.orders > a.maxOrders) a.maxOrders = d.orders;
                return a;
            }, { totalOrders: 0, totalRevenue: 0, maxOrders: 1 });
            this.statusData = Object.values(statusMap).sort((a, b) => b.count - a.count);
        },
        renderCharts() {
            if (typeof Highcharts === 'undefined' || typeof Highcharts.seriesTypes === 'undefined') {
                setTimeout(() => this.renderCharts(), 300);
                return;
            }
            this.renderCylinderChart();
            this.renderGaugeChart();
            this.renderSplineChart();
        },
        switchView(v) {
            this.chartView = v;
            this.renderCylinderChart();
        },
        renderCylinderChart() {
            if (typeof Highcharts === 'undefined' || !Highcharts.seriesTypes.cylinder) {
                setTimeout(() => this.renderCylinderChart(), 300);
                return;
            }
            const cats = this.dailyData.map(d => d.dayName);
            const ordersData = this.dailyData.map(d => d.orders);
            const revenueData = this.dailyData.map(d => d.revenue);

            const series = [];
            if (this.chartView === 'orders' || this.chartView === 'both') {
                series.push({ name: 'Orders', data: ordersData, color: '#3d6be4' });
            }
            if (this.chartView === 'revenue' || this.chartView === 'both') {
                series.push({ name: 'Revenue (TK)', data: revenueData, color: '#1aad68', yAxis: 1 });
            }

            Highcharts.chart('chartCylinder', {
                chart: {
                    type: 'cylinder',
                    options3d: { enabled: true, alpha: 18, beta: 0, depth: 60, viewDistance: 25 },
                    backgroundColor: 'transparent',
                    style: { fontFamily: "'Google Sans', sans-serif" },
                    spacing: [10, 10, 10, 10],
                    animation: { duration: 900 }
                },
                title: { text: null },
                credits: { enabled: false },
                exporting: { enabled: false },
                xAxis: {
                    categories: cats,
                    labels: { style: { fontSize: '11px', color: '#64748b', fontWeight: '500' } },
                    lineColor: '#e2e8f0',
                    tickColor: '#e2e8f0',
                    gridLineWidth: 0
                },
                yAxis: [
                    {
                        title: { text: this.chartView === 'revenue' ? null : 'Orders', style: { color: '#3d6be4', fontSize: '11px', fontWeight: '600' } },
                        labels: { style: { color: '#94a3b8', fontSize: '10px' }, formatter: function() { return this.value >= 1000 ? (this.value/1000).toFixed(0)+'K' : this.value; } },
                        gridLineColor: '#f1f5f9',
                        allowDecimals: false
                    },
                    {
                        title: { text: this.chartView === 'orders' ? null : 'Revenue (TK)', style: { color: '#1aad68', fontSize: '11px', fontWeight: '600' } },
                        labels: { style: { color: '#94a3b8', fontSize: '10px' }, formatter: function() { return this.value >= 1000 ? (this.value/1000).toFixed(0)+'K' : this.value; } },
                        opposite: true,
                        gridLineWidth: 0
                    }
                ],
                legend: {
                    enabled: this.chartView === 'both',
                    align: 'center', verticalAlign: 'bottom',
                    itemStyle: { fontSize: '11px', fontWeight: '500', color: '#64748b' }
                },
                tooltip: {
                    shared: true, useHTML: true,
                    backgroundColor: 'rgba(15,23,42,0.92)',
                    borderColor: 'transparent',
                    borderRadius: 10,
                    shadow: false,
                    style: { color: '#fff', fontSize: '12px' },
                    headerFormat: '<div style="font-weight:700;margin-bottom:6px;color:#e2e8f0">{point.key}</div>',
                    pointFormatter: function() {
                        if (this.series.name === 'Revenue (TK)')
                            return '<div style="color:#4ade80">● Revenue: <b>' + Number(this.y).toLocaleString() + ' TK</b></div>';
                        return '<div style="color:#60a5fa">● Orders: <b>' + this.y + '</b></div>';
                    }
                },
                plotOptions: {
                    cylinder: {
                        depth: 45,
                        borderWidth: 0,
                        borderRadius: 4,
                        groupPadding: 0.12,
                        pointPadding: 0.04
                    }
                },
                series: series
            });
        },
        renderGaugeChart() {
            if (typeof Highcharts === 'undefined' || !Highcharts.seriesTypes.solidgauge) {
                setTimeout(() => this.renderGaugeChart(), 300);
                return;
            }
            if (!this.statusData.length) {
                document.getElementById('chartSolidGauge').innerHTML = '<div class="empty-state">No status data</div>';
                return;
            }

            const gaugeData = this.statusData.slice(0, 4).map((s, i) => ({
                name: s.name,
                y: s.count,
                color: this.statusColors[i]
            }));

            Highcharts.chart('chartSolidGauge', {
                chart: {
                    type: 'solidgauge',
                    backgroundColor: 'transparent',
                    style: { fontFamily: "'Google Sans', sans-serif" },
                    margin: [0, 0, 0, 0],
                    spacing: [0, 0, 0, 0]
                },
                title: { text: null },
                credits: { enabled: false },
                exporting: { enabled: false },
                pane: {
                    center: ['50%', '60%'],
                    size: '85%',
                    startAngle: -90,
                    endAngle: 90,
                    background: { backgroundColor: '#f1f5f9', innerRadius: '60%', outerRadius: '100%', shape: 'arc', borderWidth: 0 }
                },
                tooltip: { enabled: false },
                yAxis: {
                    min: 0,
                    max: Math.max(...this.statusData.map(s => s.count), 1),
                    lineWidth: 0,
                    tickWidth: 0,
                    minorTickInterval: null,
                    tickAmount: 0,
                    labels: { enabled: false }
                },
                plotOptions: {
                    solidgauge: {
                        innerRadius: '60%',
                        dataLabels: {
                            y: -25,
                            borderWidth: 0,
                            useHTML: true,
                            format: '<div style="text-align:center"><span style="font-size:1.6rem;font-weight:700;color:{point.color}">{point.y}</span><br/><span style="font-size:0.7rem;color:#94a3b8;font-weight:500">{point.name}</span></div>'
                        }
                    }
                },
                series: [{ name: this.statusData[0].name, data: gaugeData, dataLabels: { enabled: true, y: -25, borderWidth: 0, useHTML: true, format: '<div style="text-align:center"><span style="font-size:1.4rem;font-weight:700;color:{point.color}">{point.y}</span><br/><span style="font-size:0.68rem;color:#94a3b8">{point.name}</span></div>' } }]
            });
        },
        renderSplineChart() {
            const cats = this.dailyData.map(d => d.dayName);
            const revData = this.dailyData.map(d => d.revenue);
            const ordData = this.dailyData.map(d => d.orders);

            Highcharts.chart('chartSpline', {
                chart: {
                    type: 'spline',
                    backgroundColor: 'transparent',
                    style: { fontFamily: "'Google Sans', sans-serif" },
                    spacing: [10, 10, 10, 10],
                    animation: { duration: 900 }
                },
                title: { text: null },
                credits: { enabled: false },
                exporting: { enabled: false },
                xAxis: {
                    categories: cats,
                    labels: { style: { fontSize: '11px', color: '#64748b' } },
                    lineColor: '#e2e8f0',
                    tickColor: '#e2e8f0',
                    gridLineWidth: 0
                },
                yAxis: [
                    {
                        title: { text: null },
                        labels: { style: { color: '#94a3b8', fontSize: '10px' }, formatter: function() { return this.value >= 1000 ? (this.value/1000).toFixed(0)+'K' : this.value; } },
                        gridLineColor: '#f1f5f9'
                    },
                    {
                        title: { text: null },
                        labels: { style: { color: '#94a3b8', fontSize: '10px' } },
                        opposite: true,
                        gridLineWidth: 0
                    }
                ],
                legend: { enabled: true, align: 'center', verticalAlign: 'bottom', itemStyle: { fontSize: '11px', fontWeight: '500', color: '#64748b' } },
                tooltip: {
                    shared: true, useHTML: true,
                    backgroundColor: 'rgba(15,23,42,0.92)',
                    borderColor: 'transparent',
                    borderRadius: 10,
                    shadow: false,
                    style: { color: '#fff', fontSize: '12px' },
                    headerFormat: '<div style="font-weight:700;margin-bottom:6px;color:#e2e8f0">{point.key}</div>',
                    pointFormatter: function() {
                        if (this.series.name === 'Revenue')
                            return '<div style="color:#4ade80">● Revenue: <b>' + Number(this.y).toLocaleString() + ' TK</b></div>';
                        return '<div style="color:#60a5fa">● Orders: <b>' + this.y + '</b></div>';
                    }
                },
                plotOptions: {
                    spline: {
                        lineWidth: 3,
                        marker: { radius: 5, lineWidth: 2, lineColor: '#fff', symbol: 'circle' },
                        states: { hover: { lineWidth: 4 } }
                    }
                },
                series: [
                    {
                        name: 'Revenue',
                        data: revData,
                        color: '#3d6be4',
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [[0, 'rgba(61,107,228,0.18)'], [1, 'rgba(61,107,228,0.01)']]
                        },
                        areaspline: true
                    },
                    {
                        name: 'Orders',
                        data: ordData,
                        color: '#1aad68',
                        yAxis: 1,
                        fillColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [[0, 'rgba(26,173,104,0.15)'], [1, 'rgba(26,173,104,0.01)']]
                        },
                        areaspline: true
                    }
                ]
            });
        }
    }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

* { font-family: 'Inter', sans-serif; }

/* ── Welcome Banner ── */
.welcome-banner {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
    border-radius: 16px;
    padding: 22px 28px;
    margin-bottom: 20px;
    color: #fff;
}
.welcome-title {
    font-size: 1.2rem;
    font-weight: 800;
    margin: 0 0 4px 0;
    letter-spacing: -0.02em;
}
.welcome-sub {
    font-size: 0.78rem;
    color: #94a3b8;
    margin: 0;
}
.welcome-date {
    display: flex;
    align-items: center;
    gap: 8px;
    background: rgba(255,255,255,0.08);
    padding: 8px 16px;
    border-radius: 10px;
    font-size: 0.78rem;
    font-weight: 500;
    color: #cbd5e1;
}
.welcome-date i { font-size: 1rem; color: #60a5fa; }

/* ── KPI Cards ── */
.kpi-card {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 16px;
    padding: 20px;
    position: relative;
    overflow: hidden;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.kpi-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 32px rgba(15,23,42,0.08);
}
.kpi-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 3px;
    border-radius: 16px 16px 0 0;
}
.kpi-blue::before { background: linear-gradient(90deg, #3d6be4, #60a5fa); }
.kpi-green::before { background: linear-gradient(90deg, #1aad68, #4ade80); }
.kpi-purple::before { background: linear-gradient(90deg, #7c4dff, #a78bfa); }
.kpi-orange::before { background: linear-gradient(90deg, #f59e0b, #fb923c); }

.kpi-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 14px; }
.kpi-icon {
    width: 44px; height: 44px;
    border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
    font-size: 1.3rem;
}
.kpi-blue .kpi-icon   { background: #eff6ff; color: #3d6be4; }
.kpi-green .kpi-icon  { background: #f0fdf4; color: #1aad68; }
.kpi-purple .kpi-icon { background: #f5f3ff; color: #7c4dff; }
.kpi-orange .kpi-icon { background: #fffbeb; color: #f59e0b; }

.kpi-badge {
    font-size: 0.62rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 3px 8px;
    border-radius: 6px;
    background: #f1f5f9;
    color: #64748b;
}
.kpi-value {
    font-size: 1.5rem;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.2;
    letter-spacing: -0.02em;
}
.kpi-label {
    font-size: 0.72rem;
    font-weight: 500;
    color: #94a3b8;
    margin-top: 2px;
}
.kpi-bar {
    height: 4px;
    background: #f1f5f9;
    border-radius: 4px;
    margin-top: 14px;
    overflow: hidden;
}
.kpi-bar-fill {
    height: 100%;
    border-radius: 4px;
    transition: width 1s ease;
}
.kpi-blue .kpi-bar-fill   { background: linear-gradient(90deg, #3d6be4, #60a5fa); }
.kpi-green .kpi-bar-fill  { background: linear-gradient(90deg, #1aad68, #4ade80); }
.kpi-purple .kpi-bar-fill { background: linear-gradient(90deg, #7c4dff, #a78bfa); }
.kpi-orange .kpi-bar-fill { background: linear-gradient(90deg, #f59e0b, #fb923c); }

/* ── Panel / Chart Cards ── */
.panel {
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 16px;
    overflow: hidden;
}
.panel-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 10px;
    padding: 16px 22px;
    background: #f8fafc;
    border-bottom: 1px solid #e2e8f0;
}
.panel-title {
    font-size: 0.85rem;
    font-weight: 700;
    color: #0f172a;
    display: flex;
    align-items: center;
    gap: 10px;
}
.panel-dot {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: #3d6be4;
    flex-shrink: 0;
}
.panel-dot.dot-green  { background: #1aad68; }
.panel-dot.dot-purple { background: #7c4dff; }
.panel-dot.dot-orange { background: #f59e0b; }

.panel-body {
    padding: 18px;
    position: relative;
}

/* ── Pill Toggle ── */
.pill-group { display: flex; gap: 4px; background: #e2e8f0; border-radius: 8px; padding: 3px; }
.pill {
    border: none;
    background: transparent;
    font-size: 0.7rem;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    color: #64748b;
    padding: 5px 12px;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.15s;
    display: flex;
    align-items: center;
    gap: 4px;
}
.pill i { font-size: 0.85rem; }
.pill:hover { color: #334155; }
.pill-active {
    background: #fff;
    color: #3d6be4;
    box-shadow: 0 1px 4px rgba(0,0,0,0.08);
}

/* ── Loader ── */
.panel-loader {
    position: absolute; inset: 0;
    display: flex; align-items: center; justify-content: center;
    background: rgba(255,255,255,0.88);
    z-index: 5;
}
.loader-ring {
    width: 34px; height: 34px;
    border: 3px solid #e2e8f0;
    border-top-color: #3d6be4;
    border-radius: 50%;
    animation: spin 0.7s linear infinite;
}
@keyframes spin { to { transform: rotate(360deg); } }

.empty-state {
    display: flex; align-items: center; justify-content: center;
    min-height: 200px; color: #94a3b8; font-size: 0.85rem;
}

/* ── Status Legend ── */
.status-legend {
    padding: 14px 0 0;
    display: flex;
    flex-direction: column;
    gap: 8px;
}
.legend-item {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 0.78rem;
}
.legend-dot {
    width: 10px; height: 10px;
    border-radius: 3px;
    flex-shrink: 0;
}
.legend-name { color: #475569; font-weight: 500; flex: 1; }
.legend-count { font-weight: 700; color: #0f172a; }

/* ── Data Table ── */
.table-scroll { overflow-x: auto; }
.data-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 0.8rem;
}
.data-table thead th {
    background: #f8fafc;
    color: #64748b;
    font-size: 0.68rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    padding: 10px 14px;
    border-bottom: 2px solid #e2e8f0;
    white-space: nowrap;
}
.data-table tbody td {
    padding: 11px 14px;
    color: #334155;
    border-bottom: 1px solid #f1f5f9;
}
.data-table tbody tr { transition: background 0.1s; }
.data-table tbody tr:hover { background: #f8fafc; }

.cell-num { color: #cbd5e1; font-weight: 600; font-size: 0.72rem; }
.cell-day { font-weight: 700; color: #0f172a; }
.cell-date { color: #94a3b8; font-size: 0.75rem; }
.cell-orders { font-weight: 700; color: #3d6be4; }
.cell-rev { font-weight: 700; color: #0f172a; }

.mini-bar-wrap {
    width: 72px; height: 6px;
    background: #f1f5f9;
    border-radius: 6px;
    overflow: hidden;
    margin: 0 auto;
}
.mini-bar {
    height: 100%;
    background: linear-gradient(90deg, #3d6be4, #60a5fa);
    border-radius: 6px;
    transition: width 0.6s ease;
}

.text-end { text-align: right !important; }
.text-center { text-align: center !important; }

/* ── Action Button ── */
.action-btn {
    width: 34px; height: 34px;
    border: 1.5px solid #e2e8f0;
    background: #fff;
    border-radius: 8px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    color: #3d6be4;
    font-size: 1.1rem;
    transition: all 0.15s;
}
.action-btn:hover:not(:disabled) {
    background: #eff6ff;
    border-color: #3d6be4;
    transform: scale(1.08);
}
.action-btn:disabled {
    opacity: 0.35;
    cursor: not-allowed;
    color: #94a3b8;
}

/* ── Modal ── */
.modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(15, 23, 42, 0.55);
    backdrop-filter: blur(4px);
    z-index: 9999;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
}
.modal-card {
    background: #fff;
    border-radius: 18px;
    width: 100%;
    max-width: 600px;
    max-height: 85vh;
    display: flex;
    flex-direction: column;
    box-shadow: 0 24px 64px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}
.modal-head {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 18px 22px;
    background: #0f172a;
    color: #fff;
    flex-shrink: 0;
}
.modal-title {
    font-size: 0.88rem;
    font-weight: 700;
    display: flex;
    align-items: center;
    gap: 10px;
}
.modal-title i { font-size: 1.2rem; color: #60a5fa; }
.modal-close {
    width: 32px; height: 32px;
    border: none;
    background: rgba(255, 255, 255, 0.1);
    color: #fff;
    border-radius: 8px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    transition: background 0.15s;
}
.modal-close:hover { background: rgba(255, 255, 255, 0.2); }

.modal-body {
    padding: 20px 22px;
    overflow-y: auto;
    flex: 1;
}

.modal-stats {
    display: flex;
    gap: 12px;
    margin-bottom: 18px;
}
.modal-stat {
    flex: 1;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    padding: 12px;
    text-align: center;
}
.modal-stat-val {
    display: block;
    font-size: 1.05rem;
    font-weight: 800;
    color: #0f172a;
    letter-spacing: -0.01em;
}
.modal-stat-lbl {
    display: block;
    font-size: 0.65rem;
    font-weight: 600;
    color: #94a3b8;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    margin-top: 2px;
}

.modal-empty {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 40px 0;
    color: #cbd5e1;
}
.modal-empty i { font-size: 2.4rem; margin-bottom: 8px; }
.modal-empty p { font-size: 0.85rem; margin: 0; }

/* ── Order List in Modal ── */
.order-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
}
.order-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    padding: 12px 14px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    transition: border-color 0.15s, background 0.15s;
}
.order-item:hover {
    border-color: #cbd5e1;
    background: #fff;
}
.order-left {
    display: flex;
    align-items: center;
    gap: 12px;
    min-width: 0;
    flex: 1;
}
.order-avatar {
    width: 36px; height: 36px;
    border-radius: 9px;
    background: linear-gradient(135deg, #3d6be4, #60a5fa);
    color: #fff;
    font-size: 0.8rem;
    font-weight: 700;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
}
.order-info { min-width: 0; }
.order-product {
    font-size: 0.8rem;
    font-weight: 600;
    color: #0f172a;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.order-meta {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-top: 3px;
}
.order-id-tag {
    font-size: 0.65rem;
    font-weight: 600;
    color: #3d6be4;
    background: #eff6ff;
    padding: 1px 6px;
    border-radius: 4px;
}
.order-seller {
    font-size: 0.68rem;
    color: #94a3b8;
}
.order-right {
    text-align: right;
    flex-shrink: 0;
}
.order-amount {
    font-size: 0.82rem;
    font-weight: 700;
    color: #0f172a;
}
.order-status {
    display: inline-block;
    font-size: 0.6rem;
    font-weight: 600;
    padding: 2px 8px;
    border-radius: 5px;
    margin-top: 3px;
    text-transform: capitalize;
}
.badge-success { background: #dcfce7; color: #15803d; }
.badge-danger  { background: #fee2e2; color: #dc2626; }
.badge-warning { background: #fef3c7; color: #d97706; }
.badge-default { background: #eff6ff; color: #3d6be4; }

/* ── Modal Transition ── */
.modal-fade-enter-active, .modal-fade-leave-active { transition: opacity 0.2s ease; }
.modal-fade-enter, .modal-fade-leave-to { opacity: 0; }

/* ── Navigation Cards ── */
.nav-link-card {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 18px 20px;
    background: #fff;
    border: 1px solid #e2e8f0;
    border-radius: 14px;
    text-decoration: none;
    color: inherit;
    transition: all 0.2s ease;
    position: relative;
    overflow: hidden;
}
.nav-link-card::before {
    content: '';
    position: absolute;
    left: 0; top: 0;
    width: 3px; height: 100%;
    border-radius: 0 3px 3px 0;
}
.nav-blue::before   { background: #3d6be4; }
.nav-orange::before { background: #f59e0b; }
.nav-green::before  { background: #1aad68; }
.nav-purple::before { background: #7c4dff; }
.nav-teal::before   { background: #06b6d4; }

.nav-link-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 24px rgba(15,23,42,0.07);
    border-color: transparent;
}

.nav-icon-wrap {
    width: 42px; height: 42px;
    border-radius: 11px;
    display: flex; align-items: center; justify-content: center;
    font-size: 1.2rem;
    flex-shrink: 0;
}
.nav-blue .nav-icon-wrap   { background: #eff6ff; color: #3d6be4; }
.nav-orange .nav-icon-wrap { background: #fffbeb; color: #f59e0b; }
.nav-green .nav-icon-wrap  { background: #f0fdf4; color: #1aad68; }
.nav-purple .nav-icon-wrap { background: #f5f3ff; color: #7c4dff; }
.nav-teal .nav-icon-wrap   { background: #ecfeff; color: #06b6d4; }

.nav-info { flex: 1; min-width: 0; }
.nav-title {
    font-size: 0.82rem;
    font-weight: 700;
    color: #0f172a;
}
.nav-desc {
    font-size: 0.68rem;
    color: #94a3b8;
    font-weight: 500;
    margin-top: 1px;
}
.nav-arrow {
    font-size: 1.1rem;
    color: #cbd5e1;
    transition: transform 0.2s, color 0.2s;
}
.nav-link-card:hover .nav-arrow {
    transform: translateX(3px);
    color: #64748b;
}

/* ── Responsive ── */
@media (max-width: 1199px) {
    .panel-head { flex-direction: column; align-items: flex-start; }
    .pill-group { width: 100%; }
    .pill { flex: 1; justify-content: center; }
}
@media (max-width: 767px) {
    .welcome-banner { padding: 16px 18px; flex-direction: column; align-items: flex-start; }
    .welcome-title { font-size: 1rem; }
    .kpi-card { padding: 16px; }
    .kpi-value { font-size: 1.25rem; }
    .kpi-icon { width: 38px; height: 38px; font-size: 1.1rem; }
    .panel-body { padding: 12px; }
    .nav-link-card { padding: 14px 16px; gap: 10px; }
    .nav-icon-wrap { width: 36px; height: 36px; font-size: 1rem; }
    .nav-title { font-size: 0.78rem; }
    .nav-desc { font-size: 0.65rem; }
}
@media (max-width: 575px) {
    .kpi-value { font-size: 1.1rem; }
    .kpi-bar { margin-top: 10px; }
    .panel-head { padding: 12px 14px; }
    .panel-title { font-size: 0.78rem; }
    .pill { font-size: 0.65rem; padding: 4px 8px; }
    .data-table { font-size: 0.72rem; }
    .data-table thead th, .data-table tbody td { padding: 8px 10px; }
    .mini-bar-wrap { width: 50px; }
    .status-legend { flex-direction: row; flex-wrap: wrap; gap: 12px; }
    .modal-card { max-height: 90vh; border-radius: 14px; }
    .modal-head { padding: 14px 16px; }
    .modal-title { font-size: 0.78rem; }
    .modal-body { padding: 14px 16px; }
    .modal-stats { flex-wrap: wrap; gap: 8px; }
    .modal-stat { min-width: calc(50% - 4px); }
    .order-item { flex-direction: column; align-items: flex-start; gap: 8px; }
    .order-right { text-align: left; display: flex; align-items: center; gap: 10px; }
}
</style>
