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
//        if (req.getQueryString() != null) {
//            req.setAttribute("sanPham", sanPhamDAO.selectById())
//        }
        System.out.println(req.getQueryString());
        req.getRequestDispatcher("/views/SanPham.jsp").forward(req, resp);
    }
}
