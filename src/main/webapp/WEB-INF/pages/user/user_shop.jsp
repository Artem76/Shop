<?xml version="1.0" encoding="cp1251"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=cp1251" %>
<%@ page import="java.net.URLEncoder" %>

<html lang="ru">
<head>
    <meta charset="cp1251">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=cp1251" \>
    <title>Shop | КАБЕЛЬ.ЕСТЬ</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/user_contact">Артем Хиргий </a></li>
                            <li><a href="/user_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
                            <li><a href="mailto:cmua76@outlook.com"><i class="fa fa-envelope"></i>
                                cmua76@outlook.com</a></li>
                            <li><a href="https://www.facebook.com/artem.khirgii"><i class="fa fa-facebook"></i>
                                artem.khirgii</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="/shop"><img src="images/logo.png" alt=""/></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a><i class="fa fa-user"></i> ${login}</a></li>
                            <li><a href="/user_cart"><i class="fa fa-shopping-cart"></i> Корзина</a></li>
                            <li><a id="logout" href="/logout"><i class="fa fa-lock"></i> Выход</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="/shop" class="active">Главная</a></li>
                            <li class="dropdown"><a <%--href="#"--%>>Заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/user_cart">Корзина</a></li>
                                    <li><a href="/user_orders_work">В работе</a></li>
                                    <li><a href="/user_orders_closed">Выполненные</a></li>
                                </ul>
                            </li>
                            <li><a href="/user_message">Отзывы и предложения</a></li>
                            <li><a href="/user_contact">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>КАБЕЛЬ</span>.ЕСТЬ</h1>
                                <h2>Лучшие цены</h2>
                                <p>Мы работаем напрямую с производителями, что позволяет нам обеспечить самые низкие
                                    цены на рынке. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/purse.jpg" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>КАБЕЛЬ</span>.ЕСТЬ</h1>
                                <h2>Быстрая доставка</h2>
                                <p>В нашем распоряжении огромный парк автомобилей, мы гарантируем поставку товара в
                                    течении одного дня после совершения покупки. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/car.png" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>КАБЕЛЬ</span>.ЕСТЬ</h1>
                                <h2>Отличное качество</h2>
                                <p>Мы работаем только с теми произодителями которые заслужили общее признание и
                                    доверие. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/kachestvo.png" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                    </div>
                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section><!--/slider-->


<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Фильтр</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/user_filter" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Тип кабеля
                                        </a>
                                    </h4>
                                </div>
                                <div id="type" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="type_cable" value="All"
                                                       checked><a> Все типы</a></li>
                                            <c:forEach items="${types}" var="type">
                                                <li><input type="radio" name="type_cable"
                                                           value="${type}"><a> ${type}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#numberOfWires">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Количество жил кабеля
                                        </a>
                                    </h4>
                                </div>
                                <div id="numberOfWires" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="numberOfWires_cable" value="0"
                                                       checked><a> Все типы</a></li>
                                            <c:forEach items="${numberOfWireses}" var="numberOfWires">
                                                <li><input type="radio" name="numberOfWires_cable"
                                                           value="${numberOfWires}"><a> ${numberOfWires}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Площадь поперечного сечения жили кабеля
                                        </a>
                                    </h4>
                                </div>
                                <div id="area" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="area_cable" value="0.0"
                                                       checked><a> Все типы</a></li>
                                            <c:forEach items="${areas}" var="area">
                                                <li><input type="radio" name="area_cable"
                                                           value="${area}"><a> ${area}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <input type="submit" value="Применить фильтр"
                                               style="background-color: orange; text-align: center; border: none ">
                                    </h4>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Кабельнопроводниковая продукция</h2>
                    <c:forEach items="${products}" var="product">
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="/photo/${product.photo.id}"alt=""/>
                                        <h2>${product.price} грн.</h2>
                                        <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${product.price} грн.</h2>
                                            <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                            <p>${product.description}</p>
                                            <a class="btn btn-default add-to-cart" data="${product.id}">
                                                <i class="fa fa-shopping-cart"></i>Добавить в корзину</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div><!--features_items-->
            </div>
        </div>
    </div>
