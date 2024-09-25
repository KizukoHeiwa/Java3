<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/09/2024
  Time: 03:20 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<style>
    input{
        margin: 5px;
    }
</style>
<body>
    <c:url value="/account/login" var="url"/>
    <form action="${url}" method="post">
        <label for="username">Username:</label>
        <input name="username" id="username"><br>
        <label for="password">Password:</label>
        <input name="password" id="password" type="password"><br>
        <button>Login</button>
    </form>
    ${message}
</body>
</html>
