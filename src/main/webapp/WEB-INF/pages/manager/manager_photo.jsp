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
                                    <li><a href="/manager_product_all">���� ������</a></li>
                                    <li><a href="/manager_product_add">�������� ������</a></li>
                                    <li><a href="/manager_photo" class="active">����</a></li>
                                </ul>
                            </li>
                            <li><a href="/manager_message">������ � �����������</a></li>
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
                <h2 style="color: red; text-align: center">�������� ������!</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">�������� �� �������� (���� ������������)!</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">����</h2>
            <p></p>
        </div>
    </div>
</section>

<section style="margin-top: 30px">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="left-sidebar">
                    <h2>����������</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/manager_photo_add" enctype="multipart/form-data" method="post">
                            <section>
                                <div class="container">
                                    <h4 class="panel-title">
                                        <input type="text" name="name" placeholder="�������� ����">
                                        <p></p>
                                        <input type="file" name="file" accept=".png">
                                        <p></p>
                                    </h4>
                                </div>
                            </section>
                            <section>
                                <div class="container">
                                    <input type="submit" class="btn btn-default update" value="��������"
                                           style="margin: 0 auto">
                                </div>
                            </section>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-8 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">� �������</h2>
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
                                               style="margin: 0 auto" title="��������"><i class="fa fa-times"></i>
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
                            <li><a href="/contact">����� ������ </a></li>
                            <li><a href="/contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a>
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
                <p class="pull-left">Copyright � 2013 E-Shopper. All rights reserved.</p>
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
        alert("����� �� �������!");
    });
</script>
</body>
</html>
