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
    <title>Shop | ������.����</title>
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
                            <li><a href="/contact">����� ������ </a></li>
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
                            <li><a id="logout" href="/logout"><i class="fa fa-lock"></i> �����</a></li>
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
                            <li><a href="/shop">����� ������</a></li>
                            <li class="dropdown"><a>���� ������<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_their_orders_work">� ������</a></li>
                                    <li><a href="/manager_their_orders_closed">�����������</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a>��� ������<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_all_orders_work">� ������</a></li>
                                    <li><a href="/manager_all_orders_closed">�����������</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_search_client">����� �������</a></li>
                            <li class="dropdown"><a>���������<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/manager_product_add">�������� ������</a></li>
                                    <li><a href="/manager_photo_add">�������� ����</a></li>
                                    <li><a href="/manager_product_number_update">����������� ������</a></li>
                                </ul>
                            </li>
                            <li><a <%--href="/message"--%>>���������</a></li>
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
            <h2 style="color: orange; text-align: center">����� �� GMT ${date}.</h2>
            <h2 style="color: orange; text-align: center">������
                <a href="/manager_client?id_client=${id_client}" style="color: orange; text-decoration: underline">${login_client}</a>
                . ��������
                <c:if test="${not empty login_manager}">
                    ${login_manager}
                </c:if>
                <c:if test="${empty login_manager}">
                    ��� �� ��������
                </c:if>
                .</h2>
        </div>
    </div>
</section>

<section id="cart_items">
    <div class="container">
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">������</td>
                    <td class="description"></td>
                    <td class="price">���� �� �������, ���.</td>
                    <td class="quantity">����������, �.</td>
                    <c:if test="${not empty edit}">
                        <td class="description"></td>
                    </c:if>
                    <td class="total">���������, ���.</td>
                    <c:if test="${not empty edit}">
                        <td></td>
                    </c:if>
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
                        <c:if test="${not empty edit}">
                            <form action="/manager_box_update_ord?ord_id=${ord.id}" method="post">
                                <c:if test="${ord.numberProduct <= ord.product.number}">
                                    <td class="cart_quantity" style="vertical-align: middle">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="numberProduct"
                                                   value="${ord.numberProduct}"
                                                   autocomplete="off" size="8" style="margin: 0 auto">
                                        </div>
                                    </td>
                                </c:if>
                                <c:if test="${ord.numberProduct > ord.product.number}">
                                    <td class="cart_quantity" style="vertical-align: middle">
                                        <div class="cart_quantity_button">
                                            <input class="cart_quantity_input" type="text" name="numberProduct"
                                                   value="${ord.numberProduct}"
                                                   autocomplete="off" size="8"
                                                   style="margin: 0 auto; background-color: red">
                                        </div>
                                    </td>
                                </c:if>
                                <td>
                                    <input type="submit" class="btn btn-default update" value="��������"
                                           style="margin: 0 auto">
                                </td>
                            </form>
                        </c:if>
                        <c:if test="${empty edit}">
                            <td>
                                <a class="cart_quantity_input" size="8" style="margin: 0 auto">${ord.numberProduct}</a>
                            </td>
                        </c:if>
                        <td class="cart_total">
                            <fmt:formatNumber var="pr" maxFractionDigits="2" value="${ord.numberProduct*ord.priceOrd}"/>
                            <p class="cart_total_price" style="margin: 0 auto">${pr}</p>
                        </td>
                        <td class="cart_delete">
                            <c:if test="${not empty edit}">
                                <a class="cart_quantity_delete" href="/manager_box_delete_ord?ord_id=${ord.id}"
                                   style="margin: 0 auto"><i
                                        class="fa fa-times"></i></a>
                            </c:if>
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
        <div class="row">
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <label style="margin: 0 auto">���������:</label>
                        <li>${description}</li>
                        <li>����� ��������� <span>${sum} ���.</span></li>
                        <c:if test="${not empty edit}">
                            <c:if test="${empty complete}">
                                <a class="btn btn-default check_out"
                                   href="/manager_box_complete?box_id=${box_id}">���������</a>
                            </c:if>
                            <c:if test="${not empty complete}">
                                <a class="btn btn-default check_out" style="background-color: red">������������
                                    ������</a>
                            </c:if>
                        </c:if>
                        <c:if test="${not empty closed}">
                            <a class="btn btn-default check_out" style="background-color: red">����� ��� ��������</a>
                        </c:if>
                    </ul>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="total_area">
                    <ul>
                        <label style="margin: 0 auto">�������:</label>
                        <li style="margin: 0 auto">${phone}</li>
                        <label style="margin: 0 auto">Email:</label>
                        <li style="margin: 0 auto">${email}</li>
                        <label style="margin: 0 auto">����� ��������:</label>
                        <li style="margin: 0 auto">${address}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section><!--/#do_action-->

<footer id="footer"><!--Footer-->
    <div class="header_top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 ">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="/contact">����� ������ </a></li>
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
                <p class="pull-left">Copyright � 2013 E-Shopper. All rights reserved.</p>
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
        alert("����� �� �������!");
    });
</script>
</body>
</html>
