<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/employee" var="path"/>
	<form action="${path}/upload" method="post" enctype="multipart/form-data">
		<h2>Employee Form</h2>
		<img src="/img/${item.photo}" style="width:80px;height:70px;" /><br>
		ID : <input name="id" value="${item.id}"> <br>
	    Full name : <input name="fullname" value="${item.fullname}"> <br>
	    Password : <input name="password" value="${item.password}"> <br>
	    <fmt:formatDate var = "bd" value="${item.birthday}" pattern="dd-MM-yyyy" /> 
	    Birth Day :<input name="birthday" value="${bd}"> <br>
		Gender :
	    <input type="radio" name="gender" value="true" ${item.gender=='true'?'checked':''}> Nam
	    <input type="radio" name="gender" value="false" ${item.gender=='false'?'checked':''}> Nữ <br>
		DepartmentID : <input name="department_id" value="${item.department_id}"> <br>
	
	    Salary : <input name="salary" value="${item.salary}"> <br>
		Photo 
		<input type="file" name="photo" value="${item.photo}"
			onchange="this.form.submit()"/>
	    <hr>
		<button formaction="${path}/create">Create</button>
		<button formaction="${path}/update">Update</button>
		<button formaction="${path}/delete">Delete</button>
		<button formaction="${path}/reset">Reset</button>
	</form>
	<br>
	<!-- TABLE -->
	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>No.</th>
				<th>Id</th>
				<th>Full Name</th>
				<th>Password</th>
				<th>Gender</th>
				<th>Birthday</th>
				<th>Salary</th>
				<th>Photo</th>
				<th>DepartmentID</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="employee" items="${list}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${employee.id}</td>
					<td>${employee.fullname}</td>
					<td>${employee.password}</td>
					<td>${employee.gender}</td>
					<td>${employee.birthday}</td>
					<td>${employee.salary}</td>
					<td>${employee.photo}</td>
					<td>${employee.department_id}</td>
					<td><a href="${path}/edit/${employee.id}">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table><br>
	${message}
</body>
</html>