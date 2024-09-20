<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/09/2024
  Time: 12:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
  <head>
      <title>Bai 3 - Lab 3</title>
  </head>
  <body>
    <ul>
      <li>Name: <strong>${item.name}</strong></li>
      <li>Price:
        <strong><fmt:formatNumber value="${item.price}" pattern="#,###.00"/> VNĐ</strong>
      </li>
      <li>Date:
        <strong><fmt:formatDate value="${item.date}" pattern="MMM dd, yyyy"/></strong>
      </li>
    </ul>
  </body>
</html>
