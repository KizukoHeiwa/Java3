<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/10/2024
  Time: 09:29 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
</head>
<style>
    table, td, th {
        border: 1px solid black;
    }
</style>
<body>
<form method="post">
    <input type="text" name="id" value="${user.id}" ${user.id!=null?'readonly':''} placeholder="ID?"><br>
    <input type="text" name="fullname" value="${user.fullname}" placeholder="Fullname?"><br>
    <input type="password" name="password" value="${user.password}" placeholder="Password?"><br>
    <input type="checkbox" name="admin" ${user.admin?'checked':''}><br>
    <br>
    <input type="submit" value="Thêm mới" formaction="/Users/them" ${user.id!=null?'disabled':''}>
    <input type="submit" value="Cập nhật" formaction="/Users?capNhat=${user.id}" ${user.id==null?'disabled':''}>
    <input type="submit" value="Xóa" formaction="/Users?xoa=${user.id}" ${user.id==null?'disabled':''}>
    <input type="reset" value="Reset">
</form>
<form method="get">
    <label>
        Chọn role:
        <input type="radio" name="admin" value="Admin">
        <input type="radio" name="admin" value="User">
    </label>
    <input type="submit" value="Lọc">
    <input type="submit" value="Return" formaction="/Users">
</form>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Fullname</th>
        <th>Password</th>
        <th>Role</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listUsers}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.fullname}</td>
            <td>${user.password}</td>
            <td>${user.admin}</td>
            <td><a href="<c:url value="/Users?suaDoi=${user.id}"/>">Sửa đổi</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${message}
</body>
</html>
