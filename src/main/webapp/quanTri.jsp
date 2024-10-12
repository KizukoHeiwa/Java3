<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/09/2024
  Time: 11:50 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style><%@include file="css/style.css"%></style>
    <fmt:setLocale value="${(sessionScope.lang == null)?'vi_VN':''}${sessionScope.lang}" scope="request"/>
    <fmt:setBundle basename="global" scope="request"/>
</head>
<body>
<div class="container">
    <div class="header d-flex justify-content-between align-items-center bg-primary px-3">
        <a href="/" class="logo"><img src="img/logo.png" alt="" width="100px" class="left m-2"></a>
        <div class="center d-flex justify-content-around">
            <!-- <input type="text" name="search" placeholder="Nhập vào bản tin cần tìm kiếm & chỉnh sửa"> -->
            <a href="/quanTri" class="utils">Đăng bài viết</a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="/" class="signin"><fmt:message key="menu.signOut"/></a>
        </div>
    </div>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/"><fmt:message key="menu.home"/></a>
            <a href="#">Tin tức</a>
            <a href="#">Loại tin</a>
            <a href="#">Người dùng</a>
            <a href="#">Newsletter</a>
        </div>
    </div>

    <div class="article container mt-5 w-75">
        <table>
            <thead>
            <tr>
                <td>Username</td>
                <td>Họ và tên</td>
                <td>Ngày sinh</td>
                <td>Giới tính</td>
                <td>Số điện thoại</td>
                <td>Email</td>
                <td>Thao tác</td>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.fullname}</td>
                    <td>${user.birthday}</td>
                    <td>${user.gender?"Nam":"Nữ"}</td>
                    <td>${user.mobile}</td>
                    <td>${user.email}</td>
                    <td><a href="quanTri?delete=${user.id}">Xóa</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="footer container text-bg-primary text-center">
        Welcome <strong>${author.fullname}</strong> - ${author.role?"Quản trị viên":"Phóng viên"}
    </div>
</div>
</body>
</html>