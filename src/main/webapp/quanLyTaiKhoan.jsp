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
<%--        <div class="center d-flex justify-content-around">--%>
<%--            <!-- <input type="text" name="search" placeholder="Nhập vào bản tin cần tìm kiếm & chỉnh sửa"> -->--%>
<%--            <a href="/phongVien" class="utils">Đăng bài viết</a>--%>
<%--        </div>--%>
        <div class="right d-flex justify-content-around">
            <a href="?lang=vi_VN"><fmt:message key="menu.vietnamese"/></a><span>|</span>
            <a href="?lang=en_US"><fmt:message key="menu.english"/></a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="/" class="signin"><fmt:message key="menu.signOut"/></a>
        </div>
    </div>

    <c:set var="listNews" scope="session" value="${listNews}"/>
    <c:set var="user" scope="session" value="${user}"/>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/"><fmt:message key="menu.home"/></a>
            <a href="phongVien">Tin tức</a>
            <c:if test="${user.role}">
                <a href="categories">Loại tin</a>
                <a href="quanTri">Người dùng</a>
                <a href="newsletters">Newsletter</a>
            </c:if>
        </div>
    </div>

    <div class="article container mt-5 w-25">
        <form action="qltk" method="post">
            <fieldset class="p-3">
                <legend><fmt:message key="menu.signUp"/></legend>
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input name="username" type="text" class="form-control" id="username" value="${user.id.trim()}">
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input name="password" type="password" class="form-control" id="password" value="">
                </div>
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input name="fullname" type="text" class="form-control" id="fullname" value="${user.fullname}">
                </div>
                <div class="form-group">
                    <label for="birthday">Ngày sinh</label>
                    <input name="birthday" type="date" class="form-control" id="birthday" value="${user.birthday}" pattern="dd/MM/yyyy">
                </div>
                <div class="form-group">
                    <label>Giới tính
                        <input name="gender" type="radio" value="Nam" ${user.gender?"checked":""}>Nam
                        <input name="gender" type="radio" value="Nữ" ${!user.gender?"checked":""}>Nữ
                    </label>
                </div>
                <div class="form-group">
                    <label for="mobile">Số điện thoại</label>
                    <input name="mobile" type="text" class="form-control" id="mobile" value="${user.mobile}">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input name="email" type="email" class="form-control" id="email" value="${user.email}">
                </div>
                <div class="form-group text-danger">
                    <span class="message">${message}</span>
                </div>
                <button formmethod="post" class="m-2">Cập nhật</button>
            </fieldset>
        </form>
    </div>

    <div class="footer container text-bg-primary text-center">
        Welcome <strong>${user.fullname}</strong> - ${user.role?"Quản trị viên":"Phóng viên"}
    </div>
</div>
</body>
</html>