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
                                    <li><a href="/manager_product_all" class="active">Весь кабель</a></li>
                                    <li><a href="/manager_product_add">Добавить кабель</a></li>
                                    <li><a href="/manager_photo">Фото</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_message">Отзывы и предложения</a></li>
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
                <h2 style="color: red; text-align: center">Ошибочые данные</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">Удаление не возможно (кабель в заказе)</h2>
            </c:if>
            <c:if test="${not empty update}">
                <h2 style="color: greenyellow; text-align: center">Данные успешно изменены</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Весь кабель</h2>
        </div>
    </div>
</section>

<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="left-sidebar">
                    <h2>Фильтр</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/manager_product_all_filter" method="post">
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
                <div id="cart_items">
                    <div class="table-responsive cart_info">
                        <table class="table table-condensed">
                            <thead>
                            <tr class="cart_menu">
                                <td class="image">Кабель</td>
                                <td class="description"></td>
                                <td class="price">Цена за единицу, грн.</td>
                                <td class="quantity">Количество, м.</td>
                                <td class="description"></td>
                                <td class="quantity">Описание</td>
                                <td style="width: 38px"></td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${products}" var="product">
                                <tr>
                                    <td class="cart_product">
                                        <a><img src="/photo/${product.photo.id}" alt=""
                                                style="height: 40px; width: 40px; margin: 0 auto"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4>
                                            <a style="margin: 0 auto">${product.type}${product.numberOfWires}x${product.area}</a>
                                        </h4>
                                    </td>
                                    <form action="/manager_product_update?product_id=${product.id}" method="post">
                                        <td class="cart_quantity" style="vertical-align: middle">
                                            <div class="cart_quantity_button">
                                                <input class="cart_quantity_input" type="text" name="product_price"
                                                       value="${product.price}"
                                                       autocomplete="off" size="8" style="margin: 0 auto">
                                            </div>
                                        </td>
                                        <td class="cart_quantity" style="vertical-align: middle">
                                            <div class="cart_quantity_button">
                                                <input class="cart_quantity_input" type="text" name="product_number"
                                                       value="${product.number}"
                                                       autocomplete="off" size="8" style="margin: 0 auto">
                                            </div>
                                        </td>
                                        <td>
                                            <input type="submit" class="btn btn-default update" value="Обновить"
                                                   style="margin: 0 auto">
                                        </td>
                                    </form>
                                    <td class="cart_description">
                                        <h4>
                                            <a style="margin: 0 auto">${product.description}</a>
                                        </h4>
                                    </td>
                                    <td class="cart_delete" <%--style="alignment: left"--%>>
                                        <a class="cart_quantity_delete"
                                           href="/manager_product_delete?product_id=${product.id}"
                                           style="margin: 0 auto"><i
                                                class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#cart_items-->

<footer id="footer"><!--Footer-->
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
    $("#logout").click(function (event) {
        alert("Выход из акаунта!");
    });
</script>
</body>
</html>
