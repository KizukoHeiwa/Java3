package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/account/login")
public class Bai1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("message", "Nhập vào username và password");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if(username.equalsIgnoreCase("123") && password.equals("thuy")) {
            req.setAttribute("message", "Đăng nhập thành công!");
        } else {
            req.setAttribute("message", "Sai username hoặc password");
        }
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
