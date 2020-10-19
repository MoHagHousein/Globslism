<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/13/2020
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="DatabaseConnection.jsp" %>
<%
    String orderId = request.getParameter("oid");

    //Delete order from "orders" table
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    try
    {
        String deleteOrderStatement = "DELETE FROM orders WHERE OrderID=" + orderId;
        preparedStatement = connection.prepareStatement(deleteOrderStatement);
        int x1 = preparedStatement.executeUpdate();
        if(x1 > 0)
        {
            String deleteOrderItemsStatement = "DELETE FROM orderitems WHERE OrderID=" + orderId;
            preparedStatement = connection.prepareStatement(deleteOrderItemsStatement);
            int x2 = preparedStatement.executeUpdate();
            if(x2 > 0)
            {
                response.sendRedirect("Orders.jsp");
            }
            else
            {

            }
        }
        else
        {

        }

    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>
