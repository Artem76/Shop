<?xml version="1.0" encoding="cp1251"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <li><a href="/manager_contact">Артем Хиргий </a></li>
                            <li><a href="/manager_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
                <div class="col-sm-12">
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
                            <li><a href="/shop">Новые заказы</a></li>
                            <li class="dropdown"><a <%--href="#"--%>>Свои заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_their_orders_work">В работе</a></li>
                                    <li><a href="/manager_their_orders_closed">Выполненные</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a <%--href="#"--%>>Все заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_all_orders_work">В работе</a></li>
                                    <li><a href="/manager_all_orders_closed">Выполненные</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_search_client">Поиск клиента</a></li>
                            <li class="dropdown"><a <%--href="#"--%>>Продукция<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_product_all">Весь кабель</a></li>
                                    <li><a href="/manager_product_add">Добавить кабель</a></li>
                                    <li><a href="/manager_photo">Фото</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_message">Отзывы и предложения</a></li>
                            <li><a href="/manager_contact" class="active">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<div id="contact-page" class="container" style="margin-top: 40px">
    <div class="bg">
        <div class="row">
            <div class="col-sm-12">
                <h2 class="title text-center">Разработчик</h2>
            </div>
        </div>
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
                                    <div class="col-sm-6 text-center">
                                        <h2 style="margin-top: 60px">Обучаемость</h2>
                                        <p>Умею быстро и эфективно учится. </p>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/study.png" class="girl img-responsive" alt=""/>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6 text-center">
                                        <h2 style="margin-top: 60px">Стрессоустойчивость</h2>
                                        <p>Багатый опыт работы с разными людьми.</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/cat.png" class="girl img-responsive" alt=""/>
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6 text-center">
                                        <h2 style="margin-top: 60px">Компанейский</h2>
                                        <p>Быстро и легко вписываюсь в коллектив.</p>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/leo.png" class="girl img-responsive" alt=""/>
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
        <div class="row">
            <div class="col-sm-4">
                <div class="contact-info" style="text-align: center">
                    <h2 class="title text-center">Фото</h2>
                    <div class="product-image-wrapper">
                        <div class="single-products">
                            <div class="productinfo text-center">
                                <img src="images/myPhoto1.png" alt=""
                                     style="height: 180px; width: auto; margin: 10px"/>
                            </div>
                            <div class="product-overlay">
                                <div class="overlay-content">
                                    <img src="images/myPhoto.png" alt=""
                                         style="height: 180px; width: auto; margin: 10px"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="contact-form">
                    <h2 class="title text-center">Контакты</h2>
                    <div class="status alert alert-success" style="display: none"></div>
                    <div class="form-group col-md-12">
                        <a type="text" class="form-control" required="required"
                           style="height: auto; margin-top: 10px">Артем Геннадьевич
                            Хиргий</a>
                        <a type="text" class="form-control" required="required"
                           style="height: auto; margin-top: 10px"><i
                                class="fa fa-phone"></i> +38(097)946 89 25</a>
                        <a type="text" class="form-control" required="required"
                           style="height: auto; margin-top: 10px"
                           href="mailto:cmua76@outlook.com"><i class="fa fa-envelope"></i>
                            cmua76@outlook.com</a>
                        <a type="text" class="form-control" required="required"
                           style="height: auto; margin-top: 10px"
                           href="https://www.facebook.com/artem.khirgii"><i class="fa fa-facebook"></i>
                            artem.khirgii</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--/#contact-page-->

<footer id="footer" style="margin-top: 40px"><!--Footer-->
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/manager_contact">Артем Хиргий </a></li>
                            <li><a href="/manager_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
    $("#logout").click(function (event) {
        alert("Выход из акаунта!");
    });
</script>
</body>
</html>
