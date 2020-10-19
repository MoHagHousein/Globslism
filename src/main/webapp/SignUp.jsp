<html>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>العالمية | إنشاء حساب</title>

    <!-- CSS -->
    <link type="text/css" rel="stylesheet" href="SignUp.css">
    <link type="text/css" rel="stylesheet" href="All.css">
    <link type="text/css" rel="stylesheet" href="fontawesome\css\all.css">
    <link type="text/css" rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- JS -->
    <script type="text/javascript" src="SignUp.js"></script>
    <script type="text/javascript" src="All.js"></script>
</head>
<body>
<%@include file="Header.jsp" %>
<%
    if(cid.equals(""))
    {
%>
<div id="form-container">
    <form method="POST" action="SignUpProcess.jsp" autocomplete="off">
        <p id="sign-up-title">
            إنشاء حساب
        </p>
        <p><input id="inp" class="in" name="username" type="text" placeholder="اسم المستخدم" onkeypress="return submitSign(event)" autofocus></p>
        <p><input class="in" name="realname" type="text" placeholder="الاسم الحقيقي" onkeypress="return submitSign(event)"></p>
        <p><input class="in" name="email" type="text" placeholder="البريد الالكتروني" onkeypress="return submitSign(event)"></p>
        <p><input class="in" name="address" type="text" placeholder="العنوان" onkeypress="return submitSign(event)"></p>
        <p><input class="in" name="phone" maxlength="10" type="text" placeholder="رقم الهاتف" onkeypress="return submitSign(event)"></p>
        <p><input class="in" name="password" maxlength="15" type="text" placeholder="كلمة المرور" onkeypress="return submitSign(event)"></p>
        <p id="error-validation">..البريد الالكتروني غير صحيح</p>
        <p><input name="signup-btn" type="button" value="إنشاء" onclick="validate()"></p>
        <p id="already-have-account">لديك حساب بالفعل؟ <a href="SignIn.jsp">سجّل الدخول</a></p>
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