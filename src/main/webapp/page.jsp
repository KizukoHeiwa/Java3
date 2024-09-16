<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/16/2024
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:jsp="http://java.sun.com/JSP/Page">
  <head>
    <title>Sharer Servlet</title>
  </head>
    <body>
      <h1>${message}</h1>
      <h2 id="now">${now}</h2>
      <jsp:include page="user-info.jsp"/>
  </body>
<script>
  // Update the current time every second
  setInterval(function() {
    // document.getElementById("now").innerHTML = new Date().toString();
  }, 1000);
</script>
  </html>
