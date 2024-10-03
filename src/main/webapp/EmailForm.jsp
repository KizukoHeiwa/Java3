<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03/10/2024
  Time: 10:34 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
</head>
<body>
    <form action="SendEmail" method="post">
        <label for="from">From:</label>
        <input type="text" id="from" name="from" value="${param.from}"><br>
        <label for="to">To:</label>
        <input type="text" id="to" name="to" value="${param.to}"><br>
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" value="${param.subject}"><br>
        <label for="body">Body:</label>
        <textarea id="body" name="body">${param.body}</textarea><br>
        <input type="submit" value="Send">
    </form>
    ${message}
</body>
</html>
