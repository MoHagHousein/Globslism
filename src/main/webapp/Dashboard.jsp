<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="DatabaseConnection.jsp"%>
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
    if(!cid.equals(""))
    {
        Statement statement = null;
        int isAdmin = 0;
        try
        {
            String selectNameStatement = "SELECT * FROM customers WHERE CustomerID=" + cid;
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(selectNameStatement);
            while(resultSet.next())
            {
                isAdmin = resultSet.getInt("IsAdmin");
            }
            if(isAdmin == 1)
            {
                %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | لوحة التحكم</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="Dashboard.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="Dashboard.js"></script>
    <script type="text/javascript" src="All.js"></script>
</head>
<body>

<div id="container">
    <div id="side-menu">
        <p id="side-logo"><a href="index.jsp">العالميّة</a></p>
        <p>
            <button onclick="productsOnClick()" id="active-side-menu">المنتجات</button>
        </p>
        <p>
            <button onclick="usersOnClick()">المستخدمين</button>
        </p>
        <p>
            <button onclick="ordersOnClick()">الطلبات المعلّقة</button>
        </p>
        <p>
            <button onclick="mainPageOnClick()">الصفحة الرئيسية</button>
        </p>
        <p>
            <button onclick="helpPageOnClick()"> صفحة المساعدة</button>
        </p>
        <p>
            <button onclick="aboutPageOnClick()">صفحة من نحن</button>
        </p>
    </div>
    <div id="frame-container">
        <iframe src="DashboardProducts.jsp" autofocus></iframe>
    </div>
</div>

</body>
</html>
<%
            }
            else
                {
                    response.sendRedirect("index.jsp");
                }
        }
        catch (Exception e)
        {
            out.println(e);
        }
}
else
{
    response.sendRedirect("index.jsp");
}
%>
