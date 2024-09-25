<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/09/2024
  Time: 03:28 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add or Minus</title>
</head>
<body>
    <c:url value="/calculate" var="cal"/>
    <form method="post">
        <label>
            Nhập vào số a: <input name="a">
        </label><br>
        <label>
            Nhập vào số b: <input name="b">
        </label><br>
        <button formaction="${cal}/add">+</button>
        <button formaction="${cal}/subtract">-</button>
    </form>
    ${message}
</body>
</html>
