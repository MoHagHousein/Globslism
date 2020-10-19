<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 9/21/2020
  Time: 7:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection connection = null;
    request.setCharacterEncoding("UTF-8");
    try {
        Class.forName( "com.mysql.jdbc.Driver" );
        connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/globalism?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "" );
    } catch (Exception e) {
        out.println( "success!" );
    }
%>
