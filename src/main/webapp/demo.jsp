<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/09/2024
  Time: 10:17 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Demo</title>
    </head>
    <style>
        input{
            margin: 5px;
        }
    </style>
    <body>
        <h1>ĐĂNG KÝ</h1>
        <form action="<c:url value="/signin"/>" method="post">
            Tên đăng nhập: <input type="text" name="username" value="${param.username}"><br>
            Mật khẩu: <input type="password" name="password" value="${param.password}"><br>
            Giới tính:
            <input type="radio" name="gioiTinh" value="Nam" ${param.gioiTinh == "Nam"? "checked":""}>Nam
            <input type="radio" name="gioiTinh" value="Nữ" ${param.gioiTinh != "Nữ"? "":"checked"}>Nữ<br>
            Đã có gia đình: <input type="checkbox" name="tthn" ${param.tthn != null? "checked":""}><br>
            Quốc tịch:
            <select name="national">
                <option value="VN" ${param.national == "VN"?"selected":""}>Việt Nam</option>
                <option value="USA" ${param.national == "USA"?"selected":""}>Mỹ</option>
                <option value="JPN" ${param.national == "JPN"?"selected":""}>Nhật Bản</option>
            </select><br>
            Sở thích:<br>
            <input type="checkbox" name="soThich" value="Đọc sách" ${soThich.contains("Đọc sách")? "checked":""}>Đọc sách
            <input type="checkbox" name="soThich" value="Vẽ tranh" ${soThich.contains("Vẽ tranh")? "checked":""}>Vẽ tranh
            <input type="checkbox" name="soThich" value="Nấu ăn" ${soThich.contains("Nấu ăn")? "checked":""}>Nấu ăn
            <input type="checkbox" name="soThich" value="Chơi game" ${soThich.contains("Chơi game")? "checked":""}>Chơi game<br>
            <input type="submit" value="Đăng ký" formmethod="post">
        </form><br>
        <p>
            ${output}
        </p>
    </body>
</html>