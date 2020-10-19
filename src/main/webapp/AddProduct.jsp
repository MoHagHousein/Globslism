<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/22/2020
  Time: 12:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم | المنتجات | إضافة منتج</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="AddProduct.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="AddProduct.js"></script>

    <script type="text/javascript" src="All.js"></script>

</head>
<body>
<div id="header-d">
    <p>المنتجات | إضافة منتج جديد</p>
    <a href="#"></a>
</div>
<div style="height: 135px;background: white;width: 100%"></div>
<div id="form-container">
    <form method="POST" action="AddProductProcess.jsp" autocomplete="off">
        <p id="sign-up-title">
            إضافة منتج
        </p>
        <p><input class="in" name="name" type="text" placeholder="اسم المنتج" onkeypress="return submitSign(event)" autofocus></p>
        <p><input class="in" name="desc" type="text" placeholder="وصف المنتج" onkeypress="return submitSign(event)"></p>
        <p><input class="in" name="price" type="text" placeholder="سعر المنتج" onkeypress="return submitSign(event)"></p>
        <p id="error-validation">..البريد الالكتروني غير صحيح</p>
        <p><input name="signup-btn" type="button" value="إضافة" onclick="validate()"></p>
    </form>
</div>
</body>
</html>
