<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/8/2020
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date"%>
<%@ include file="DatabaseConnection.jsp"%>
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
    int cartID = 0;
    String id = request.getParameter("id");
    String amount = request.getParameter("amt");
    Statement statement = null;
    try
    {

        String sqlStatement = "SELECT * FROM carts WHERE CustomerID=" + cid;
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sqlStatement);
        int count = 0;
        while(resultSet.next())
        {
            count++;
        }
        if(count == 1)
        {

        }
        else
        {
            Date d = new Date();
            String currentDate = String.valueOf(d.getDate());
            String sqlAddCartStatement = "INSERT INTO carts (CustomerID, CreationDate) VALUES ('"+ cid +"', '"+ currentDate +"')";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlAddCartStatement);
            int x = preparedStatement.executeUpdate();
            if(x > 0)
            {

            }
            else
            {

            }
        }
        String sqlStatement1 = "SELECT * FROM carts WHERE CustomerID=" + cid;
        statement = connection.createStatement();
        ResultSet resultSet1 = statement.executeQuery(sqlStatement1);
        while(resultSet1.next())
        {
            cartID = resultSet1.getInt("CartID");
        }

        String sqlStatement2 = "SELECT * FROM cartitems WHERE CartID=" + cartID + " AND ProductID=" + id;
        statement = connection.createStatement();
        ResultSet resultSet2 = statement.executeQuery(sqlStatement2);
        int count1 = 0;
        while(resultSet2.next())
        {
            count1++;
        }
        if(count1 == 1)
        {
            out.println("تم إضافة هذا العنصر الى السلة سابقا");
        }
        else
        {
            String sqlAddCartItemStatement = "INSERT INTO cartitems (CartID, ProductID, Amount) VALUES ('" + cartID + "' , '" + id + "', '" + amount + "')";
            PreparedStatement preparedSqlAddCartItemStatement = connection.prepareStatement(sqlAddCartItemStatement);
            int x = preparedSqlAddCartItemStatement.executeUpdate();
            if(x > 0)
            {
                out.print("-");
            }
            else
            {

            }
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
