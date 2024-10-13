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
<%--            <a href="/phongVien" class="utils">Đăng bài viết</a>--%>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="?lang=vi_VN"><fmt:message key="menu.vietnamese"/></a><span>|</span>
            <a href="?lang=en_US"><fmt:message key="menu.english"/></a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="/" class="signin"><fmt:message key="menu.signOut"/></a>
        </div>
    </div>

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

    <c:set var="listNews" scope="session" value="${listNews}"/>
    <c:set var="user" scope="session" value="${user}"/>

    <div class="article container">
        <div class="row">
            <div class="col-9 main">
                <form action="phongVien?${!isEdit?"upload":"edit="}${news.id}" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="author">Người đăng</label>
                        <input name="author" type="text" class="form-control" id="author" value="${isEdit?news.author:user.fullname}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="title">Tiêu đề</label>
                        <input name="title" type="text" class="form-control" id="title" value="${news.title}">
                    </div>
                    <div class="form-group">
                        <label for="anh">Chọn ảnh</label>
                        <input name="img" type="file" class="form-control-file m-2" id="anh"><br>
                        <img src="img/${news.img}" alt="" width="60%">
                    </div>
                    <div class="form-group">
                        <label for="categories">Thể loại</label>
                        <select name="categories" class="form-control" id="categories">
                                <option value="0" selected disabled>Chọn thể loại</option>
                            <c:forEach items="${listCategories}" var="cat">
                                <option value="${cat.id}" ${cat.id == news.categories_id?"selected":""}>${cat.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="content">Chi tiết bản tin</label>
                        <textarea name="content" class="form-control" id="content" rows="18">${news.content}</textarea>
                        <label for="home">Tin đầu</label>
                        <input name="home" type="checkbox" id="home" ${news.home?"checked":""}>
                    </div>
                    <button formmethod="post" class="m-2">${!isEdit?"Đăng bài":"Cập nhật"}</button>
                    <c:if test="${isEdit}">
                        <button formaction="phongVien?delete=${news.id}" class="m-2">Xóa bài</button>
                    </c:if>
                    <button type="reset" class="m-2">Reset</button>
                </form>
            </div>
            <div class="col-3 main">
                <div class="form-group">
                    <label for="searchNews">Search</label>
                    <input type="text" class="form-control" id="searchNews">

                    <div class="title fw-bold">Danh sách tin tức ${user.role?"":"bạn đã đăng"}</div>
                    <c:forEach items="${listNews}" var="news">
                        <a href="phongVien?edit=${news.id}" class="main-news m-2">
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
        Welcome <strong>${user.fullname}</strong> - ${user.role?"Quản trị viên":"Phóng viên"}
    </div>
</div>
</body>
</html>