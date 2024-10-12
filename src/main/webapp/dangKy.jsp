<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/10/2024
  Time: 10:19 pm
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
            <input type="text" name="search">
            <a href="#" class="utils">Utilities</a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="dangNhap" class="signin"><fmt:message key="menu.signIn"/></a>
            <a href="#" class="signup"><fmt:message key="menu.signUp"/></a>
        </div>
    </div>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/"><fmt:message key="menu.home"/></a>
            <a href="#"><fmt:message key="menu.cultural"/></a>
            <a href="#"><fmt:message key="menu.financial"/></a>
            <a href="#"><fmt:message key="menu.international"/></a>
            <a href="#"><fmt:message key="menu.education"/></a>
            <a href="#"><fmt:message key="menu.sports"/></a>
            <a href="#"><fmt:message key="menu.more"/></a>
        </div>
    </div>

    <div class="article container mt-5 w-25">
        <form action="dangKy" method="post">
            <fieldset class="p-3">
                <legend><fmt:message key="menu.signUp"/></legend>
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input name="username" type="text" class="form-control" id="username" value="${param.username}">
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input name="password" type="password" class="form-control" id="password" value="">
                </div>
                <div class="form-group">
                    <label for="fullname">Họ và tên</label>
                    <input name="fullname" type="text" class="form-control" id="fullname" value="${param.hoTen}">
                </div>
                <div class="form-group">
                    <label for="birthday">Ngày sinh</label>
                    <input name="birthday" type="date" class="form-control" id="birthday" value="${param.birthday}">
                </div>
                <div class="form-group">
                    <label>Giới tính
                        <input name="gender" type="radio" class="form-control" value="${param.gender?"Nam":""}">
                        <input name="gender" type="radio" class="form-control" value="${!param.gender?"Nữ":"Nam"}">
                    </label>
                </div>
                <div class="form-group">
                    <label for="mobile">Số điện thoại</label>
                    <input name="mobile" type="text" class="form-control" id="mobile" value="${param.sdt}">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input name="email" type="email" class="form-control" id="email" value="${param.email}">
                </div>
                <div class="form-group text-danger">
                    <span class="message">${message}</span>
                </div>
                <button formmethod="post" class="m-2">Đăng ký</button>
            </fieldset>
        </form>
    </div>

    <div class="footer container text-bg-primary">
        <div class="row text-center">
            <div class="footerLeft col-8">
                <div class="footerMenu">
                    <h1 class="fMenuTitle">About Me</h1>
                    <ul class="fList">
                        <li class="fListItem"><a href="https://www.facebook.com/profile.php?id=100031183186280">Facebook</a></li>
                        <li class="fListItem"><a href="https://github.com/KizukoHeiwa">Github</a></li>
                        <li class="fListItem"><a href="https://linktr.ee/hthuy7605">Social Media</a></li>
                    </ul>
                </div>

                <div class="footerMenu">
                    <h1 class="fMenuTitle">FPT Edu</h1>
                    <ul class="fList">
                        <li class="fListItem"><a href="https://caodang.fpt.edu.vn/">FPT Polytechnic</a></li>
                        <li class="fListItem"><a href="https://fpt.edu.vn/">More About Us</a></li>
                    </ul>
                </div>
            </div>
            <div class="footerRight col-4">
                <div class="footerRightMenu">
                    <h1 class="fMenuTitle">Keep Contact With Me!</h1>
                    <div class="fMail">
                        <input type="text" placeholder="your@email.com" class="fInput">
                        <button class="fButton">Send!</button>
                    </div>
                </div>
                <div class="footerRightMenu">
                    <span class="copyright">&copy; Hoang Thuy. All rights reserved. 2024</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>