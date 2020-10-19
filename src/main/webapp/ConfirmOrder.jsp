<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/12/2020
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="DatabaseConnection.jsp" %>
<% String cid = ""; %>
<%
    Cookie[] globalismCookies = request.getCookies();
    if(globalismCookies != null)
    {
        for(Cookie c : globalismCookies)
        {
            if("id".equals(c.getName()))
            {
                cid = c.getValue();
                break;
            }
        }
    }
%>
<%
    Statement statement = null;
    int cartId = 0;
    int productId = 0;
    int amount = 0;
    int orderId = 0;
    try
    {
        //Get CartID for the current signed in customer (cid) from "carts" table
        String sqlGetCartIdStatement = "SELECT CartID From carts WHERE CustomerID=" + cid;
        statement = connection.createStatement();
        ResultSet CartIdResultSet = statement.executeQuery(sqlGetCartIdStatement);
        while(CartIdResultSet.next())
        {
            cartId = CartIdResultSet.getInt("CartID");
        }

        //Insert "CustomerID" Into "orders" table
        String sqlAddCartIdStatement = "INSERT INTO orders (CustomerID) VALUES ('"+ cid +"')";
        PreparedStatement sqlAddCartIdPreparedStatement = connection.prepareStatement(sqlAddCartIdStatement);
        int x = sqlAddCartIdPreparedStatement.executeUpdate();
        if(x > 0)
        {
            //Get current customer "OrderID" from "orders" table
            String sqlGetOrderIdStatement = "SELECT OrderID FROM orders WHERE CustomerID=" + cid;
            statement = connection.createStatement();
            ResultSet orderIdResultSet = statement.executeQuery(sqlGetOrderIdStatement);
            while(orderIdResultSet.next())
            {
                orderId = orderIdResultSet.getInt("OrderID");
            }

            //Get "ProductID" and "Amount" From "cartitems" table belongs to  current "CartID"
            String sqlGetOrderDetailsStatement = "SELECT ProductID, Amount FROM cartitems WHERE CartID=" + cartId;
            statement = connection.createStatement();
            ResultSet orderDetailsResultSet = statement.executeQuery(sqlGetOrderDetailsStatement);
            while(orderDetailsResultSet.next())
            {
                productId = orderDetailsResultSet.getInt("ProductID");
                amount = orderDetailsResultSet.getInt("ProductID");

                //Insert "ProductID" and "Amount" into "orderitems" table
                String sqlAddDetailsStatement = "INSERT INTO orderitems (OrderID,ProductID,Amount) VALUES ('" + orderId + "','" + productId + "','" + amount + "')";
                PreparedStatement addDetailsPreparedStatement = connection.prepareStatement(sqlAddDetailsStatement);
                int x1 = addDetailsPreparedStatement.executeUpdate();
                if(x1 > 0)
                {

                }
                else
                {

                }
            }

            //Delete all items from "cartitems" table where "CartID" is the current
            String sqlDeleteAllInCartItemsStatement = "Delete FROM cartitems WHERE CartID=" + cartId;
            PreparedStatement deleteAllInCartItemsPreparedStatement = connection.prepareStatement(sqlDeleteAllInCartItemsStatement);
            int x2 = deleteAllInCartItemsPreparedStatement.executeUpdate();
            if(x2 > 0)
            {
                //Delete cart for current customer
                String sqlDeleteCartStatement = "DELETE FROM carts WHERE CartID=" + cartId;
                PreparedStatement deleteCartPreparedStatement = connection.prepareStatement(sqlDeleteCartStatement);
                int x3 = deleteCartPreparedStatement.executeUpdate();
                if(x3 > 0)
                {
                    response.sendRedirect("Cart.jsp");
                }
                else
                {

                }
            }
            else
            {

            }
        }
    }
    catch(Exception e)
    {
        out.print("Error: " + e.getMessage());
    }
%>