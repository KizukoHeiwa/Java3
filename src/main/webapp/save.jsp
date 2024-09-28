<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/09/2024
  Time: 10:13 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
</head>
<body>
    <c:url value="/save" var="url"/>
    <form action="${url}" method="post">
        <label>
            Họ và tên:
            <input name="fullname">
        </label> <br>
        <label>
            Ngày sinh:
            <input name="birthday">
        </label> <br>
        <label>
            Giới tính
            <input type="radio" name="gender" value="true"> Male
            <input type="radio" name="gender" value="false"> Female <br>
        </label>
        <label>
            Sở thích:
            <input type="checkbox" name="hobbies" value="R"> Reading
            <input type="checkbox" name="hobbies" value="Traveling"> Traveling
            <input type="checkbox" name="hobbies" value="M"> Music <br>
        </label>
        <label>
            Quốc tịch:
            <select name="country">
                <option value="VN">Việt Nam</option>
                <option value="US" selected>United States</option>
            </select>
        </label> <br>
        <label>
            Lương:
            <input name="salary">
        </label> <br>
    <hr>
    <button>Submit</button>
</form>
</body>
</html>
