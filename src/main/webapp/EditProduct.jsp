<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/5/2020
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم | المنتجات | تعديل منتج</title>

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
    <p>المنتجات | تعديل منتج</p>
    <a href="#"></a>
</div>
<div style="height: 135px;background: white;width: 100%"></div>
<%String editId = request.getParameter("id");%>
<div id="form-container">
    <form method="POST" action="EditProductProcess.jsp?id=<%=editId%>" autocomplete="off">
        <p id="sign-up-title">
            تعديل منتج
        </p>
        <%
            Statement statement = null;
            try
            {
            String sqlSelectStatement = "SELECT * FROM products WHERE ProductID=" + editId;
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlSelectStatement);
            while (resultSet.next())
            {
            String obtainedProductName = resultSet.getString("ProductName");
            String obtainedProductDescription= resultSet.getString("ProductDescription");
            double obtainedProductPrice = resultSet.getDouble("ProductPrice");
        %>
        <p><input class="in" name="name" type="text" placeholder="اسم المنتج" onkeypress="return submitSign(event)" value="<%=obtainedProductName%>" autofocus></p>
        <p><input class="in" name="desc" type="text" placeholder="وصف المنتج" onkeypress="return submitSign(event)" value="<%=obtainedProductDescription%>"></p>
        <p><input class="in" name="price" type="text" placeholder="سعر المنتج" onkeypress="return submitSign(event)" value="<%=obtainedProductPrice%>"></p>
        <%
            }
            }
            catch (SQLException throwables)
            {
                throwables.printStackTrace();
            }
        %>
        <p id="error-validation">..البريد الالكتروني غير صحيح</p>
        <p><input name="signup-btn" type="button" value="تحديث" onclick="validate()"></p>
    </form>
</div>
</body>
</html>

