<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/09/2024
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Bai 4 - Lab 3</title>
</head>
<body>
  <ul>
    <li>Title: <strong>${fn:toUpperCase(item.title)}</strong></li>
    <li>Content:
      <strong>
        <c:choose>
            <c:when test="${fn:length(item.content) > 100}">
              ${fn:substring(item.content, 0, 100)}...
            </c:when>
            <c:otherwise>${item.content}</c:otherwise>
        </c:choose>
      </strong>
    </li>
  </ul>
</body>
</html>
