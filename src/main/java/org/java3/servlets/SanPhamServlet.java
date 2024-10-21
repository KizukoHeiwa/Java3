package org.java3.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.daos.SanPhamDAO;
import org.java3.entities.SanPham;

import java.io.IOException;

@WebServlet({"/SanPham", "/SanPham/them"})
public class SanPhamServlet extends HttpServlet {
    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listSanPham", sanPhamDAO.selectAll());
        req.setAttribute("listLoai", sanPhamDAO.selectAllCategories());
        if (req.getQueryString() != null) {
            if (req.getQueryString().contains("suaDoi")) {
                req.setAttribute("sanPham", sanPhamDAO.selectById(req.getParameter("suaDoi")));
            }
            if (req.getQueryString().contains("loaiSP")) {
                if (!req.getParameter("loaiSP").isEmpty()) {
                    req.setAttribute("listSanPham", sanPhamDAO.selectByCategory(req.getParameter("loaiSP")));
                }
                else {
                    resp.sendRedirect("/SanPham");
                    return;
                }
            }
        }
        req.getRequestDispatcher("/views/SanPham.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSP = req.getParameter("maSP");
        String tenSP = req.getParameter("tenSP");
        String gia = req.getParameter("gia");
        String loaiSP = req.getParameter("loaiSP");

        SanPham sanPham = null;
        try {
            sanPham = new SanPham();
            sanPham.setMaSP(maSP);
            sanPham.setTenSP(tenSP);
            sanPham.setGia(Double.parseDouble(gia));
            sanPham.setLoaiSP(loaiSP);
        } catch (NumberFormatException e) {
            req.setAttribute("message", "Bạn đã nhập dữ liệu lỗi!");
            doGet(req, resp);
            return;
        }

        if (req.getRequestURI().contains("them")) {
            try {
                sanPhamDAO.insert(sanPham);
            } catch (Exception e) {
                req.setAttribute("message", "Trùng mã sản phẩm!");
                doGet(req, resp);
                return;
            }
            resp.sendRedirect("/SanPham");
        }
        else if (req.getParameter("capNhat") != null) {
            sanPhamDAO.update(sanPham);
            resp.sendRedirect("/SanPham");
        }
        else if (req.getParameter("xoa") != null) {
            sanPhamDAO.delete(maSP);
            resp.sendRedirect("/SanPham");
        }
    }
}
