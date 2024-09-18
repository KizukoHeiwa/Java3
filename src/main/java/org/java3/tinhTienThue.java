package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/tinhTienThue")
public class tinhTienThue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/Thue.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String hoTen = req.getParameter("hoTen");
            String sSoTien = req.getParameter("soTien").trim();
            double soTien = Double.parseDouble(sSoTien);
            Double vat = soTien*0.1;
            req.setAttribute("hoTen", hoTen.toUpperCase());
            req.setAttribute("soTien", soTien);
            req.setAttribute("vat", vat);
        }
        catch (Exception ex) {
            req.setAttribute("error", "Vui lòng nhập đúng định dạng số tiền");
        }
        req.getRequestDispatcher("/Thue.jsp").forward(req, resp);
    }
}