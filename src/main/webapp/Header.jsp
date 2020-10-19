<%@page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
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
<div id="header">
            <%
                if(!cid.equals(""))
                {
                    Statement statement = null;
                    String obtainedCustomerName = "";
                    int isAdmin = 0;
                    try
                    {
                        String selectNameStatement = "SELECT * FROM customers WHERE CustomerID=" + cid;
                        statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(selectNameStatement);
                        while(resultSet.next())
                        {
                            obtainedCustomerName = resultSet.getString("CustomerUserName");
                            isAdmin = resultSet.getInt("IsAdmin");
                            if(obtainedCustomerName != null)
                            {
            %>
    <div id="signed-in">
        <embed id="user-avatar" src="Resources/Vectors/avatar.svg">
        <div id="user-name-role">
            <p id="user-name"><%=obtainedCustomerName%></p>
            <%
                            break;
                            }
                        }
                        if(isAdmin == 1)
                        {
                            %>
            <p id="user-role">(مشرف) <a href="Dashboard.jsp" style="color: #2f3542;text-decoration: underline;">لوحة التحكم </a></p>
            <%
                        }
                        else
                        {
                            %>
            <p id="user-role">زبون</p>
            <div id="shopping-cart-icon" onclick="cartOnClick()">
                <embed src="Resources/Vectors/shopping-cart.svg" onclick="cartOnClick()">
                <div id="notify-circle"></div>
            </div>
            <%
                        }
                        %>
            <%
                Statement statement1 = null;
                int count = 0;
                try
                {
                    String sqlGetCartIDStatement = "SELECT * FROM carts WHERE CustomerID=" + cid;
                    statement1 = connection.createStatement();
                    ResultSet resultSet1 = statement1.executeQuery(sqlGetCartIDStatement);
                    while(resultSet1.next())
                    {
                        count++;
                    }
                    if(count == 1)
                    {
            %>
            <script>
                document.getElementById("notify-circle").style.display = "block";
            </script>
            <%
                    }
                    else
                    {

                    }
                }
                catch(Exception e)
                {
                    out.println(e);
                }
            %>
            <%
                    }
                    catch (Exception e)
                    {
                        out.println(e);
                    }
            %>
        </div>
        <button onclick="logOut()">تسجيل الخروج</button>
    </div>
        <%
            }
            else
            {
        %>
    <div id="sign-in-up">
        <a href="SignIn.jsp">تسجيل الدخول</a>
        <a href="SignUp.jsp">زبون جديد</a>
    </div>
        <%
            }
        %>

    <div id="menu">
        <a class="header-link" href="About.jsp">من نحن</a>
        <a class="header-link" href="Help.jsp">مساعدة</a>
        <a class="header-link" href="Products.jsp">منتجاتنا</a>
        <a class="header-link" href="index.jsp" id="active-page">الرئيسية</a>
    </div>
    <div id="logo"><a href="index.jsp">العالميّة</a></div>
    <div id="error-message">
        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" version="1.1" width="512" height="512" x="0" y="0" viewBox="0 0 496 496" style="enable-background:new 0 0 512 512" xml:space="preserve" class=""><g><path xmlns="http://www.w3.org/2000/svg" d="m248 8c-132.546875 0-240 107.453125-240 240s107.453125 240 240 240 240-107.453125 240-240-107.453125-240-240-240zm107.480469 347.480469-107.480469-107.480469-107.480469 107.480469 107.480469-107.480469-107.480469-107.480469 107.480469 107.480469 107.480469-107.480469-107.480469 107.480469zm0 0" fill="#ff6b6b36" data-original="#57a4ff" style="" class=""/><g xmlns="http://www.w3.org/2000/svg" fill="#004fac"><path d="m248 0c-136.964844 0-248 111.035156-248 248s111.035156 248 248 248 248-111.035156 248-248c-.160156-136.902344-111.097656-247.839844-248-248zm0 480c-128.128906 0-232-103.871094-232-232s103.871094-232 232-232 232 103.871094 232 232c-.140625 128.070312-103.929688 231.859375-232 232zm0 0" fill="#ff6b6b" data-original="#004fac" style="" class=""/><path d="m361.136719 134.863281c-3.125-3.121093-8.1875-3.121093-11.3125 0l-101.824219 101.824219-101.824219-101.824219c-2.007812-2.078125-4.984375-2.914062-7.78125-2.179687-2.796875.730468-4.980469 2.914062-5.710937 5.710937-.734375 2.796875.101562 5.773438 2.179687 7.78125l101.824219 101.824219-101.824219 101.824219c-2.078125 2.007812-2.914062 4.984375-2.179687 7.78125.730468 2.796875 2.914062 4.980469 5.710937 5.710937 2.796875.734375 5.773438-.101562 7.78125-2.179687l101.824219-101.824219 101.824219 101.824219c3.140625 3.03125 8.128906 2.988281 11.214843-.097657 3.085938-3.085937 3.128907-8.074218.097657-11.214843l-101.824219-101.824219 101.824219-101.824219c3.121093-3.125 3.121093-8.1875 0-11.3125zm0 0" fill="#ff6b6b" data-original="#004fac" style="" class=""/></g></g></svg>
        <p>تم إضافة هذا العنصر الى السلة سابقاً</p>
    </div>
</div>