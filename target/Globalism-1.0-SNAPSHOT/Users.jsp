<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 10/14/2020
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@include file="DatabaseConnection.jsp" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم | المستخدمين</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="Users.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="Users.js"></script>

    <script type="text/javascript" src="All.js"></script>

</head>
<body>
<div id="header-d">
    <p>المستخدمين</p>
</div>
<div style="height: 135px;background: white;width: 100%"></div>
<div id="products-container">
    <table>
        <tr id="header-row">
            <td>العملية</td>
            <td>الدور</td>
            <td>رقم الهاتف</td>
            <td>العنوان</td>
            <td>البريد الالكتروني</td>
            <td>الاسم الحقيقي</td>
            <td>اسم المستخدم</td>
            <td>المعرّف</td>
        </tr>
        <%
            int userId = 0;
            Statement statement = null;
            try
            {
                //Get "users"
                String getUsersStatement = "SELECT * FROM customers";
                statement = connection.createStatement();
                ResultSet getUsersResultSet = statement.executeQuery(getUsersStatement);
                int count = -1;
                while(getUsersResultSet.next())
                {
                    userId = getUsersResultSet.getInt("CustomerID");
                    String username = getUsersResultSet.getString("CustomerUserName");
                    String realName = getUsersResultSet.getString("CustomerRealName");
                    String email = getUsersResultSet.getString("CustomerEmail");
                    String address = getUsersResultSet.getString("CustomerAddress");
                    String phone = getUsersResultSet.getString("CustomerPhone");
                    int Admin = getUsersResultSet.getInt("IsAdmin");
                    String isAdmin = Admin == 1?"مشرف":"زبون";
                    count++;
                    %>
        <tr>
            <td>
                <%
                    if(isAdmin.equals("زبون"))
                    {
                %>
                <a onclick="hireAsAdminOnClick(<%=userId%>)">تعيين كمشرف</a>
                <a onclick="deleteOnClick(<%=userId%>)">إزالة</a>
                <%
                    }
                    else
                    {
                        out.print("<div style='width:20px;border: 1.5px solid black;transform: translate(-50%,-50%);position: relative;left: 50%;'></div>");
                    }
                %>

            </td>
            <td><%=isAdmin%></td>
            <td style="font-family: 'Times New Roman'"><%=phone%></td>
            <td><%=address%></td>
            <td><%=email%></td>
            <td><%=realName%></td>
            <td><%=username%></td>
            <td style="font-family: 'Times New Roman'"><%=userId%></td>
        </tr>
        <%
                }
            }
            catch(Exception e)
            {

            }
        %>
    </table>
</div>
<div id="delete-confirm">
    <div id="opacity-box" onclick="cancelDeleting()"></div>
    <div id="confirm-dialogue">
        <p id="confirm-title">هل أنت متأكد من أنك تريد إزالة المستخدم نهائيا؟</p>
        <p id="confirm-crad"><a onclick="cancelDeleting()">الغاء</a><a id="remove">إزالة</a></p>
    </div>
</div>

</body>
</html>

