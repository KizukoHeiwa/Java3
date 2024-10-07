<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <input type="text" name="search">
            <a href="#" class="utils">Utilities</a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="quanTri" class="signin">Đăng nhập</a>
            <a href="#" class="signup">Đăng ký</a>
        </div>
    </div>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/">Trang chủ</a>
            <a href="#">Văn hóa</a>
            <a href="#">Kinh tế</a>
            <a href="#">Thế giới</a>
            <a href="#">Giáo dục</a>
            <a href="#">Thể thao</a>
            <a href="#">More</a>
        </div>
    </div>

    <div class="article container">
        <div class="row">
            <div class="main col-7">
                <c:forEach items="${listNews}" var="news">
                    <a href="chiTiet?id=${news.id}" class="main-news m-2">
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
            <div class="aside col-5">
                <div class="row">
                    <div class="col-3">
                    </div>
                    <div class="col-9">
                        <div class="title fw-bold">Top 5 tin nhiều view nhất</div>
                    </div>
                </div>
                <c:forEach items="${listTopViewNews}" var="news">
                    <a href="chiTiet?id=${news.id}" class="aside-news m-2">
                        <div class="row">
                            <div class="col-3">
                                <img src="img/${news.img}" alt="" width="99%">
                            </div>
                            <div class="col-9">
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
                <div class="row">
                    <div class="col-3">
                    </div>
                    <div class="col-9">
                        <div class="title fw-bold">Top 5 tin mới nhất</div>
                    </div>
                </div>
                <c:forEach items="${listLatestNews}" var="news">
                    <a href="chiTiet?id=${news.id}" class="aside-news m-2">
                        <div class="row">
                            <div class="col-3">
                                <img src="img/${news.img}" alt="" width="99%">
                            </div>
                            <div class="col-9">
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

<%--                <c:forEach items="${listRecentNews}" var="news">--%>
<%--                    <a href="chiTiet?id=${news.id}" class="aside-news m-2">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-3">--%>
<%--                                <img src="img/${news.img}" alt="" width="99%">--%>
<%--                            </div>--%>
<%--                            <div class="col-9">--%>
<%--                                <div class="title fw-bold">--%>
<%--                                        ${news.title}--%>
<%--                                </div>--%>
<%--                                <div class="desc">--%>
<%--                                        ${news.content}--%>
<%--                                </div>--%>
<%--                                <div class="upDate fw-bold">--%>
<%--                                        ${news.posted_date} | ${news.author}--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </c:forEach>--%>
            </div>
        </div>
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
                    <span class="copyright">Hoang Thuy. All rights reserved. 2024</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>