</section>
<footer id="footer"><!--Footer-->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="companyinfo">
                        <h2><span>Кабель</span>.Есть</h2>
                        <p>Пользуйтесь услугами нашего магазина и все будет ОТЛИЧНО!!!</p>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/purse.jpg" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>ЦЕНА</i>
                                </div>
                            </a>
                            <p>Низкие цены</p>
                            <h2>Дешевле не найдете</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/car.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>СКОРОСТЬ</i>
                                </div>
                            </a>
                            <p>Быстрая доставка</p>
                            <h2>Быстрее всех</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/kachestvo.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>КАЧЕСТВО</i>
                                </div>
                            </a>
                            <p>Высокое качество</p>
                            <h2>Только лучшее</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="address">
                        <img src="images/home/map.png" alt=""/>
                        <p>Мы находимся в Украине.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/user_contact">Артем Хиргий </a></li>
                            <li><a href="/user_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
                            <li><a href="mailto:cmua76@outlook.com"><i class="fa fa-envelope"></i>
                                cmua76@outlook.com</a></li>
                            <li><a href="https://www.facebook.com/artem.khirgii"><i class="fa fa-facebook"></i>
                                artem.khirgii</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <p class="pull-left">Copyright © 2013 E-Shopper. All rights reserved.</p>
                <p class="pull-right">Designed by <span><a target="_blank"
                                                           href="http://www.themeum.com">Themeum</a></span></p>
            </div>
        </div>
    </div>
</footer><!--/Footer-->

<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script>
    $(".btn.btn-default.add-to-cart").click(function () {
        var d = $(this).attr("data");
        $.post("/user_box_add_product", {product_id: d});
        alert("Товар добавлен в корзину!");
    });
    $("#logout").click(function (event) {
        alert("Выход из акаунта!");
    });
</script>
</body>
</html>

    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="/shop"><img src="images/logo.png" alt=""/></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a><i class="fa fa-user"></i> ${login}</a></li>
                            <li><a href="/user_cart"><i class="fa fa-shopping-cart"></i> Êîðçèíà</a></li>
                            <li><a id="logout" href="/logout"><i class="fa fa-lock"></i> Âûõîä</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="/shop" class="active">Ãëàâíàÿ</a></li>
                            <li class="dropdown"><a <%--href="#"--%>>Çàêàçû<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/user_cart">Êîðçèíà</a></li>
                                    <li><a href="/user_orders_work">Â ðàáîòå</a></li>
                                    <li><a href="/user_orders_closed">Âûïîëíåííûå</a></li>
                                </ul>
                            </li>
                            <li><a href="/user_message">Îòçûâû è ïðåäëîæåíèÿ</a></li>
                            <li><a href="/user_contact">Êîíòàêòû</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="slider"><!--slider-->
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-6">
                                <h1><span>ÊÀÁÅËÜ</span>.ÅÑÒÜ</h1>
                                <h2>Ëó÷øèå öåíû</h2>
                                <p>Ìû ðàáîòàåì íàïðÿìóþ ñ ïðîèçâîäèòåëÿìè, ÷òî ïîçâîëÿåò íàì îáåñïå÷èòü ñàìûå íèçêèå
                                    öåíû íà ðûíêå. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/purse.jpg" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>ÊÀÁÅËÜ</span>.ÅÑÒÜ</h1>
                                <h2>Áûñòðàÿ äîñòàâêà</h2>
                                <p>Â íàøåì ðàñïîðÿæåíèè îãðîìíûé ïàðê àâòîìîáèëåé, ìû ãàðàíòèðóåì ïîñòàâêó òîâàðà â
                                    òå÷åíèè îäíîãî äíÿ ïîñëå ñîâåðøåíèÿ ïîêóïêè. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/car.png" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>ÊÀÁÅËÜ</span>.ÅÑÒÜ</h1>
                                <h2>Îòëè÷íîå êà÷åñòâî</h2>
                                <p>Ìû ðàáîòàåì òîëüêî ñ òåìè ïðîèçîäèòåëÿìè êîòîðûå çàñëóæèëè îáùåå ïðèçíàíèå è
                                    äîâåðèå. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/kachestvo.png" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                    </div>
                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section><!--/slider-->


