<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/4/2020
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<%
    try
    {
        String productIdToDelete = request.getParameter("id");
        String DeleteStatement = "DELETE FROM products WHERE ProductID =" + productIdToDelete;
        PreparedStatement preparedDeleteStatement = connection.prepareStatement(DeleteStatement);
        int x = preparedDeleteStatement.executeUpdate();
        if(x > 0)
        {
            response.sendRedirect("DashboardProducts.jsp");
        }
        else
        {
            out.print("Error: something went wrong when trying to delete this product..");
        }
    }
    catch(Exception e)
    {
        out.print("Error: " + e.getMessage());
    }
%>
