<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=cp1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <h3><a href="/">Интернет магазин.</a></h3>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="groupList" class="nav navbar-nav">
                    <li>
                        <button type="button" id="aut" class="btn btn-default navbar-btn">Авторизация</button>
                    </li>
                    <li>
                        <button type="button" id="reg" class="btn btn-default navbar-btn">Регистрация</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<script>
    $('#aut').click(function () {
        window.location.href = '/ind';
    });
    $('#reg').click(function () {
        window.location.href = '/';
    });
</script>
</body>
</html>
