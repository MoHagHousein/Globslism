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
<% int oid = 0;%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم | المنتجات</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="DashboardProducts.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="DashboardProducts.js"></script>

    <script type="text/javascript" src="All.js"></script>

</head>
<body>
<div id="header-d">
    <p>المنتجات</p>
    <a href="AddProduct.jsp">إضافة منتج +</a>
</div>
<div style="height: 135px;background: white;width: 100%"></div>
<div id="products-container">
<%
    String username = request.getParameter("username");
    String password  = request.getParameter("password");
    Statement statement = null;
    try
    {
        String sqlStatement = "SELECT * FROM products";
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlStatement);
        while(resultSet.next())
        {
            oid = resultSet.getInt("ProductID");
            String obtainedProductName = resultSet.getString("ProductName");
            String obtainedDescription = resultSet.getString("ProductDescription");
            double obtainedPrice = resultSet.getDouble("ProductPrice");
%>

<div class="product-item">
    <img src="Resources/Images/templatesquare.png">
    <div class="product-details">
    <p class="product-name"><%= obtainedProductName %></p>
    <p class="product-desc"><%= obtainedDescription %></p>
    <p class="product-price"><%= obtainedPrice + " S.P" %></p>
    </div>
    <div class="edit-delete">
        <a href="EditProduct.jsp?id=<%=oid%>">تعديل</a>
        <a onclick="deleteOnClick(<%=oid%>)">حذف</a>
    </div>
</div>
<%
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</div>
<div id="delete-confirm">
    <div id="opacity-box" onclick="cancelDeleting()"></div>
    <div id="confirm-dialogue">
        <p id="confirm-title">هل أنت متأكد من أنك تريد حذف المنتج نهائيا؟</p>
        <p id="confirm-crad"><a onclick="cancelDeleting()">الغاء</a><a id="remove">حذف</a></p>
    </div>
</div>
</body>
</html>
