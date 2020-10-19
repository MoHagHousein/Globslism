<%@ page import="javax.swing.plaf.nimbus.State" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/14/2020
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="DatabaseConnection.jsp"%>
<%
    String idToDelete = request.getParameter("id");
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    //Delete User
    try
    {
        String deleteUserStatement = "DELETE FROM customers WHERE CustomerID=" + idToDelete;
        preparedStatement = connection.prepareStatement(deleteUserStatement);
        int x = preparedStatement.executeUpdate();
        if(x > 0)
        {
            response.sendRedirect("Users.jsp");
        }
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>
