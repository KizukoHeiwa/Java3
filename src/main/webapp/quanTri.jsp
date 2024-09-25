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
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <div class="header d-flex justify-content-between align-items-center bg-primary px-3">
        <a href="/" class="logo"><img src="img/logo.png" alt="" width="100px" class="left m-2"></a>
        <div class="center d-flex justify-content-around">
            <!-- <input type="text" name="search" placeholder="Nhập vào bản tin cần tìm kiếm & chỉnh sửa"> -->
            <a href="#" class="utils">Công cụ quản lý</a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="/" class="signin">Đăng xuất</a>
        </div>
    </div>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/">Trang chủ</a>
            <a href="#">Tin tức</a>
            <a href="#">Loại tin</a>
            <a href="#">Người dùng</a>
            <a href="#">Newsletter</a>
        </div>
    </div>

    <div class="article container text-bg-success" style="padding: 300px;text-align: center;">
        Đây là chức năng cho chức vụ quản trị hoặc phóng viên
    </div>

    <div class="footer container text-bg-primary text-center">
        Welcome <strong>Hoàng Thụy</strong> - Quản trị viên
    </div>
</div>
</body>
</html>