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
</head>
<body>
<div class="container">
    <div class="header d-flex justify-content-between align-items-center bg-success px-3">
        <img src="img/logo.png" alt="" width="100px" class="left m-2">
        <div class="center d-flex justify-content-around">
            <input type="text" name="search">
            <a href="#" class="utils">Utilities</a>
        </div>
        <div class="right d-flex justify-content-around">
            <a href="#" class="signin">Đăng nhập</a>
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
            <div class="main bg-primary col-7">
                <h3 class="title">Tiêu đề</h3>
                <p>
                    <img src="img/logo.png" alt="" width="100px" style="float:left">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus laborum laboriosam adipisci temporibus aliquam ab numquam animi cupiditate ipsum! Obcaecati corrupti culpa sint dolorem esse expedita eaque, ad odit quidem!
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Est ducimus nostrum laborum corrupti illum iusto molestiae aut praesentium possimus doloribus cumque animi quas, libero voluptatibus, tempora ad culpa. Magni, molestiae?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui fuga voluptas pariatur! Sapiente, amet perferendis harum magni est quas molestiae accusantium porro sunt, quia iure quis assumenda enim aliquid velit.
                </p>
                <div style="float: right;">Ngày đăng | Tác giả</div>
            </div>
            <div class="aside bg-secondary col-5">
                <a href="" class="aside-news m-2">
                    <div class="row">
                        <div class="news col-3">
                            <img src="img/logo.png" alt="" width="100px">
                        </div>
                        <div class="col-9">
                            <div class="title">
                                Đây là tiêu đề của 5 tin...
                            </div>
                            <div class="desc">
                                Đây là phần mô tả ngắn của tin tức Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                            </div>
                            <div class="upDate">
                                Ngày đăng | Tác giả
                            </div>
                        </div>
                    </div>
                </a>

                <a href="" class="aside-news m-2">
                    <div class="row">
                        <div class="news col-3">
                            <img src="img/logo.png" alt="" width="100px">
                        </div>
                        <div class="col-9">
                            <div class="title">
                                Đây là tiêu đề của 5 tin...
                            </div>
                            <div class="desc">
                                Đây là phần mô tả ngắn của tin tức Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                            </div>
                            <div class="upDate">
                                Ngày đăng | Tác giả
                            </div>
                        </div>
                    </div>
                </a>

                <a href="" class="aside-news m-2">
                    <div class="row">
                        <div class="news col-3">
                            <img src="img/logo.png" alt="" width="100px">
                        </div>
                        <div class="col-9">
                            <div class="title">
                                Đây là tiêu đề của 5 tin...
                            </div>
                            <div class="desc">
                                Đây là phần mô tả ngắn của tin tức Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                            </div>
                            <div class="upDate">
                                Ngày đăng | Tác giả
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="footer container bg-info">
        <div class="row text-center">
            <div class="col-4">
                Đây là cột 1 của footer
            </div>
            <div class="col-4">
                Đây là cột thứ 2
            </div>
            <div class="col-4">
                Đây là cột 3
            </div>
        </div>
    </div>
</div>
</body>
</html>