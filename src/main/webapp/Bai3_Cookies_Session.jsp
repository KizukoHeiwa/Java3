<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/10/2024
  Time: 09:58 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
</head>
<body>
    <form action="/login" method="post">
        <label for="username">Username:</label>
        <input name="username" id="username" value="${username}"> <br>
        <label for="password">Password:</label>
        <input name="password" id="password" value="${password}"> <br>
        <label>
            <input type="checkbox" name="remember-me">Remember me?
        </label>
        <hr>
        <button>Login</button>
    </form>
</body>
</html>
