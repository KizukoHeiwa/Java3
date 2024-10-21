package org.java3.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.daos.SanPhamDAO;
import org.java3.entities.SanPham;

import java.io.IOException;

@WebServlet("/SanPham")
public class SanPhamServlet extends HttpServlet {
    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listSanPham", sanPhamDAO.selectAll());
        if (req.getQueryString() != null) {
            if (req.getQueryString().contains("suaDoi")) {
                req.setAttribute("sanPham", sanPhamDAO.selectById(req.getParameter("suaDoi")));
            }
            if (req.getQueryString().contains("loaiSP")) {
                req.setAttribute("listSanPham", sanPhamDAO.selectByCategory(req.getParameter("loaiSP")));
            }
        }
        req.getRequestDispatcher("/views/SanPham.jsp").forward(req, resp);
    }
}
