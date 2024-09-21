<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/09/2024
  Time: 09:52 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Bài tập thêm - Lab 3</title>
</head>
<style>
    table {
        /*width: 100%;*/
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border: 1px solid black;
    }
    a {
        text-decoration: none;
        color: blue;
    }
    a:hover {
        color: red;
    }
    form {
        margin-top: 10px;
    }
</style>
<body>
    <a href="/BaiTapThem/show">Show Products</a>
    <table>
        <thead>
            <tr>
                <td>STT</td>
                <td>Mã</td>
                <td>Tên sản phẩm</td>
                <td>Giá</td>
                <td>Xóa</td>
                <td>Sửa</td>
            </tr>
        </thead>
        <tbody ${show?"":"hidden"}>
            <c:set var="index" value="1" />
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${index}</td>
                    <td>${product.ma}</td>
                    <td>${product.tenSP}</td>
                    <td>${product.gia}</td>
                    <td><a href="delete?id=${product.ma}">Xóa</a></td>
                    <td><a href="edit?id=${product.ma}">Sửa</a></td>
                    <c:set var="index" value="${index + 1}" />
                </tr>
            </c:forEach>
        </tbody>
    </table>
    ${message}
</body>
</html>
