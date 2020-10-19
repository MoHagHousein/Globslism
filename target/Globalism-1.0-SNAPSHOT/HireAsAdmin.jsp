<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/14/2020
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="DatabaseConnection.jsp" %>
<%
    String idToHire = request.getParameter("id");
    Statement statement = null;
    PreparedStatement preparedStatement = null;

    //Hire user as admin
    try
    {
        String hireStatement = "Update customers SET IsAdmin=1 WHERE CustomerID=" + idToHire;
        preparedStatement = connection.prepareStatement(hireStatement);
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
