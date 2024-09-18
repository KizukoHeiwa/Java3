<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/17/2024
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Tính thuế</title>
  </head>
  <body>
    <form action="${pageContext.request.contextPath}/tinhTienThue" method="post">
        <h2>Tính tiền thuế</h2>
        Họ tên: <input name="hoTen" value="${param.hoTen}"><br>
        Số tiền: <input name="soTien" value="${param.soTien}"><br>
        <input type="submit" value="Tính thuế">
    </form><br><br>
  Chào bạn: ${hoTen}<br>
  Số tiền thuế VAT: ${vat}<br><br>
  Error: ${error}
  </body>
</html>
