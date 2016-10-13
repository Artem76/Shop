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
                                    <li><a href="/manager_product_add" class="active">Добавить кабель</a></li>
                                    <li><a href="/manager_photo">Фото</a></li>
                                </ul>
                            </li>
                            <li><a <%--href="/message"--%>>Сообщения</a></li>
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
                <h2 style="color: red; text-align: center">Ошибочые данные.</h2>
            </c:if>
            <c:if test="${not empty type_erorr}">
                <h2 style="color: red; text-align: center">Такой кабель уже существует.</h2>
            </c:if>
            <c:if test="${not empty add}">
                <h2 style="color: greenyellow; text-align: center">Кабель успешно добавлен.</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Добавление кабеля.</h2>
        </div>
    </div>
</section>

<form action="/manager_product_add_post" method="post">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="type_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                    Введите тип кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="numberOfWires_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#numberOfWires">
                                    Введите количество жил кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="area_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                    Введите площадь поперечного сечения жили кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="price_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                    Введите стоимость кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="number_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                    Введите количество кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: orange; color: white">
                            <h4 class="panel-title">
                                <input type="text" name="description_cable">
                                <a data-toggle="collapse" data-parent="#accordian" href="#area">
                                    Введите описание кабеля
                                </a>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="cart_items">
        <div class="container">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu" style="text-align: center">
                        <td></td>
                        <td class="image">Фото</td>
                        <td class="description">Название</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr style="text-align: center">
                        <td class="cart_description">
                            <input type="radio" name="photo_name"
                                   value="" checked>
                        </td>
                        <td class="cart_description">
                            <h4>
                                <a style="margin: 0 auto">Ничего не выбрано!!!</a>
                            </h4>
                        </td>
                        <td class="cart_description">
                        </td>
                    </tr>
                    <c:forEach items="${photoNames}" var="name">
                        <tr style="text-align: center">
                            <td class="cart_description">
                                <input type="radio" name="photo_name"
                                       value="${name}">
                            </td>
                            <td class="cart_product">
                                <a><img src="/photo_name/${name}" alt=""
                                        style="height: 40px; width: 40px; margin: 0 auto"></a>
                            </td>
                            <td class="cart_description">
                                <h4>
                                    <a style="margin: 0 auto">${name}</a>
                                </h4>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <input type="submit" class="btn btn-default update" value="Добавить"
                   style="margin: 0 auto">
        </div>
    </section>
</form>

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
