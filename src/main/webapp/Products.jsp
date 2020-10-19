<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | المنتجات</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="Products.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="Products.js"></script>
    <script type="text/javascript" src="All.js"></script>
</head>
<body>
<%@include  file="Header.jsp" %>
<div style="height: 95.2px;background: white;width: 100%"></div>
<div id="products-container">
    <%
        String username = request.getParameter("username");
        String password  = request.getParameter("password");
        int obtainedProductId = 0;
        Statement statement = null;
        try
        {
            String sqlStatement = "SELECT * FROM products";
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlStatement);
            int indexOfProduct = -1;
            while(resultSet.next())
            {
                obtainedProductId = resultSet.getInt("ProductID");
                String obtainedProductName = resultSet.getString("ProductName");
                String obtainedDescription = resultSet.getString("ProductDescription");
                double obtainedPrice = resultSet.getDouble("ProductPrice");
                indexOfProduct++;
    %>
    <div class="product-item">
        <img src="Resources/Images/templatesquare.png">
        <div class="product-details">
            <p class="product-name"><%= obtainedProductName %></p>
            <p class="product-desc"><%= obtainedDescription %></p>
            <p class="product-price"><%= obtainedPrice + " S.P" %></p>
        </div>
        <div class="edit-delete">
            <a onclick="AddToCart(<%=indexOfProduct%>)">إضافة الى السلة</a>
        </div>
        <input class="add-id" type="hidden" value="<%=obtainedProductId%>">
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
<div id="amount-container">
    <div id="opacity-box" onclick="cancelProductAddition()"></div>
    <div id="confirm-amount-dialogue">
        <p id="product-title">مكنسة كهربائية</p>
        <p id="product-select">اختر الكمية الّتي تناسبك</p>
        <div id="plus-minus-div">
            <div id="minus" onclick="plusAmount();">+</div>
            <div id="amount-display">1</div>
            <div id="plus" onclick="minusAmount();">-</div>
        </div>
        <p id="confirm-crad"><a onclick="cancelProductAddition()">الغاء</a><a onclick="Add()">إضافة</a></p>
    </div>
</div>
<%@include  file="Footer.jsp" %>
</body>
</html>