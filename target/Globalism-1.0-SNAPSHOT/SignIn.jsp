<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>العالمية | تسجيل الدخول</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="SignIn.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="SignIn.js"></script>
    <script type="text/javascript" src="All.js"></script>
</head>
<body>
<%@include file="Header.jsp" %>
<%
    if(cid.equals(""))
    {
%>
<div id="form-container">
    <form method="POST" action="SignInProcess.jsp" autocomplete="off">
        <p id="Sign-up-title">
            تسجيل الدخول
        </p>
        <p><input class="in" name="username" type="text" placeholder="اسم المستخدم" onkeypress="return submitSign(event)" autofocus></p>
        <p><input class="in" name="password" maxlength="15" type="text" placeholder="كلمة المرور" onkeypress="return submitSign(event)"></p>
        <p id="error-validation">..البريد الالكتروني غير صحيح</p>
        <p><input name="signup-btn" type="button" value="دخول" onclick="validate()"></p>
        <p id="already-have-account">ليس لديك حساب؟ <a href="SignUp.jsp">سجّل الآن</a></p>
    </form>
</div>
<%@include file="Footer.jsp"%>
</body>
</html>
<%
    }
    else
    {
        response.sendRedirect("index.jsp");
    }
%>