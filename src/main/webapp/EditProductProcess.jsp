<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/5/2020
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<%
    String editId = request.getParameter("id");
    String name = request.getParameter("name");
    String desc = request.getParameter("desc");
    String price = request.getParameter("price");
    try
    {
        String sqlStatement1 = "SELECT * FROM products where ProductName ='" + name + "' AND ProductID!=" + editId;
        Statement statement1 = connection.createStatement();
        ResultSet resultSet = statement1.executeQuery(sqlStatement1);
        int count = 0;
        while(resultSet.next())
        {
            String obtainedName = resultSet.getString("ProductName");
            if(obtainedName != null)
            {
                count++;
                break;
            }
        }
        if(count == 1)
        {
            response.sendRedirect("DashboardProducts.jsp");
        }
        else
        {
            String sqlStatement = "UPDATE products SET ProductName='"+ name +"', ProductDescription='"+ desc +"', ProductPrice="+ price +" WHERE ProductID=" + editId;
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            int x = preparedStatement.executeUpdate();
            if(x > 0)
            {
                response.sendRedirect("DashboardProducts.jsp");
            }
            else
            {
                out.print("Error when trying to update a product, please try again later..");
            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
