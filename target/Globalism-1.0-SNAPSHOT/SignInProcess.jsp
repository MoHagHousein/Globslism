<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/21/2020
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<%
    String username = request.getParameter("username");
    String password  = request.getParameter("password");
    Statement statement = null;
    try
    {
        String sqlStatement = "SELECT * FROM customers where CustomerUsername ='" + username + "' AND CustomerPassword ='" + password + "';";
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlStatement);
        int count = 0;
        int obtainedID = 0;
        while(resultSet.next())
        {
            String obtainedUsername = resultSet.getString("CustomerUsername");
            String obtainedPassword = resultSet.getString("CustomerPassword");
            obtainedID = resultSet.getInt("CustomerID");
            if(obtainedUsername != null && obtainedPassword != null)
            {
                count ++;
                break;
            }
        }
        if(count == 1)
        {
            Cookie idCookie = new Cookie("id", String.valueOf(obtainedID));
            idCookie.setMaxAge(60*60*24);
            response.addCookie(idCookie);
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("SignIn.jsp");
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>


