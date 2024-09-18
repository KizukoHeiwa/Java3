<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 9/17/2024
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
  </head>
  <body>
    <h1>Simple Calculator</h1>
    <form action="/calServlet" method="post">
      <label for="num1">First Number:</label>
      <input type="text" id="num1" name="num1" required><br>
      <label for="num2">Second Number:</label>
      <input type="number" id="num2" name="num2" required><br>
      <label for="operator">Operator:</label>
      <select id="operator" name="operator" required>
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
      </select><br>
      <input type="submit" value="Calculate">
    </form>
    Result: ${result}<br><br>
    Error: ${error}
  </body>
</html>
