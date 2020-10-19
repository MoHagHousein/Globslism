<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/21/2020
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<%
    String username = request.getParameter("username");
    String realName = request.getParameter("realname");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String password  = request.getParameter("password");
    try
    {
        String sqlStatement1 = "SELECT * FROM customers where CustomerUsername ='" + username + "'";
        Statement statement1 = connection.createStatement();
        ResultSet resultSet = statement1.executeQuery(sqlStatement1);
        int count = 0;
        while(resultSet.next())
        {
            String obtainedUsername = resultSet.getString("CustomerUsername");
            if(obtainedUsername != null)
            {
                count++;
                break;
            }
        }
        if(count == 1)
        {
            response.sendRedirect("SignUp.jsp");
        }
        else
        {
            String sqlStatement = "INSERT INTO customers (CustomerUserName, CustomerRealName, CustomerEmail, CustomerAddress, CustomerPhone, CustomerPassword) VALUES (?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, realName);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, address);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, password);
            int x = preparedStatement.executeUpdate();
            if(x > 0)
            {
                response.sendRedirect("SignIn.jsp");
            }
            else
            {
                response.sendRedirect("SignUp.jsp");
            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>