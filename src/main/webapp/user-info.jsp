<%--
Created by IntelliJ IDEA.
User: Admin
Date: 9/16/2024
Time: 7:55 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Info</title>
</head>
<body>
    <b>Thông tin cá nhân</b>
    <ul>
        <li>Họ tên: ${user.fullname}</li>
        <li>Giới tính: ${user.gender?"Nam":"Nữ"}</li>
        <li>Quốc tịch: ${user.nationality}</li>
    </ul>
</body>
</html>
