<%--
Created by IntelliJ IDEA.
User: Admin
Date: 9/16/2024
Time: 8:10 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form Servlet</title>
</head>
<body>
    <form action = "/form/update" method="post">
      <label>Họ tên:</label>
      <input type="text" name="fullname" value="${user.fullname}" ${editable?"":"readonly"}><br>
      <label>Giới tính:</label><br>
      <input type="radio" name="gender" value="true" ${user.gender?"checked":""}>Nam<br>
      <input type="radio" name="gender" value="false" ${!user.gender?"checked":""}>Nữ<br>
      <label>Quốc tịch:</label>
      <select name="nationality">
        <option value="VN" ${user.nationality=="VN"?"selected":""}>Việt Nam</option>
        <option value="USA" ${user.nationality=="USA"?"selected":""}>Mỹ</option>
        <option value="JP" ${user.nationality=="JP"?"selected":""}>Nhật Bản</option>
        <option value="China" ${user.nationality=="CN"?"selected":""}>Trung Quốc</option>
      </select>
      <hr>
      <button ${editable?"":"disabled"}>Tạo</button>
      <button>Update</button>
      <button formmethod="get">Get Data</button>
    </form>
</body>
</html>
