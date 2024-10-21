<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 21/10/2024
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FPT Polytechnic</title>
</head>
<style>
    table, td, th {
        border: 1px solid black;
    }
</style>
<body>
    <form method="post">
        <input type="text" name="maSP" value="${sanPham.maSP}" ${sanPham.maSP!=null?'readonly':''}><br>
        <input type="text" name="tenSP" value="${sanPham.tenSP}"><br>
        <input type="number" name="gia" value="${sanPham.gia}"><br>
        <input type="text" name="loaiSP" value="${sanPham.loaiSP}"><br>
        <br>
        <input type="submit" value="Thêm mới" formaction="/SanPham/them" ${sanPham.maSP!=null?'disabled':''}>
        <input type="submit" value="Cập nhật" formaction="/SanPham?capNhat=${sanPham.maSP}" ${sanPham.maSP==null?'disabled':''}>
        <input type="submit" value="Xóa" formaction="/SanPham?xoa=${sanPham.maSP}" ${sanPham.maSP==null?'disabled':''}>
        <input type="reset" value="Reset">
    </form>
    <form method="get">
        <label for="loaiSP">Lọc theo loại: </label>
        <select name="loaiSP" id="loaiSP">
            <option value="">Tất cả</option>
            <c:forEach items="${listLoai}" var="loai">
                <option value="${loai}" ${param.loaiSP == loai?'selected':''}>${loai}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Lọc">
        <input type="submit" value="Return" formaction="/SanPham">
    </form>

    <table>
        <thead>
            <tr>
                <th>Mã SP</th>
                <th>Tên SP</th>
                <th>Giá SP</th>
                <th>Loại SP</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listSanPham}" var="sanPham">
                <tr>
                    <td>${sanPham.maSP}</td>
                    <td>${sanPham.tenSP}</td>
                    <td>${sanPham.gia}</td>
                    <td>${sanPham.loaiSP}</td>
                    <td><a href="<c:url value="/SanPham?suaDoi=${sanPham.maSP}"/>">Sửa đổi</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    ${message}
</body>
</html>
