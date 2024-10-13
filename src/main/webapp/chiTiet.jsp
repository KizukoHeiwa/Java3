<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/09/2024
  Time: 10:23 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FPT Polytechnic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <fmt:setLocale value="${(sessionScope.lang == null)?'vi_VN':''}${sessionScope.lang}" scope="request"/>
    <fmt:setBundle basename="global" scope="request"/>
</head>
<body>
<div class="container">
    <div class="header d-flex justify-content-between align-items-center bg-primary px-3">
        <a href="/" class="logo"><img src="img/logo.png" alt="" width="100px" class="left m-2"></a>
<%--        <div class="center d-flex justify-content-around">--%>
<%--            <input type="text" name="search">--%>
<%--            <a href="#" class="utils">Utilities</a>--%>
<%--        </div>--%>
        <div class="right d-flex justify-content-around">
            <a href="?lang=vi_VN"><fmt:message key="menu.vietnamese"/></a><span>|</span>
            <a href="?lang=en_US"><fmt:message key="menu.english"/></a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="dangNhap" class="signin"><fmt:message key="menu.signIn"/></a><span>|</span>
            <a href="dangKy" class="signup"><fmt:message key="menu.signUp"/></a>
        </div>
    </div>

    <div class="menu container">
        <div class="d-flex menu-items justify-content-between">
            <a href="/"><fmt:message key="menu.home"/></a>
            <a href="/?category=VanHoa"><fmt:message key="menu.cultural"/></a>
            <a href="/?category=KinhTe"><fmt:message key="menu.financial"/></a>
            <a href="/?category=TheGioi"><fmt:message key="menu.international"/></a>
            <a href="/?category=GiaoDuc"><fmt:message key="menu.education"/></a>
            <a href="/?category=TheThao"><fmt:message key="menu.sports"/></a>
            <a href="#"><fmt:message key="menu.more"/></a>
        </div>
    </div>

    <div class="article container">
        <div class="row">
            <div class="main col-7">
                <h3 class="title fw-bold">${mainNews.title}</h3>
                <p>
                    <img src="img/${mainNews.img}" alt="" width="200px" style="float:left; margin-right: 15px">
                    ${mainNews.content}
                </p>
                <div style="float: right;">${mainNews.posted_date} | ${mainNews.author}</div>
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
                    <span class="copyright">&copy; Hoang Thuy. All rights reserved. 2024</span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>