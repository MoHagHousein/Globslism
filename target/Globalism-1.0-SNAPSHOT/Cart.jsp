<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/8/2020
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <%@page pageEncoding="UTF-8" %><%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | سلة المشتريات</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="Cart.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="Cart.js"></script>
    <script type="text/javascript" src="All.js"></script>
</head>
<body>
<%@include file="Header.jsp" %>
<%
    if(cid == "")
    {
        response.sendRedirect("index.jsp");
    }
%>
<div id="form-container">
    <form method="POST" action="ConfirmOrder.jsp">
        <p id="Sign-up-title">
            سلة المشتريات
        </p>
        <div id="cart-title">
            <p>المنتج</p>
            <p>السعر</p>
        </div>
        <div id="cart-items-container">
        <%
            Statement statement = null;
            int cartID = 0;
            int productID = 0;
            int cartItemID = 0;
            int amount = 0;
            float subPrice = 0;
            float totalPrice = 1000;
            int indexOfItem = -1;
            try
            {
                String sqlGetCartIDStatement = "SELECT * FROM carts WHERE CustomerID=" + cid;
                statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sqlGetCartIDStatement);
                while(resultSet.next())
                {
                    cartID = resultSet.getInt("CartID");
                }
                String sqlGetProductIDStatement = "SELECT * FROM cartitems WHERE CartID=" + cartID;
                statement = connection.createStatement();
                ResultSet resultSet1 = statement.executeQuery(sqlGetProductIDStatement);
                while(resultSet1.next())
                {
                    productID = resultSet1.getInt("ProductID");
                    amount = resultSet1.getInt("Amount");
                    cartItemID = resultSet1.getInt("CartItemID");
                    String sqlGetProductsStatement = "SELECT * FROM products WHERE ProductID=" + productID;
                    statement = connection.createStatement();
                    ResultSet resultSet2 = statement.executeQuery(sqlGetProductsStatement);
                    while(resultSet2.next())
                    {
                        String productName = resultSet2.getString("ProductName");
                        float productPrice = resultSet2.getFloat("ProductPrice");
                        subPrice = subPrice + productPrice;
                        indexOfItem++;
                        %>
            <div class="cart-item-container">
                <div class="cart-item-details">
                    <div class="product">
                        <img src="Resources/Images/templatesquare.png">
                        <div class="item-details">
                            <p class="item-name"><%=productName%></p>
                            <p class="item-date">توصيل 24 شباط</p>
                        </div>
                    </div>
                    <div class="edit-item-container">
                        <div class="plus" onclick="plusA(<%=indexOfItem%>)">+</div>
                        <div class="amount-display"><%=amount%></div>
                        <div class="minus" onclick="minusA(<%=indexOfItem%>)">-</div>
                    </div>
                    <svg onclick="deleteCartItemOnClick(<%=cartItemID%>, <%=indexOfItem%>)" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" width="512" height="512" x="0" y="0" viewBox="0 0 427 427.00131" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path xmlns="http://www.w3.org/2000/svg" d="m232.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" fill="#ff6b6b" data-original="#000000" style="" class=""/><path xmlns="http://www.w3.org/2000/svg" d="m114.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" fill="#ff6b6b" data-original="#000000" style="" class="delete-icon" value="<%=indexOfItem%>"/><path xmlns="http://www.w3.org/2000/svg" d="m28.398438 127.121094v246.378906c0 14.5625 5.339843 28.238281 14.667968 38.050781 9.285156 9.839844 22.207032 15.425781 35.730469 15.449219h189.203125c13.527344-.023438 26.449219-5.609375 35.730469-15.449219 9.328125-9.8125 14.667969-23.488281 14.667969-38.050781v-246.378906c18.542968-4.921875 30.558593-22.835938 28.078124-41.863282-2.484374-19.023437-18.691406-33.253906-37.878906-33.257812h-51.199218v-12.5c.058593-10.511719-4.097657-20.605469-11.539063-28.03125-7.441406-7.421875-17.550781-11.5546875-28.0625-11.46875h-88.796875c-10.511719-.0859375-20.621094 4.046875-28.0625 11.46875-7.441406 7.425781-11.597656 17.519531-11.539062 28.03125v12.5h-51.199219c-19.1875.003906-35.394531 14.234375-37.878907 33.257812-2.480468 19.027344 9.535157 36.941407 28.078126 41.863282zm239.601562 279.878906h-189.203125c-17.097656 0-30.398437-14.6875-30.398437-33.5v-245.5h250v245.5c0 18.8125-13.300782 33.5-30.398438 33.5zm-158.601562-367.5c-.066407-5.207031 1.980468-10.21875 5.675781-13.894531 3.691406-3.675781 8.714843-5.695313 13.925781-5.605469h88.796875c5.210937-.089844 10.234375 1.929688 13.925781 5.605469 3.695313 3.671875 5.742188 8.6875 5.675782 13.894531v12.5h-128zm-71.199219 32.5h270.398437c9.941406 0 18 8.058594 18 18s-8.058594 18-18 18h-270.398437c-9.941407 0-18-8.058594-18-18s8.058593-18 18-18zm0 0" fill="#ff6b6b" data-original="#000000" style="" class=""/><path xmlns="http://www.w3.org/2000/svg" d="m173.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" fill="#ff6b6b" data-original="#000000" style="" value="<%=indexOfItem%>"/></g></svg>
                    <div class="price-container">
                        <%=productPrice*amount%> SP
                    </div>
                </div>
            </div>

        <%
                    }
                }
            }
            catch (Exception e)
            {

            }
        %>
        </div>
        <%
            if(indexOfItem == -1)
            {
                %>
        <embed id="empty-cart-icon" src="Resources/Vectors/empty-cart.svg">
        <p id="empty-cart-p">سلة مشترياتك فارغة, <a href="Products.jsp">قم بتعبئتها</a></p>
        <%
            }
            else
            {
        %>
        <div id="subtotal">
            <p>المجموع الجزئي</p>
            <p><%=subPrice%> SP</p>
        </div>
        <div id="shipping">
            <p>الشحن</p>
            <p>1000.0 SP</p>
        </div>
        <div id="total-price">
            <p>المجموع الكلي</p>
            <p><%=totalPrice+subPrice%> SP</p>
        </div>
        <div id="submit-order">
            <button type="submit">تأكيد الطلب</button>
        </div>
        <div id="order-more">
            <a href="Products.jsp">..طلب المزيد</a>
        </div>
        <%}%>
    </form>
</div>
<%@include file="Footer.jsp" %>
</body>
</html>
