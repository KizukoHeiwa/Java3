<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Bai 1, 2 - Lab 3</title>
</head>
<style>
    table {
        border-collapse: collapse;
        margin-top: 30px;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    td:hover {background-color: #ddd;}
</style>
<body>
    <label>
        Quốc gia:
        <select name="country">
            <c:forEach var="country" items="${countries}">
                <option value="${country.id}">${country.name}</option>
            </c:forEach>
        </select>
    </label><br>

    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Id</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="ct" items="${countries}" varStatus="vs">
                <tr>
                    <td>${vs.count}</td>
                    <td>${ct.id}</td>
                    <td>${ct.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