<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Ôèëüòð</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/user_filter" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Òèï êàáåëÿ
                                        </a>
                                    </h4>
                                </div>
                                <div id="type" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="type_cable" value="All"
                                                       checked><a> Âñå òèïû</a></li>
                                            <c:forEach items="${types}" var="type">
                                                <li><input type="radio" name="type_cable"
                                                           value="${type}"><a> ${type}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#numberOfWires">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Êîëè÷åñòâî æèë êàáåëÿ
                                        </a>
                                    </h4>
                                </div>
                                <div id="numberOfWires" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="numberOfWires_cable" value="0"
                                                       checked><a> Âñå òèïû</a></li>
                                            <c:forEach items="${numberOfWireses}" var="numberOfWires">
                                                <li><input type="radio" name="numberOfWires_cable"
                                                           value="${numberOfWires}"><a> ${numberOfWires}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            Ïëîùàäü ïîïåðå÷íîãî ñå÷åíèÿ æèëè êàáåëÿ
                                        </a>
                                    </h4>
                                </div>
                                <div id="area" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="area_cable" value="0.0"
                                                       checked><a> Âñå òèïû</a></li>
                                            <c:forEach items="${areas}" var="area">
                                                <li><input type="radio" name="area_cable"
                                                           value="${area}"><a> ${area}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <input type="submit" value="Ïðèìåíèòü ôèëüòð"
                                               style="background-color: orange; text-align: center; border: none ">
                                    </h4>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Êàáåëüíîïðîâîäíèêîâàÿ ïðîäóêöèÿ</h2>
                    <c:forEach items="${products}" var="product">
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="/photo/${product.photo.id}"alt=""/>
                                        <h2>${product.price} ãðí.</h2>
                                        <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${product.price} ãðí.</h2>
                                            <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                            <p>${product.description}</p>
                                            <a class="btn btn-default add-to-cart" data="${product.id}">
                                                <i class="fa fa-shopping-cart"></i>Äîáàâèòü â êîðçèíó</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div><!--features_items-->
            </div>
        </div>
    </div>
</section>
<footer id="footer"><!--Footer-->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="companyinfo">
                        <h2><span>Êàáåëü</span>.Åñòü</h2>
                        <p>Ïîëüçóéòåñü óñëóãàìè íàøåãî ìàãàçèíà è âñå áóäåò ÎÒËÈ×ÍÎ!!!</p>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/purse.jpg" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>ÖÅÍÀ</i>
                                </div>
                            </a>
                            <p>Íèçêèå öåíû</p>
                            <h2>Äåøåâëå íå íàéäåòå</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/car.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>ÑÊÎÐÎÑÒÜ</i>
                                </div>
                            </a>
                            <p>Áûñòðàÿ äîñòàâêà</p>
                            <h2>Áûñòðåå âñåõ</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a href="/shop">
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/kachestvo.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>ÊÀ×ÅÑÒÂÎ</i>
                                </div>
                            </a>
                            <p>Âûñîêîå êà÷åñòâî</p>
                            <h2>Òîëüêî ëó÷øåå</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="address">
                        <img src="images/home/map.png" alt=""/>
                        <p>Ìû íàõîäèìñÿ â Óêðàèíå.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/user_contact">Àðòåì Õèðãèé </a></li>
                            <li><a href="/user_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
                            <li><a href="mailto:cmua76@outlook.com"><i class="fa fa-envelope"></i>
                                cmua76@outlook.com</a></li>
                            <li><a href="https://www.facebook.com/artem.khirgii"><i class="fa fa-facebook"></i>
                                artem.khirgii</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <p class="pull-left">Copyright © 2013 E-Shopper. All rights reserved.</p>
                <p class="pull-right">Designed by <span><a target="_blank"
                                                           href="http://www.themeum.com">Themeum</a></span></p>
            </div>
        </div>
    </div>
</footer><!--/Footer-->

<script src="js/jquery.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
<script>
    $(".btn.btn-default.add-to-cart").click(function () {
        var d = $(this).attr("data");
        $.post("/user_box_add_product", {product_id: d});
        alert("Òîâàð äîáàâëåí â êîðçèíó!");
    });
    $("#logout").click(function (event) {
        alert("Âûõîä èç àêàóíòà!");
    });
</script>
</body>
</html>
