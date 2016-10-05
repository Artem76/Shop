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
                        <a href="/user"><img src="images/logo.png" alt=""/></a>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav">
                            <li><a <%--href="#"--%>><i class="fa fa-user"></i> ${login}</a></li>
                            <li><a href="/user_cart"><i class="fa fa-shopping-cart"></i> �������</a></li>
                            <li><a id="logout" href="/logout"><i class="fa fa-lock"></i> �����</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->
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
                                <h1><span>������</span>.����</h1>
                                <h2>������ ����</h2>
                                <p>�� �������� �������� � ���������������, ��� ��������� ��� ���������� ����� ������
                                    ���� �� �����. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/purse.jpg" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>������</span>.����</h1>
                                <h2>������� ��������</h2>
                                <p>� ����� ������������ �������� ���� �����������, �� ����������� �������� ������ �
                                    ������� ������ ��� ����� ���������� �������. </p>
                            </div>
                            <div class="col-sm-6">
                                <img src="images/car.png" class="girl img-responsive" alt=""/>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-sm-6">
                                <h1><span>������</span>.����</h1>
                                <h2>�������� ��������</h2>
                                <p>�� �������� ������ � ���� �������������� ������� ��������� ����� ��������� �
                                    �������. </p>
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
                    <h2>������</h2>
                    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                        <form action="/user_filter" method="post">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                            ��� ������
                                        </a>
                                    </h4>
                                </div>
                                <div id="type" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="type_cable" value="All"
                                                       checked><a <%--href=""--%>> ��� ����</a></li>
                                            <c:forEach items="${types}" var="type">
                                                <li><input type="radio" name="type_cable"
                                                           value="${type}"><a <%--href=""--%>> ${type}</a></li>
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
                                            ����������� ��� ������
                                        </a>
                                    </h4>
                                </div>
                                <div id="numberOfWires" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="numberOfWires_cable" value="0"
                                                       checked><a <%--href=""--%>> ��� ����</a></li>
                                            <c:forEach items="${numberOfWireses}" var="numberOfWires">
                                                <li><input type="radio" name="numberOfWires_cable"
                                                           value="${numberOfWires}"><a <%--href=""--%>> ${numberOfWires}</a>
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
                                            ������� ����������� ������� ���� ������
                                        </a>
                                    </h4>
                                </div>
                                <div id="area" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
                                            <li><input type="radio" name="area_cable" value="0.0"
                                                       checked><a <%--href=""--%>> ��� ����</a></li>
                                            <c:forEach items="${areas}" var="area">
                                                <li><input type="radio" name="area_cable"
                                                           value="${area}"><a <%--href=""--%>> ${area}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <input type="submit" value="��������� ������"
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
                    <h2 class="title text-center">��������������������� ���������</h2>
                    <c:forEach items="${products}" var="product">
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="images/cable/${product.filePhoto}" alt=""/>
                                        <h2>${product.price} ���.</h2>
                                        <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>${product.price} ���.</h2>
                                            <p>${product.type}${product.numberOfWires}x${product.area}</p>
                                            <p>${product.description}</p>
                                            <a class="btn btn-default add-to-cart" data="${product.id}">
                                                <i class="fa fa-shopping-cart"></i>�������� � �������</a>
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
                        <h2><span>������</span>.����</h2>
                        <p>����������� �������� ������ �������� � ��� ����� �������!!!</p>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a <%--href="#"--%>>
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/purse.jpg" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>����</i>
                                </div>
                            </a>
                            <p>������ ����</p>
                            <h2>������� �� �������</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a <%--href="#"--%>>
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/car.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>��������</i>
                                </div>
                            </a>
                            <p>������� ��������</p>
                            <h2>������� ����</h2>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="video-gallery text-center">
                            <a <%--href="#"--%>>
                                <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                    <img src="images/kachestvo.png" alt=""/>
                                </div>
                                <div class="overlay-icon">
                                    <i style="margin: auto" <%--class="fa fa-play-circle-o"--%>>��������</i>
                                </div>
                            </a>
                            <p>������� ��������</p>
                            <h2>������ ������</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="address">
                        <img src="images/home/map.png" alt=""/>
                        <p>�� ��������� � �������.</p>
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
    $(".btn.btn-default.add-to-cart").click(function () {
        var d = $(this).attr("data");
        $.post("/user_box_add_product", {product_id: d});
        alert("����� �������� � �������!");
    });
    $("#logout").click(function (event) {
        alert("����� �� �������!");
    });
</script>
</body>
</html>
