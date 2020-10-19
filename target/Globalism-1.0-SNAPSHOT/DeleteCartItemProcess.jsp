<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/9/2020
  Time: 12:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<% String cid = ""; %>
<%
    Cookie[] globalismCookies = request.getCookies();
    if (globalismCookies != null) {
        for (Cookie c : globalismCookies) {
            if ("id".equals( c.getName() )) {
                cid = c.getValue();
                break;
            }
        }
    }
%>

<%
    String deleteID = request.getParameter( "id" );
    try {
        String deleteItemStatement = "DELETE FROM cartitems WHERE CartItemID=" + deleteID;
        PreparedStatement preparedStatement = connection.prepareStatement( deleteItemStatement );
        int x1 = preparedStatement.executeUpdate();
        if (x1 > 0) {
            int cartID = 0;
            Statement statement = null;
            String sqlStatement1 = "SELECT * FROM carts WHERE CustomerID=" + cid;
            statement = connection.createStatement();
            ResultSet resultSet1 = statement.executeQuery( sqlStatement1 );
            while (resultSet1.next()) {
                cartID = resultSet1.getInt( "CartID" );
            }

            String sqlStatement2 = "SELECT * FROM cartitems WHERE CartID=" + cartID;
            statement = connection.createStatement();
            ResultSet resultSet2 = statement.executeQuery( sqlStatement2 );
            int count1 = 0;
            while (resultSet2.next()) {
                count1++;
            }
            if (count1 == 0) {
                String sqlAddCartItemStatement = "DELETE FROM carts WHERE CartID=" + cartID;
                PreparedStatement preparedSqlAddCartItemStatement = connection.prepareStatement( sqlAddCartItemStatement );
                int x = preparedSqlAddCartItemStatement.executeUpdate();
                if (x > 0) {

                } else {

                }
            } else {

            }
        } else {

        }
    } catch (Exception e) {
        out.print( e );
    }
%>

<%
%>