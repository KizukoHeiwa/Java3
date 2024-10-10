<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a href="/quanTri" class="utils">Đăng bài viết</a>
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

    <div class="article container">
        <div class="row">
            <div class="col-9 main">
                <form action="quanTri/${!isEdit?"upload":"edit"}" method="post">
                    <div class="form-group">
                        <label for="author">Người đăng</label>
                        <input type="text" class="form-control" id="author" value="${author.fullname}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="title">Tiêu đề</label>
                        <input type="text" class="form-control" id="title" value="${news.title}">
                    </div>
                    <div class="form-group">
                        <label for="img">Chọn ảnh</label>
                        <input type="file" class="form-control-file m-2" id="img">
                        <img src="img/${news.img}" alt="" width="99%">
                    </div>
                    <div class="form-group">
                        <label for="categories">Thể loại</label>
                        <select class="form-control" id="categories">
                            <c:forEach items="${listCategories}" var="cat">
                                <option value="${cat.id}" ${cat.id == news.categories_id?"selected":""}>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="content">Chi tiết bản tin</label>
                        <textarea class="form-control" id="content" rows="18">${news.content}</textarea>
                        <label for="home">Tin đầu</label>
                        <input type="checkbox" id="home" ${news.home?"checked":""}>
                    </div>
                    <button formmethod="post" class="m-2">${!isEdit?"Đăng bài":"Cập nhật"}</button>
                </form>
            </div>
            <div class="col-3 main">
                <div class="form-group">
                    <label for="searchNews">Search</label>
                    <input type="text" class="form-control" id="searchNews">

                    <div class="title fw-bold">Danh sách tin tức bạn đã đăng</div>
                    <c:forEach items="${listNews}" var="news">
                        <a href="quanTri?edit=${news.id}" class="main-news m-2">
                            <div class="row">
                                <div class="col-4">
                                    <img src="img/${news.img}" alt="" width="99%">
                                </div>
                                <div class="col-8">
                                    <div class="title fw-bold">
                                            ${news.title}
                                    </div>
                                    <div class="desc">
                                            ${news.content}
                                    </div>
                                    <div class="upDate fw-bold">
                                            ${news.posted_date} | ${news.author}
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="footer container text-bg-primary text-center">
        Welcome <strong>${author.fullname}</strong> - ${author.role?"Quản trị viên":"Phóng viên"}
    </div>
</div>
</body>
</html>