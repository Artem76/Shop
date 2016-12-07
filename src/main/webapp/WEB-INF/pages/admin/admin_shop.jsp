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
                            <li><a href="/admin_contact">Артем Хиргий </a></li>
                            <li><a href="/admin_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
                            <li><a href="/shop" class="active">Главная</a></li>
                            <li><a href="/admin_contact">Контакты</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="form" style="margin: 0%"><!--form-->
    <div class="container">
        <div class="row">
            <c:if test="${not empty data_error}">
                <h2 style="color: red; text-align: center">Данные введены с ошибками!</h2>
            </c:if>
            <c:if test="${not empty reg}">
                <h2 style="color: greenyellow; text-align: center">Регистрация прошла успешно!</h2>
            </c:if>
            <c:if test="${not empty update}">
                <h2 style="color: greenyellow; text-align: center">Изменение пароля прошло успешно!</h2>
            </c:if>
            <c:if test="${not empty log_error}">
                <h2 style="color: red; text-align: center">Такой логин уже существует!</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">Удаление не возможно (менеджер задействован в заказе)!</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Страница администратора!</h2>
        </div>
    </div>
</section>

<section id="form" style="margin: 3%; margin-left: 11%"><!--form-->
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form"><!--login form-->
                    <h2>Регистрация менеджера!</h2>
                    <form action="/admin_reg_manager" method="post">
                        <input type="text" placeholder="Логин" name="login_manager"/>
                        <input type="password" placeholder="Пароль" name="password1"/>
                        <input type="password" placeholder="Повторите пароль" name="password2"/>
                        <button type="submit" class="btn btn-default">Зарегистрировать</button>
                    </form>
                </div><!--/login form-->
            </div>
            <div class="col-sm-1">
                <h2 class="or">ИЛИ</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form"><!--sign up form-->
                    <h2>Изменение пароля менеджера!</h2>
                    <form action="/admin_update_pas_manager" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        Выбор менеджера
                                    </a>
                                </h4>
                            </div>
                            <div id="type" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><input type="radio" name="id_manager" value="0" style="height: auto; width: auto; display: inline-block"
                                                   checked><a> Не выбран</a></li>
                                        <c:forEach items="${customUsers}" var="customUser">
                                            <li><input type="radio" name="id_manager"
                                                       value="${customUser.id}" style="height: auto; width: auto; display: inline-block"><a> ${customUser.login}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <input type="password" placeholder="Пароль" name="password1"/>
                        <input type="password" placeholder="Повторите пароль" name="password2"/>
                        <button type="submit" class="btn btn-default">Изменить</button>
                    </form>
                </div><!--/sign up form-->
            </div>
        </div>
    </div>
</section><!--/form-->

<section style="margin-top: 20px">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Все менеджеры</h2>
                    <c:forEach items="${customUsers}" var="customUser">
                        <div class="col-sm-4" style="margin-top: 15px">
                            <div class="total_area">
                                <ul style="margin-left: -3%">
                                    <li>${customUser.login}</li>
                                    <a class="btn btn-default check_out" href="/admin_delete_manager?id_manager=${customUser.id}">
                                        Удалить
                                    </a>
                                </ul>
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
                            <li><a href="/admin_contact">Артем Хиргий </a></li>
                            <li><a href="/admin_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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

    </div><!--/header_top-->

    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="/"><img src="images/logo.png" alt=""/></a>
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
                            <li><a href="/shop" class="active">Ãëàâíàÿ</a></li>
                            <li><a href="/admin_contact">Êîíòàêòû</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-bottom-->
</header>

<section id="form" style="margin: 0%"><!--form-->
    <div class="container">
        <div class="row">
            <c:if test="${not empty data_error}">
                <h2 style="color: red; text-align: center">Äàííûå ââåäåíû ñ îøèáêàìè!</h2>
            </c:if>
            <c:if test="${not empty reg}">
                <h2 style="color: greenyellow; text-align: center">Ðåãèñòðàöèÿ ïðîøëà óñïåøíî!</h2>
            </c:if>
            <c:if test="${not empty update}">
                <h2 style="color: greenyellow; text-align: center">Èçìåíåíèå ïàðîëÿ ïðîøëî óñïåøíî!</h2>
            </c:if>
            <c:if test="${not empty log_error}">
                <h2 style="color: red; text-align: center">Òàêîé ëîãèí óæå ñóùåñòâóåò!</h2>
            </c:if>
            <c:if test="${not empty del_error}">
                <h2 style="color: red; text-align: center">Óäàëåíèå íå âîçìîæíî (ìåíåäæåð çàäåéñòâîâàí â çàêàçå)!</h2>
            </c:if>
            <h2 style="color: orange; text-align: center">Ñòðàíèöà àäìèíèñòðàòîðà!</h2>
        </div>
    </div>
</section>

<section id="form" style="margin: 3%; margin-left: 11%"><!--form-->
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-1">
                <div class="login-form"><!--login form-->
                    <h2>Ðåãèñòðàöèÿ ìåíåäæåðà!</h2>
                    <form action="/admin_reg_manager" method="post">
                        <input type="text" placeholder="Ëîãèí" name="login_manager"/>
                        <input type="password" placeholder="Ïàðîëü" name="password1"/>
                        <input type="password" placeholder="Ïîâòîðèòå ïàðîëü" name="password2"/>
                        <button type="submit" class="btn btn-default">Çàðåãèñòðèðîâàòü</button>
                    </form>
                </div><!--/login form-->
            </div>
            <div class="col-sm-1">
                <h2 class="or">ÈËÈ</h2>
            </div>
            <div class="col-sm-4">
                <div class="signup-form"><!--sign up form-->
                    <h2>Èçìåíåíèå ïàðîëÿ ìåíåäæåðà!</h2>
                    <form action="/admin_update_pas_manager" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordian" href="#type">
                                        <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                        Âûáîð ìåíåäæåðà
                                    </a>
                                </h4>
                            </div>
                            <div id="type" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul>
                                        <li><input type="radio" name="id_manager" value="0" style="height: auto; width: auto; display: inline-block"
                                                   checked><a> Íå âûáðàí</a></li>
                                        <c:forEach items="${customUsers}" var="customUser">
                                            <li><input type="radio" name="id_manager"
                                                       value="${customUser.id}" style="height: auto; width: auto; display: inline-block"><a> ${customUser.login}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <input type="password" placeholder="Ïàðîëü" name="password1"/>
                        <input type="password" placeholder="Ïîâòîðèòå ïàðîëü" name="password2"/>
                        <button type="submit" class="btn btn-default">Èçìåíèòü</button>
                    </form>
                </div><!--/sign up form-->
            </div>
        </div>
    </div>
</section><!--/form-->

<section style="margin-top: 20px">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Âñå ìåíåäæåðû</h2>
                    <c:forEach items="${customUsers}" var="customUser">
                        <div class="col-sm-4" style="margin-top: 15px">
                            <div class="total_area">
                                <ul style="margin-left: -3%">
                                    <li>${customUser.login}</li>
                                    <a class="btn btn-default check_out" href="/admin_delete_manager?id_manager=${customUser.id}">
                                        Óäàëèòü
                                    </a>
                                </ul>
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
                            <li><a href="/admin_contact">Àðòåì Õèðãèé </a></li>
                            <li><a href="/admin_contact"><i class="fa fa-phone"></i> +38(097)946 89 25</a></li>
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
        alert("Âûõîä èç àêàóíòà!");
    });
</script>
</body>
</html>
