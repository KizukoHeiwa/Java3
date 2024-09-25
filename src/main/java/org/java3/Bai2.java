package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/calculate/add", "/calculate/subtract"})
public class Bai2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", "Nhập vào 2 số và chọn phép tính");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double a = Double.parseDouble(req.getParameter("a"));
        double b = Double.parseDouble(req.getParameter("b"));
        String path = req.getServletPath();
        if (path.endsWith("/add")) {
            req.setAttribute("message", a + " + " + b + " + " + " = " + (a+b));
        }
        else {
            req.setAttribute("message", a + " - " + b + " = " + (a-b));
        }
        req.getRequestDispatcher("/simpleCal.jsp").forward(req, resp);
    }
}
