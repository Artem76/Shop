<?xml version="1.0" encoding="cp1251"?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=cp1251" %>
<%@ page import="java.net.URLEncoder" %>
<%--<!DOCTYPE html>--%>

<html lang="ru">
<head>
    <meta charset="cp1251">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="Content-Type" content="text/html; charset=cp1251" \>
    <title>Login | ������.����</title>
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
</head><!--/head-->

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
                        <a href="/"><img src="images/logo.png" alt=""/></a>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

</header><!--/header-->

<section id="form" style="margin: 3%"><!--form-->
    <div class="container">
        <div class="row">
            <c:if test="${param.error ne null}">
                <h2 style="color: red; margin-left: 28%">������ ������� � ��������!</h2>
                <br><br><br>
            </c:if>
            <c:if test="${param.reg ne null}">
                <h2 style="color: greenyellow; margin-left: 9%">����������� ������ �������, ������� ��� ����� �������!</h2>
                <br><br><br>
            </c:if>
            <c:if test="${param.log ne null}">
                <h2 style="color: red; margin-left: 28%">����� ����� ��� ����������!</h2>
                <br><br><br>
            </c:if>
            <div class="col-sm-4 col-sm-offset-1">

                <div class="login-form"><!--login form-->
                    <h2>����</h2>

                    <c:url value="/j_spring_security_check" var="loginUrl" />
                    <form action="${loginUrl}" method="post">
                        <input type="text" placeholder="�����" name="j_login"/>
                        <input type="password" placeholder="������" name="j_password"/>
                        <button type="submit" class="btn btn-default">����</button>
                    </form>
                </div><!--/login form-->
            </div>
            <div class="col-sm-1">
                <h2 class="or">���</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form"><!--sign up form-->
                    <h2>�����������!</h2>
                    <form action="/reg" method="post">
                        <input type="text" placeholder="�����" name="login"/>
                        <input type="password" placeholder="������" name="password1"/>
                        <input type="password" placeholder="��������� ������" name="password2"/>
                        <input type="text" placeholder="�������" name="phone"/>
                        <input type="email" placeholder="Email" name="email"/>
                        <input type="text" placeholder="�����" name="address"/>
                        <button type="submit" class="btn btn-default">������������������</button>
                    </form>
                </div><!--/sign up form-->
            </div>
        </div>
    </div>
</section><!--/form-->


<footer id="footer"><!--Footer-->
    <a href="/">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="companyinfo">
                            <h2><span>������</span>.����</h2>
                            <p href="/">����������� �������� ������ �������� � ��� ����� �������!!!</p>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <div class="col-sm-3">
                            <div class="video-gallery text-center">
                                <a>
                                    <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                        <img src="images/purse.jpg" alt=""/>
                                    </div>
                                    <div class="overlay-icon">
                                        <i style="margin: auto">����</i>
                                    </div>
                                </a>
                                <p>������ ����</p>
                                <h2>������� �� �������</h2>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="video-gallery text-center">
                                <a>
                                    <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                        <img src="images/car.png" alt=""/>
                                    </div>
                                    <div class="overlay-icon">
                                        <i style="margin: auto">��������</i>
                                    </div>
                                </a>
                                <p>������� ��������</p>
                                <h2>������� ����</h2>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <div class="video-gallery text-center">
                                <a>
                                    <div class="iframe-img" style="width: 60px; height: 60px; margin: 0 auto">
                                        <img src="images/kachestvo.png" alt=""/>
                                    </div>
                                    <div class="overlay-icon">
                                        <i style="margin: auto">��������</i>
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
                            <p href="/">�� ��������� � �������.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </a>
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
                <p class="pull-left">Copyright � 2013 E-SHOPPER Inc. All rights reserved.</p>
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
</body>
</html>