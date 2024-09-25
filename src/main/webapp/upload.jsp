<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/09/2024
  Time: 03:49 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload files</title>
</head>
<body>
    <c:url value="/upload" var="url"/>
    <form action="${url}" method="post" enctype="multipart/form-data">
        <input name="file" type="file" multiple><br>
        <button>Upload</button>
    </form>
    ${message}
</body>
</html>
