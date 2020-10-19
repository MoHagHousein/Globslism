<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/12/2020
  Time: 6:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم | الطلبات المعلّقة</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="Orders.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="Orders.js"></script>

    <script type="text/javascript" src="All.js"></script>

</head>
<body>
<div id="header-d">
    <p>الطلبات المعلّقة</p>
</div>
<div style="height: 135px;background: white;width: 100%"></div>
<div id="products-container">
    <div id="order-container">
        <%
            Statement statement = null;
            int customerId = 0;
            String customerName = "";
            String customerEmail = "";
            String customerAddress = "";
            int customerPhone = 0;
            int orderId = 0;
            int productId = 0;
            int amount = 0;
            String productName = "";
            float productPrice = 0;
            try
            {
                //Get "CustomerID" from "orders" table
                String sqlGetCustomerIdStatement = "SELECT CustomerID, OrderID FROM orders ORDER BY OrderID ASC";
                statement = connection.createStatement();
                ResultSet customerIdResultSet = statement.executeQuery(sqlGetCustomerIdStatement);
                while(customerIdResultSet.next())
                {
                    customerId = customerIdResultSet.getInt("CustomerID");
                    orderId = customerIdResultSet.getInt("OrderID");

                    //Get customer details from "customers" table belong to obtained "CustomerID"
                    String sqlGetCustomerDetailsStatement = "SELECT CustomerRealName, CustomerEmail, CustomerAddress, CustomerPhone FROM customers WHERE CustomerID=" + customerId;
                    statement = connection.createStatement();
                    ResultSet customerDetailsResultSet =  statement.executeQuery(sqlGetCustomerDetailsStatement);
                    while(customerDetailsResultSet.next())
                    {
                        customerName = customerDetailsResultSet.getString("CustomerRealName");
                        customerEmail = customerDetailsResultSet.getString("CustomerEmail");
                        customerAddress = customerDetailsResultSet.getString("CustomerAddress");
                        customerPhone = customerDetailsResultSet.getInt("CustomerPhone");
                        %>
        <div class="order-customer">
            <div class="customer-name customer-detail">الأسم&nbsp;&nbsp;&nbsp;
                <br></abr><span style="opacity: .7"><%=customerName%></span>
            </div>
            <div class="customer-email customer-detail">البريد الالكتروني&nbsp;&nbsp;&nbsp;
                <br><span style="opacity: .7"><%=customerEmail%></span>
            </div>
            <div class="customer-address customer-detail">العنوان&nbsp;&nbsp;&nbsp;
                <br><span style="opacity: .7"><%=customerAddress%></span>
            </div>
            <div class="customer-phone customer-detail">رقم الهاتف&nbsp;&nbsp;&nbsp;
                <br><span style="opacity: .7"><%=customerPhone%></span>
            </div>
        </div>
        <%
                    }
                    //Get "ProductID" from "orderitems" table
                    String sqlGetProductIdStatement = "SELECT ProductID, Amount FROM orderitems WHERE OrderID=" + orderId;
                    statement = connection.createStatement();
                    ResultSet getProductIdResultSet = statement.executeQuery(sqlGetProductIdStatement);
                    int count = 0;
                    while(getProductIdResultSet.next())
                    {
                        productId = getProductIdResultSet.getInt("ProductID");
                        amount = getProductIdResultSet.getInt("Amount");

                        //Get product details from products belong to obtained "ProductID"
                        String sqlGetProductDetailsStatement = "SELECT ProductName, ProductPrice FROM products WHERE ProductID=" + productId;
                        statement = connection.createStatement();
                        ResultSet getProductDetailsResultSet = statement.executeQuery(sqlGetProductDetailsStatement);
                        while(getProductDetailsResultSet.next())
                        {
                            productName = getProductDetailsResultSet.getString("ProductName");
                            productPrice = getProductDetailsResultSet.getFloat("ProductPrice");
                            count += productPrice*amount;
                            %>
        <div class="order-items-container">
            <div class="order-item">
                <div class="product-name product-detail">اسم المنتج&nbsp;&nbsp;&nbsp;
                    <span style="color: #4cd137;"><%=productName%></span>
                </div>
                <div class="product-amount product-detail">الكمية&nbsp;&nbsp;&nbsp;
                    <span style="color: #4cd137;"> <%=amount%></span>
                </div>
                <div class="product-price product-detail">سعر المنتج&nbsp;&nbsp;&nbsp;
                    <span style="color: #4cd137;"><%=productPrice*amount%></span>
                </div>
            </div>
        </div>
        <%
                        }
                    }
                    %>
        <div class="order-result">
            <a href="FinishOrder.jsp?oid=<%=orderId%>">تم التسليم</a>
            <div class="total">المجموع النهائي&nbsp;&nbsp;&nbsp;
                <%=count%>
            </div>
        </div>
        <div style="height: 30px;width: 100%;"></div>
        <%
                }
            }
            catch(Exception e)
            {
                out.print(e.getMessage());
            }
        %>
    </div>
</div>
</body>
</html>
