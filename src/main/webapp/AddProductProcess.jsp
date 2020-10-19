<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/22/2020
  Time: 3:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<%
    String name = request.getParameter("name");
    String desc = request.getParameter("desc");
    String price = request.getParameter("price");
    try
    {
        String sqlStatement1 = "SELECT * FROM products where ProductName ='" + name + "'";
        Statement statement1 = connection.createStatement();
        ResultSet resultSet = statement1.executeQuery(sqlStatement1);
        int count = 0;
        while(resultSet.next())
        {
            String obtainedname = resultSet.getString("ProductName");
            if(obtainedname != null)
            {
                count++;
                break;
            }
        }
        if(count == 1)
        {
            response.sendRedirect("AddProduct.jsp");
        }
        else
        {
            String sqlStatement = "INSERT INTO products (ProductName, ProductDescription, ProductPrice) VALUES (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, desc);
            preparedStatement.setString(3, price);
            int x = preparedStatement.executeUpdate();
            if(x > 0)
            {
                response.sendRedirect("AddProduct.jsp");
            }
            else
            {
                response.sendRedirect("AddProduct.jsp");
            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>