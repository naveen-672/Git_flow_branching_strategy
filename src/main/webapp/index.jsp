<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Simple Online Store</title>

    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        /* ========== TOKENS ========== */
        :root {
            --bg: #ffffff;
            --bg-soft: #f6f6f7;
            --border: #e4e4e7;
            --border-strong: #d4d4d8;
            --text: #18181b;
            --muted: #6b7280;
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --primary-soft: #eff4ff;
            --success: #16a34a;
            --warning: #f59e0b;
            --radius: 10px;
            --radius-sm: 8px;
            --container: 1100px;
        }

        /* ========== BASE ========== */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        html { scroll-behavior: smooth; }
        body {
            font-family: 'Inter', system-ui, -apple-system, 'Segoe UI', sans-serif;
            background: var(--bg);
            color: var(--text);
            font-size: 15px;
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
        }
        a { color: inherit; text-decoration: none; }
        img { display: block; max-width: 100%; }
        button { font-family: inherit; cursor: pointer; border: none; background: none; color: inherit; }
        input { font-family: inherit; }
        :focus-visible { outline: 2px solid var(--primary); outline-offset: 2px; }

        .container { width: 100%; max-width: var(--container); margin: 0 auto; padding: 0 20px; }
        .muted { color: var(--muted); }
        .sr-only {
            position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
            overflow: hidden; clip: rect(0,0,0,0); border: 0;
        }

        /* ========== BUTTONS ========== */
        .btn {
            display: inline-flex; align-items: center; justify-content: center; gap: 8px;
            padding: 11px 22px;
            border-radius: var(--radius-sm);
            font-weight: 600; font-size: 15px;
            border: 1px solid transparent;
            transition: background .15s ease, border-color .15s ease, color .15s ease;
        }
        .btn-primary { background: var(--primary); color: #fff; }
        .btn-primary:hover { background: var(--primary-hover); }
        .btn-outline { background: #fff; color: var(--text); border-color: var(--border-strong); }
        .btn-outline:hover { background: var(--bg-soft); }
        .btn-sm { padding: 8px 16px; font-size: 14px; }

        /* ========== HEADER ========== */
        header {
            position: sticky; top: 0; z-index: 100;
            background: #fff;
            border-bottom: 1px solid var(--border);
        }
        .header-inner {
            display: flex; align-items: center; justify-content: space-between;
            gap: 20px; min-height: 64px;
        }
        .header-left { display: flex; align-items: center; gap: 10px; }

        .brand {
            display: flex; align-items: center; gap: 8px;
            font-weight: 700; font-size: 20px; letter-spacing: -0.3px;
            flex-shrink: 0;
        }
        .brand i { color: var(--primary); font-size: 20px; }
        .brand .accent { color: var(--primary); }

        nav.main-nav ul { display: flex; gap: 2px; list-style: none; }
        nav.main-nav li a {
            display: flex; align-items: center; gap: 6px;
            padding: 8px 12px; border-radius: var(--radius-sm);
            font-weight: 500; font-size: 14px; color: var(--muted);
            transition: background .15s ease, color .15s ease;
        }
        nav.main-nav li a:hover { background: var(--bg-soft); color: var(--text); }
        nav.main-nav li a.active { background: var(--primary-soft); color: var(--primary); }

        .header-right { display: flex; align-items: center; gap: 8px; }

        .search-wrap {
            display: flex; align-items: center;
            background: #fff;
            border: 1px solid var(--border-strong);
            border-radius: var(--radius-sm);
            padding: 0 12px;
            transition: border-color .15s ease, box-shadow .15s ease;
        }
        .search-wrap:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, .12);
        }
        .search-wrap input {
            border: 0; background: transparent; outline: none;
            width: 170px; padding: 9px 0; font-size: 14px; color: var(--text);
        }
        .search-wrap input::placeholder { color: #9ca3af; }
        .search-wrap button { color: var(--muted); padding: 6px 0 6px 8px; font-size: 14px; }
        .search-wrap button:hover { color: var(--primary); }

        .icon-btn {
            width: 38px; height: 38px;
            display: grid; place-items: center;
            border-radius: var(--radius-sm);
            font-size: 16px; color: var(--muted);
            transition: background .15s ease, color .15s ease;
        }
        .icon-btn:hover { background: var(--bg-soft); color: var(--text); }

        .cart-wrap { position: relative; }
        .cart-count {
            position: absolute; top: -3px; right: -3px;
            background: var(--primary); color: #fff;
            font-size: 11px; font-weight: 700;
            min-width: 18px; height: 18px; padding: 0 4px;
            border-radius: 999px;
            display: grid; place-items: center;
            border: 2px solid #fff;
            transition: transform .2s ease;
        }

        .mobile-toggle {
            display: none;
            width: 38px; height: 38px;
            border-radius: var(--radius-sm);
            font-size: 18px; color: var(--text);
            background: var(--bg-soft);
        }

        #mobileMenu {
            display: none;
            background: #fff;
            border-top: 1px solid var(--border);
            padding: 10px 0 16px;
        }
        #mobileMenu ul { list-style: none; display: flex; flex-direction: column; gap: 2px; }
        #mobileMenu ul li a {
            display: flex; align-items: center; gap: 12px;
            padding: 11px 12px; border-radius: var(--radius-sm);
            font-weight: 500; color: var(--text);
        }
        #mobileMenu ul li a:hover { background: var(--bg-soft); }
        #mobileMenu ul li a i { width: 20px; color: var(--muted); }

        /* ========== HERO ========== */
        .hero {
            background: var(--bg-soft);
            border-bottom: 1px solid var(--border);
            padding: 56px 0;
        }
        .hero .badge {
            display: inline-block;
            background: #fff;
            border: 1px solid var(--border-strong);
            color: var(--muted);
            padding: 4px 12px;
            border-radius: 999px;
            font-weight: 500; font-size: 13px;
            margin-bottom: 16px;
        }
        .hero h1 {
            font-size: 38px; font-weight: 700; line-height: 1.2;
            letter-spacing: -0.6px;
            max-width: 560px; margin-bottom: 14px;
        }
        .hero p {
            color: var(--muted); font-size: 17px;
            max-width: 500px; margin-bottom: 26px;
        }
        .hero .actions { display: flex; gap: 10px; flex-wrap: wrap; }

        /* ========== SECTION ========== */
        .section { padding: 48px 0; }
        .section-header {
            display: flex; align-items: flex-end; justify-content: space-between;
            gap: 16px; margin-bottom: 24px; flex-wrap: wrap;
        }
        .section-header h2 { font-size: 22px; font-weight: 700; letter-spacing: -0.3px; }
        .section-header p { color: var(--muted); font-size: 15px; margin-top: 2px; }
        .view-all {
            font-weight: 600; font-size: 14px; color: var(--primary);
            display: flex; align-items: center; gap: 6px; white-space: nowrap;
        }
        .view-all:hover { color: var(--primary-hover); }

        /* ========== CATEGORIES ========== */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 12px;
        }
        .cat-card {
            background: #fff;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 20px 12px;
            text-align: center;
            cursor: pointer;
            transition: border-color .15s ease, background .15s ease;
        }
        .cat-card:hover { border-color: var(--primary); background: var(--primary-soft); }
        .cat-card .icon-wrap {
            width: 44px; height: 44px;
            border-radius: 50%;
            background: var(--bg-soft);
            display: grid; place-items: center;
            margin: 0 auto 10px;
            font-size: 18px; color: var(--primary);
        }
        .cat-card:hover .icon-wrap { background: #fff; }
        .cat-card h4 { font-size: 14px; font-weight: 600; }
        .cat-card .count { font-size: 13px; color: var(--muted); margin-top: 2px; }

        /* ========== PRODUCTS ========== */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
        }
        .product-card {
            background: #fff;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
            display: flex; flex-direction: column;
            transition: border-color .15s ease;
        }
        .product-card:hover { border-color: var(--border-strong); }
        .product-card .img-wrap {
            position: relative;
            background: var(--bg-soft);
            aspect-ratio: 1 / 1;
            overflow: hidden;
        }
        .product-card .img-wrap img { width: 100%; height: 100%; object-fit: cover; }
        .product-card .badge {
            position: absolute; top: 10px; left: 10px;
            background: var(--text); color: #fff;
            padding: 3px 10px; border-radius: 999px;
            font-size: 11px; font-weight: 600;
        }
        .product-card .badge.sale { background: var(--warning); color: #fff; }
        .product-card .wish-btn {
            position: absolute; top: 10px; right: 10px;
            width: 32px; height: 32px;
            border-radius: 50%;
            background: #fff;
            border: 1px solid var(--border);
            display: grid; place-items: center;
            font-size: 14px; color: var(--muted);
            transition: color .15s ease, border-color .15s ease;
        }
        .product-card .wish-btn:hover { color: var(--primary); border-color: var(--primary); }
        .product-card .body {
            padding: 14px 14px 10px;
            flex: 1;
            display: flex; flex-direction: column; gap: 4px;
        }
        .product-card .category-tag {
            font-size: 11px; color: var(--muted);
            text-transform: uppercase; letter-spacing: .5px; font-weight: 600;
        }
        .product-card .body h5 {
            font-size: 15px; font-weight: 600; line-height: 1.35;
            display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .product-card .price-row { display: flex; align-items: center; gap: 8px; margin-top: 2px; }
        .product-card .price { font-weight: 700; font-size: 16px; }
        .product-card .old-price { color: var(--muted); text-decoration: line-through; font-size: 13px; }
        .product-card .rating { font-size: 13px; color: var(--warning); letter-spacing: 1px; }
        .product-card .rating span { color: var(--muted); letter-spacing: 0; }
        .product-card .footer { padding: 0 14px 14px; }
        .product-card .footer .add-btn {
            width: 100%;
            padding: 9px;
            border-radius: var(--radius-sm);
            background: var(--primary); color: #fff;
            font-weight: 600; font-size: 14px;
            display: flex; align-items: center; justify-content: center; gap: 7px;
            transition: background .15s ease;
        }
        .product-card .footer .add-btn:hover { background: var(--primary-hover); }
        .product-card .footer .add-btn.added { background: var(--success); }

        /* ========== DEAL ========== */
        .deal-wrap {
            display: flex;
            background: #fff;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
        }
        .deal-wrap .deal-img { flex: 0 0 45%; background: var(--bg-soft); min-height: 300px; }
        .deal-wrap .deal-img img { width: 100%; height: 100%; object-fit: cover; }
        .deal-wrap .deal-content {
            flex: 1; padding: 32px 36px;
            display: flex; flex-direction: column; justify-content: center;
        }
        .deal-wrap .tag {
            display: inline-block; align-self: flex-start;
            background: var(--bg-soft);
            border: 1px solid var(--border-strong);
            color: var(--muted);
            padding: 3px 12px; border-radius: 999px;
            font-size: 12px; font-weight: 600;
            text-transform: uppercase; letter-spacing: .5px;
            margin-bottom: 12px;
        }
        .deal-wrap .deal-content h3 { font-size: 24px; font-weight: 700; margin-bottom: 6px; }
        .deal-wrap .deal-content .desc { color: var(--muted); margin-bottom: 16px; }
        .deal-wrap .price-big { font-size: 28px; font-weight: 700; }
        .deal-wrap .price-big .old {
            font-size: 17px; font-weight: 400; color: var(--muted);
            text-decoration: line-through; margin-left: 8px;
        }
        .deal-wrap .stock { font-size: 14px; color: var(--muted); margin: 6px 0 18px; }
        .deal-wrap .stock strong { color: var(--text); }

        .timer-grid { display: flex; gap: 8px; margin-bottom: 20px; }
        .timer-box {
            background: var(--bg-soft);
            border: 1px solid var(--border);
            border-radius: var(--radius-sm);
            padding: 8px 14px;
            min-width: 62px;
            text-align: center;
        }
        .timer-box .num { font-size: 20px; font-weight: 700; line-height: 1.2; }
        .timer-box .label {
            font-size: 11px; color: var(--muted);
            text-transform: uppercase; letter-spacing: .5px;
        }
        .deal-wrap .btn { align-self: flex-start; }

        /* ========== TESTIMONIALS ========== */
        .testimonials-scroll {
            display: flex; gap: 16px;
            overflow-x: auto;
            padding-bottom: 12px;
            scroll-snap-type: x mandatory;
            -webkit-overflow-scrolling: touch;
        }
        .testimonials-scroll::-webkit-scrollbar { height: 6px; }
        .testimonials-scroll::-webkit-scrollbar-thumb { background: var(--border-strong); border-radius: 999px; }
        .testimonial-card {
            flex: 0 0 320px;
            background: #fff;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 20px;
            scroll-snap-align: start;
        }
        .testimonial-card .stars { color: var(--warning); font-size: 15px; letter-spacing: 2px; margin-bottom: 8px; }
        .testimonial-card blockquote { font-size: 15px; line-height: 1.6; margin-bottom: 16px; }
        .testimonial-card .author { display: flex; align-items: center; gap: 10px; }
        .testimonial-card .author .avatar {
            width: 40px; height: 40px; border-radius: 50%; object-fit: cover; background: var(--bg-soft);
        }
        .testimonial-card .author .name { font-weight: 600; font-size: 14px; }
        .testimonial-card .author .role { font-size: 13px; color: var(--muted); }

        /* ========== NEWSLETTER ========== */
        .newsletter-wrap {
            background: var(--bg-soft);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 32px 36px;
            display: flex; align-items: center; justify-content: space-between;
            gap: 28px; flex-wrap: wrap;
        }
        .newsletter-wrap .text h3 { font-size: 20px; font-weight: 700; margin-bottom: 2px; }
        .newsletter-wrap .text p { color: var(--muted); font-size: 15px; }
        .newsletter-wrap form {
            display: flex; gap: 8px; flex-wrap: wrap;
            flex: 1; max-width: 440px;
        }
        .newsletter-wrap form input {
            flex: 1; min-width: 200px;
            padding: 11px 14px;
            border-radius: var(--radius-sm);
            border: 1px solid var(--border-strong);
            background: #fff;
            font-size: 15px;
            transition: border-color .15s ease, box-shadow .15s ease;
        }
        .newsletter-wrap form input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, .12);
        }
        #newsletterMsg { margin-top: 8px; font-size: 14px; width: 100%; }

        /* ========== FOOTER ========== */
        footer { border-top: 1px solid var(--border); padding: 40px 0 24px; margin-top: 16px; }
        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 32px;
            margin-bottom: 28px;
        }
        .footer-grid .brand-col .brand { font-size: 18px; margin-bottom: 8px; }
        .footer-grid .brand-col p { color: var(--muted); font-size: 14px; max-width: 280px; }
        .footer-grid .brand-col .socials { display: flex; gap: 8px; margin-top: 14px; }
        .footer-grid .brand-col .socials a {
            width: 36px; height: 36px; border-radius: var(--radius-sm);
            background: var(--bg-soft); border: 1px solid var(--border);
            display: grid; place-items: center;
            color: var(--muted); font-size: 14px;
            transition: color .15s ease, border-color .15s ease;
        }
        .footer-grid .brand-col .socials a:hover { color: var(--primary); border-color: var(--primary); }
        .footer-grid .col h5 { font-weight: 700; font-size: 14px; margin-bottom: 10px; }
        .footer-grid .col ul { list-style: none; display: flex; flex-direction: column; gap: 6px; }
        .footer-grid .col ul li a { color: var(--muted); font-size: 14px; }
        .footer-grid .col ul li a:hover { color: var(--primary); }
        .footer-bottom {
            text-align: center; padding-top: 20px;
            border-top: 1px solid var(--border);
            color: var(--muted); font-size: 13px;
        }

        /* ========== RESPONSIVE ========== */
        @media (max-width: 1100px) {
            .products-grid { grid-template-columns: repeat(3, 1fr); }
            .categories-grid { grid-template-columns: repeat(3, 1fr); }
            .footer-grid { grid-template-columns: 1fr 1fr; gap: 24px; }
        }

        @media (max-width: 992px) {
            .hero { padding: 44px 0; }
            .hero h1 { font-size: 32px; }
            .deal-wrap { flex-direction: column; }
            .deal-wrap .deal-img { flex: 0 0 220px; min-height: 0; }
            .deal-wrap .deal-content { padding: 26px 24px; }
            .newsletter-wrap { padding: 26px 24px; }
            .newsletter-wrap form { max-width: 100%; }
            .search-wrap input { width: 130px; }
        }

        @media (max-width: 820px) {
            nav.main-nav { display: none; }
            .mobile-toggle { display: grid; place-items: center; }
            .search-wrap input { width: 110px; }
        }

        @media (max-width: 768px) {
            .hero { padding: 36px 0; }
            .hero h1 { font-size: 28px; }
            .hero p { font-size: 16px; }
            .section { padding: 36px 0; }
            .section-header h2 { font-size: 20px; }
            .products-grid { grid-template-columns: repeat(2, 1fr); gap: 12px; }
            .categories-grid { grid-template-columns: repeat(3, 1fr); gap: 10px; }
            .testimonial-card { flex: 0 0 270px; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }

        @media (max-width: 560px) {
            .container { padding: 0 14px; }
            .header-inner { gap: 10px; }
            .search-wrap { display: none; }
            .brand { font-size: 18px; }
            .brand i { font-size: 18px; }
            .hero h1 { font-size: 24px; }
            .hero .btn { padding: 10px 18px; font-size: 14px; }
            .categories-grid { grid-template-columns: repeat(2, 1fr); }
            .products-grid { gap: 10px; }
            .product-card .body { padding: 12px 12px 8px; }
            .product-card .body h5 { font-size: 14px; }
            .product-card .footer { padding: 0 12px 12px; }
            .product-card .footer .add-btn { font-size: 13px; padding: 8px; }
            .timer-box { min-width: 54px; padding: 6px 10px; }
            .timer-box .num { font-size: 17px; }
            .footer-grid { grid-template-columns: 1fr; gap: 20px; }
        }
    </style>
</head>

<body>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="container header-inner">
            <div class="header-left">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">
                    <i class="fas fa-bars"></i>
                </button>
                <a class="brand" href="#">
                    <i class="fas fa-store"></i>
                    <span>Nexus<span class="accent">Shop</span></span>
                </a>
            </div>

            <nav class="main-nav" id="mainNav" aria-label="Main navigation">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </nav>

            <div class="header-right">
                <div class="search-wrap" role="search">
                    <input type="search" id="searchInput" placeholder="Search products" aria-label="Search" />
                    <button id="searchBtn" aria-label="Submit search"><i class="fas fa-search"></i></button>
                </div>

                <button class="icon-btn" title="Account" aria-label="Account"><i class="far fa-user"></i></button>
                <button class="icon-btn" title="Wishlist" aria-label="Wishlist"><i class="far fa-heart"></i></button>

                <div class="cart-wrap">
                    <button class="icon-btn" id="cartBtn" title="Cart" aria-label="Cart">
                        <i class="fas fa-shopping-bag"></i>
                    </button>
                    <span class="cart-count" id="cartCount">0</span>
                </div>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu">
            <div class="container">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                    <li><a href="#"><i class="far fa-user"></i> Account</a></li>
                    <li><a href="#"><i class="far fa-heart"></i> Wishlist</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- ===== MAIN ===== -->
    <main>

        <!-- HERO -->
        <section class="hero" aria-label="Hero banner">
            <div class="container">
                <div class="badge">New Collection 2026</div>
                <h1>Everything you need, in one simple place.</h1>
                <p>Shop quality electronics, fashion and accessories. Free shipping on your first order, plus easy returns.</p>
                <div class="actions">
                    <button class="btn btn-primary" id="shopNow">
                        Shop Now <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="btn btn-outline" id="exploreDeals">
                        <i class="fas fa-tag"></i> See Deals
                    </button>
                </div>
            </div>
        </section>

        <!-- CATEGORIES -->
        <section class="section" id="categories" aria-labelledby="cat-title">
            <div class="container">
                <div class="section-header">
                    <div>
                        <h2 id="cat-title">Browse Categories</h2>
                        <p>Find exactly what you're looking for</p>
                    </div>
                    <a href="#" class="view-all">All Categories <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="categories-grid" id="categoriesGrid" aria-live="polite"></div>
            </div>
        </section>

        <!-- PRODUCTS -->
        <section class="section" id="products" aria-labelledby="prod-title">
            <div class="container">
                <div class="section-header">
                    <div>
                        <h2 id="prod-title">Trending Now</h2>
                        <p>Popular picks from our community</p>
                    </div>
                    <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="products-grid" id="productsGrid" aria-live="polite"></div>
            </div>
        </section>

        <!-- DEAL -->
        <section class="section" id="deals" aria-labelledby="deals-title">
            <div class="container">
                <div class="section-header">
                    <div>
                        <h2 id="deals-title">Deal of the Day</h2>
                        <p>Limited stock — ends soon</p>
                    </div>
                </div>
                <div class="deal-wrap">
                    <div class="deal-img">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="MacBook Air M2" loading="lazy">
                    </div>
                    <div class="deal-content">
                        <span class="tag">Limited Offer</span>
                        <h3>MacBook Air M2</h3>
                        <p class="desc">Thin, light and powerful — the M2 chip redefines performance.</p>
                        <div>
                            <span class="price-big">$999 <span class="old">$1,199</span></span>
                        </div>
                        <p class="stock">Only <strong>12</strong> left — hurry!</p>
                        <div class="timer-grid" id="dealTimer">
                            <div class="timer-box">
                                <div class="num" id="dealDays">0</div>
                                <div class="label">Days</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealHours">00</div>
                                <div class="label">Hours</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealMinutes">00</div>
                                <div class="label">Mins</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealSeconds">00</div>
                                <div class="label">Secs</div>
                            </div>
                        </div>
                        <button class="btn btn-primary" id="buyDeal">
                            <i class="fas fa-cart-plus"></i> Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS -->
        <section class="section" id="testimonials" aria-labelledby="test-title">
            <div class="container">
                <div class="section-header">
                    <div>
                        <h2 id="test-title">What Our Customers Say</h2>
                        <p>Real reviews from real people</p>
                    </div>
                </div>
                <div class="testimonials-scroll" id="testimonialsList"></div>
            </div>
        </section>

        <!-- NEWSLETTER -->
        <section class="section" aria-labelledby="news-title">
            <div class="container">
                <div class="newsletter-wrap">
                    <div class="text">
                        <h3 id="news-title">Stay in the loop</h3>
                        <p>Get offers, early access and new arrivals.</p>
                    </div>
                    <form id="newsletterForm" onsubmit="return false;">
                        <input type="email" id="newsletterEmail" placeholder="Enter your email" aria-label="Email" required />
                        <button class="btn btn-primary" id="subscribeBtn">
                            <i class="fas fa-paper-plane"></i> Subscribe
                        </button>
                        <div id="newsletterMsg"></div>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <!-- ===== FOOTER ===== -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="brand-col">
                    <div class="brand">
                        <i class="fas fa-store"></i>
                        <span>Nexus<span class="accent">Shop</span></span>
                    </div>
                    <p>Quality products and a simple shopping experience — that's it.</p>
                    <div class="socials">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col">
                    <h5>Company</h5>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Blog</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Shipping</a></li>
                        <li><a href="#">Returns</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h5>Legal</h5>
                    <ul>
                        <li><a href="#">Privacy</a></li>
                        <li><a href="#">Terms</a></li>
                        <li><a href="#">Cookies</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; <span id="year"></span> NexusShop. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- ===== SCRIPT ===== -->
    <script>
        // ============================================================
        // DATA
        // ============================================================
        const CATEGORIES = [
            { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt', count: 24 },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: 18 },
            { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt', count: 42 },
            { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones', count: 31 },
            { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints', count: 27 },
            { id: 'accessories', name: 'Accessories', icon: 'fa-watch', count: 39 }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New',
                img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80',
                category: 'Smartphones' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, rating: 4, reviews: 86, badge: '',
                img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80',
                category: 'Laptops' },
            { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: 'Sale',
                img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 4, title: 'Nike Air Max 270', price: 150, rating: 4, reviews: 53, badge: '',
                img: 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80',
                category: 'Footwear' },
            { id: 5, title: 'Sony A7 IV Camera', price: 2499, rating: 5, reviews: 42, badge: 'New',
                img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80',
                category: 'Gadgets' },
            { id: 6, title: 'Chanel No. 5', price: 120, rating: 5, reviews: 189, badge: '',
                img: 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 7, title: 'Travel Backpack', price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: 'Sale',
                img: 'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80',
                category: 'Accessories' },
            { id: 8, title: 'Sony WH-1000XM5', price: 399, rating: 5, reviews: 156, badge: '',
                img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80',
                category: 'Gadgets' }
        ];

        const TESTIMONIALS = [{
            name: 'Ava Martin',
            role: 'Verified Buyer',
            avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80',
            text: 'Fast shipping and excellent support. The product exceeded my expectations!',
            stars: 5
        }, {
            name: 'Michael Lee',
            role: 'Frequent Shopper',
            avatar: 'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80',
            text: 'Great selection and smooth checkout. Will definitely shop again.',
            stars: 4
        }, {
            name: 'Sophia Chen',
            role: 'Designer',
            avatar: 'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80',
            text: 'Love the quality and the packaging. Everything arrived in perfect condition.',
            stars: 5
        }, {
            name: 'James Wilson',
            role: 'Tech Enthusiast',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80',
            text: 'Amazing prices on electronics. The M2 MacBook deal was unbeatable.',
            stars: 5
        }];

        // ============================================================
        // STATE
        // ============================================================
        let cartCount = 0;

        // ============================================================
        // DOM REFS
        // ============================================================
        const categoriesGrid = document.getElementById('categoriesGrid');
        const productsGrid = document.getElementById('productsGrid');
        const cartCountEl = document.getElementById('cartCount');
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const mobileToggle = document.getElementById('mobileToggle');
        const mobileMenu = document.getElementById('mobileMenu');
        const newsletterForm = document.getElementById('newsletterForm');
        const newsletterEmail = document.getElementById('newsletterEmail');
        const newsletterMsg = document.getElementById('newsletterMsg');
        const testimonialsList = document.getElementById('testimonialsList');

        // ============================================================
        // RENDER FUNCTIONS
        // ============================================================
        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(cat => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `
                    <div class="icon-wrap"><i class="fas ${cat.icon}"></i></div>
                    <h4>${cat.name}</h4>
                    <div class="count">${cat.count} items</div>
                `;
                el.addEventListener('click', () => {
                    searchInput.value = cat.name;
                    filterProducts(cat.name);
                    document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
                });
                categoriesGrid.appendChild(el);
            });
        }

        function renderProducts(list) {
            productsGrid.innerHTML = '';
            if (!list.length) {
                productsGrid.innerHTML =
                `<p style="grid-column:1/-1;text-align:center;padding:40px;color:var(--muted);">No products found.</p>`;
                return;
            }
            list.forEach(p => {
                const el = document.createElement('article');
                el.className = 'product-card';
                const badgeClass = p.badge === 'Sale' ? 'sale' : '';
                const badgeHtml = p.badge ? `<span class="badge ${badgeClass}">${p.badge}</span>` : '';
                const oldPriceHtml = p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : '';
                const stars = '★'.repeat(Math.round(p.rating)) + '☆'.repeat(5 - Math.round(p.rating));
                el.innerHTML = `
                    <div class="img-wrap">
                        <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy">
                        ${badgeHtml}
                        <button class="wish-btn" aria-label="Add to wishlist"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="body">
                        <div class="category-tag">${p.category}</div>
                        <h5>${escapeHtml(p.title)}</h5>
                        <div class="price-row">
                            <span class="price">$${p.price.toLocaleString()}</span>
                            ${oldPriceHtml}
                        </div>
                        <div class="rating">
                            ${stars} <span>(${p.reviews})</span>
                        </div>
                    </div>
                    <div class="footer">
                        <button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add to Cart</button>
                    </div>
                `;
                productsGrid.appendChild(el);
            });

            // Add to cart listeners
            productsGrid.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const id = Number(this.dataset.id);
                    addToCart(id, this);
                });
            });
        }

        function renderTestimonials() {
            testimonialsList.innerHTML = '';
            TESTIMONIALS.forEach(t => {
                const stars = '★'.repeat(t.stars) + '☆'.repeat(5 - t.stars);
                const el = document.createElement('div');
                el.className = 'testimonial-card';
                el.innerHTML = `
                    <div class="stars">${stars}</div>
                    <blockquote>“${escapeHtml(t.text)}”</blockquote>
                    <div class="author">
                        <img class="avatar" src="${t.avatar}" alt="${escapeHtml(t.name)}" loading="lazy">
                        <div>
                            <div class="name">${escapeHtml(t.name)}</div>
                            <div class="role">${escapeHtml(t.role)}</div>
                        </div>
                    </div>
                `;
                testimonialsList.appendChild(el);
            });
        }

        // ============================================================
        // UTILITY FUNCTIONS
        // ============================================================
        function escapeHtml(text) {
            return String(text).replace(/[&<>"']/g, s => ({
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;',
                "'": '&#39;'
            } [s]));
        }

        function updateCartCount() {
            cartCountEl.textContent = cartCount;
            cartCountEl.style.transform = 'scale(1.25)';
            setTimeout(() => cartCountEl.style.transform = 'scale(1)', 180);
        }

        function addToCart(productId, btnEl) {
            const p = PRODUCTS.find(x => x.id === productId);
            if (!p) return;
            cartCount++;
            updateCartCount();

            if (btnEl) {
                const orig = btnEl.innerHTML;
                btnEl.innerHTML = '<i class="fas fa-check"></i> Added';
                btnEl.classList.add('added');
                setTimeout(() => {
                    btnEl.innerHTML = orig;
                    btnEl.classList.remove('added');
                }, 1500);
            }
            const cartBtn = document.getElementById('cartBtn');
            cartBtn.style.color = 'var(--primary)';
            setTimeout(() => cartBtn.style.color = '', 400);
        }

        function filterProducts(query) {
            const q = String(query || '').trim().toLowerCase();
            if (!q) {
                renderProducts(PRODUCTS);
                return;
            }
            const filtered = PRODUCTS.filter(p =>
                p.title.toLowerCase().includes(q) ||
                p.category.toLowerCase().includes(q)
            );
            renderProducts(filtered);
        }

        // ============================================================
        // DEAL TIMER
        // ============================================================
        (function setupDealTimer() {
            const now = new Date();
            const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);

            function tick() {
                const diff = target - new Date();
                if (diff <= 0) {
                    document.getElementById('dealDays').textContent = '0';
                    document.getElementById('dealHours').textContent = '00';
                    document.getElementById('dealMinutes').textContent = '00';
                    document.getElementById('dealSeconds').textContent = '00';
                    return;
                }
                const days = Math.floor(diff / (24 * 3600 * 1000));
                const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));
                const mins = Math.floor((diff % (3600 * 1000)) / (60 * 1000));
                const secs = Math.floor((diff % (60 * 1000)) / 1000);
                document.getElementById('dealDays').textContent = days;
                document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
                document.getElementById('dealMinutes').textContent = String(mins).padStart(2, '0');
                document.getElementById('dealSeconds').textContent = String(secs).padStart(2, '0');
            }
            tick();
            setInterval(tick, 1000);
        })();

        // ============================================================
        // EVENT BINDINGS
        // ============================================================
        searchBtn.addEventListener('click', () => filterProducts(searchInput.value));
        searchInput.addEventListener('keydown', (e) => {
            if (e.key === 'Enter') filterProducts(e.target.value);
        });

        mobileToggle.addEventListener('click', () => {
            const isOpen = mobileMenu.style.display === 'block';
            mobileMenu.style.display = isOpen ? 'none' : 'block';
            mobileToggle.innerHTML = isOpen ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
        });

        mobileMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            });
        });

        document.getElementById('shopNow').addEventListener('click', () => {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
        document.getElementById('exploreDeals').addEventListener('click', () => {
            document.getElementById('deals').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        document.getElementById('buyDeal').addEventListener('click', function() {
            cartCount++;
            updateCartCount();
            const orig = this.innerHTML;
            this.innerHTML = '<i class="fas fa-check"></i> Added to Cart';
            this.style.background = 'var(--success)';
            setTimeout(() => {
                this.innerHTML = orig;
                this.style.background = '';
            }, 1600);
        });

        newsletterForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const email = newsletterEmail.value.trim();
            if (!email || !email.includes('@')) {
                newsletterMsg.textContent = 'Please enter a valid email address.';
                newsletterMsg.style.color = '#dc2626';
                return;
            }
            newsletterMsg.textContent = 'Thanks for subscribing!';
            newsletterMsg.style.color = 'var(--success)';
            newsletterEmail.value = '';
            setTimeout(() => {
                newsletterMsg.textContent = '';
            }, 3500);
        });

        document.getElementById('cartBtn').addEventListener('click', () => {
            alert(`Your cart has ${cartCount} item${cartCount !== 1 ? 's' : ''}.`);
        });

        document.getElementById('year').textContent = new Date().getFullYear();

        // ============================================================
        // INIT
        // ============================================================
        renderCategories();
        renderProducts(PRODUCTS);
        renderTestimonials();
        updateCartCount();

        window.addEventListener('resize', () => {
            if (window.innerWidth > 820) {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });
    </script>

</body>
</html>
