<?xml version="1.0" encoding="cp1251"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                            <li><a href="/contact">Артем Хиргий </a></li>
                            <li><a href="/contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
                            <li><a href="/shop"><i class="fa fa-shopping-cart"></i> Магазин</a></li>
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
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="/shop">Главная</a></li>
                            <li class="dropdown"><a <%--href="#"--%>>Заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/user_cart" class="active">Корзина</a></li>
                                    <li><a <%--href="/user_box_1"--%>>В работе</a></li>
                                    <li><a <%--href="/user_box_2"--%>>Выполненные</a></li>
                                </ul>
                            </li>
                            <li><a <%--href="/message"--%>>Сообщения</a></li>
                            <li><a <%--href="/contact"--%>>Контакты</a></li>
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

<section id="cart_items">
    <div class="container">
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">Кабель</td>
                    <td class="description"></td>
                    <td class="price">Цена за единицу, грн.</td>
                    <td class="quantity">Количество, м.</td>
                    <td class="description"></td>
                    <td class="total">Стоимость, грн.</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ords}" var="ord">
                    <tr>
                        <td class="cart_product">
                            <a><img src="/photo/${ord.product.photo.id}" alt=""
                                    style="height: 40px; width: 40px; margin: 0 auto"></a>
                        </td>
                        <td class="cart_description">
                            <h4>
                                <a style="margin: 0 auto">${ord.product.type}${ord.product.numberOfWires}x${ord.product.area}</a>
                            </h4>
                        </td>
                        <td class="cart_price">
                            <p style="margin: 0 auto">${ord.priceOrd}</p>
                        </td>
                        <form action="/user_box_update_ord?ord_id=${ord.id}" method="post">
                            <td class="cart_quantity" style="vertical-align: middle">
                                <div class="cart_quantity_button">
                                    <input class="cart_quantity_input" type="text" name="numberProduct"
                                           value="${ord.numberProduct}"
                                           autocomplete="off" size="8" style="margin: 0 auto">
                                </div>
                            </td>
                            <td>
                                <input type="submit" class="btn btn-default update" value="Обновить"
                                       style="margin: 0 auto">
                            </td>
                        </form>
                        <td class="cart_total">
                            <p class="cart_total_price" style="margin: 0 auto">${ord.numberProduct*ord.priceOrd}</p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete" href="/user_box_delete_ord?ord_id=${ord.id}"
                               style="margin: 0 auto"><i
                                    class="fa fa-times"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->

<section id="do_action">
    <div class="container">
        <div class="col-sm-6">
            <div class="total_area">
                <form action="/user_box_order" method="post">
                    <ul>
                        <textarea name="description" placeholder="Пояснения к заказу." rows="16"></textarea>
                        <li>Общая стоимость <span>${sum} грн.</span></li>
                        <input type="submit" id="order" class="btn btn-default check_out" value="Заказать">
                    </ul>
                </form>
            </div>
        </div>
    </div>
    </div>
</section><!--/#do_action-->

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
                            <li><a href="/contact">Артем Хиргий </a></li>
                            <li><a href="/contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
    $("#order").click(function (event) {
        alert("Заказ отправлен в обработку!");
    });
    $("#logout").click(function (event) {
        alert("Выход из акаунта!");
    });
</script>
</body>
</html>
