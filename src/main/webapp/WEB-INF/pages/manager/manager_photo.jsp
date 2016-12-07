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
                            <li><a <%--href="#"--%>><i class="fa fa-user"></i> ${login}</a></li>
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
                            <li class="dropdown"><a>Свои заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_their_orders_work">В работе</a></li>
                                    <li><a href="/manager_their_orders_closed">Выполненные</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a>Все заказы<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_all_orders_work">В работе</a></li>
                                    <li><a href="/manager_all_orders_closed">Выполненные</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_search_client">Поиск клиента</a></li>
                            <li class="dropdown"><a>Продукция<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_product_all">Весь кабель</a></li>
                                    <li><a href="/manager_product_add">Добавить кабель</a></li>
                                    <li><a href="/manager_photo" class="active">Фото</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_message">Отзывы и предложения</a></li>
                            <li><a href="/manager_contact">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="form" style="margin: 0"><!--form-->
    <div class="container">
        <div class="row">
            <c:if test="${not empty data_error}">
                <h2 style="color: red; text-align: center">Ошибочые данные!</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">Удаление не возможно (фото используется)!</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Фото</h2>
            <p></p>
        </div>
    </div>
</section>

<section style="margin-top: 30px">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="left-sidebar">
                    <h2>Добавление</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/manager_photo_add" enctype="multipart/form-data" method="post">
                            <section>
                                <div class="container">
                                    <h4 class="panel-title">
                                        <input type="text" name="name" placeholder="Название фото">
                                        <p></p>
                                        <input type="file" name="file" accept=".png">
                                        <p></p>
                                    </h4>
                                </div>
                            </section>
                            <section>
                                <div class="container">
                                    <input type="submit" class="btn btn-default update" value="Добавить"
                                           style="margin: 0 auto">
                                </div>
                            </section>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">В наличии</h2>
                    <c:forEach items="${photoNames}" var="photoName">
                        <div class="col-sm-2">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="/photo_name/${photoName}" alt=""/>
                                        <h4>${photoName}</h4>
                                        <h4 class="cart_delete" style="margin: auto">
                                            <a class="cart_quantity_delete"
                                               href="/manager_photo_delete?photo_name=${photoName}"
                                               style="margin: 0 auto" title="Удаление"><i class="fa fa-times"></i>
                                            </a>
                                        </h4>
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
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/manager_contact">Артем Хиргий </a></li>
                            <li><a href="/manager_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a>
                            </li>
                            <li><a href="mailto:cmua76@outlook.com"><i
                                    class="fa fa-envelope"></i>
                                cmua76@outlook.com</a></li>
                            <li><a href="https://www.facebook.com/artem.khirgii"><i
                                    class="fa fa-facebook"></i>
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
                                                           href="http://www.themeum.com">Themeum</a></span>
                </p>
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
                            <li><a <%--href="#"--%>><i class="fa fa-user"></i> ${login}</a></li>
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
                            <li><a href="/shop">Íîâûå çàêàçû</a></li>
                            <li class="dropdown"><a>Ñâîè çàêàçû<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_their_orders_work">Â ðàáîòå</a></li>
                                    <li><a href="/manager_their_orders_closed">Âûïîëíåííûå</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a>Âñå çàêàçû<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_all_orders_work">Â ðàáîòå</a></li>
                                    <li><a href="/manager_all_orders_closed">Âûïîëíåííûå</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_search_client">Ïîèñê êëèåíòà</a></li>
                            <li class="dropdown"><a>Ïðîäóêöèÿ<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_product_all">Âåñü êàáåëü</a></li>
                                    <li><a href="/manager_product_add">Äîáàâèòü êàáåëü</a></li>
                                    <li><a href="/manager_photo" class="active">Ôîòî</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_message">Îòçûâû è ïðåäëîæåíèÿ</a></li>
                            <li><a href="/manager_contact">Êîíòàêòû</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="form" style="margin: 0"><!--form-->
    <div class="container">
        <div class="row">
            <c:if test="${not empty data_error}">
                <h2 style="color: red; text-align: center">Îøèáî÷ûå äàííûå!</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">Óäàëåíèå íå âîçìîæíî (ôîòî èñïîëüçóåòñÿ)!</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Ôîòî</h2>
            <p></p>
        </div>
    </div>
</section>

<section style="margin-top: 30px">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="left-sidebar">
                    <h2>Äîáàâëåíèå</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/manager_photo_add" enctype="multipart/form-data" method="post">
                            <section>
                                <div class="container">
                                    <h4 class="panel-title">
                                        <input type="text" name="name" placeholder="Íàçâàíèå ôîòî">
                                        <p></p>
                                        <input type="file" name="file" accept=".png">
                                        <p></p>
                                    </h4>
                                </div>
                            </section>
                            <section>
                                <div class="container">
                                    <input type="submit" class="btn btn-default update" value="Äîáàâèòü"
                                           style="margin: 0 auto">
                                </div>
                            </section>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Â íàëè÷èè</h2>
                    <c:forEach items="${photoNames}" var="photoName">
                        <div class="col-sm-2">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="/photo_name/${photoName}" alt=""/>
                                        <h4>${photoName}</h4>
                                        <h4 class="cart_delete" style="margin: auto">
                                            <a class="cart_quantity_delete"
                                               href="/manager_photo_delete?photo_name=${photoName}"
                                               style="margin: 0 auto" title="Óäàëåíèå"><i class="fa fa-times"></i>
                                            </a>
                                        </h4>
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
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/manager_contact">Àðòåì Õèðãèé </a></li>
                            <li><a href="/manager_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a>
                            </li>
                            <li><a href="mailto:cmua76@outlook.com"><i
                                    class="fa fa-envelope"></i>
                                cmua76@outlook.com</a></li>
                            <li><a href="https://www.facebook.com/artem.khirgii"><i
                                    class="fa fa-facebook"></i>
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
                                                           href="http://www.themeum.com">Themeum</a></span>
                </p>
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
        alert("Âûõîä èç àêàóíòà!");
    });
</script>
</body>
</html>
