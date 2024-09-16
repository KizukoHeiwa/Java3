package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", "Welcome to FPT Polytechnic");

        Map <String, Object> map = new HashMap<>();
        map.put("fullname", "Hoàng Thụy");
        map.put("gender", true);
        map.put("nationality", "Việt Nam");
        req.setAttribute("user", map);

        req.getRequestDispatcher("page.jsp").forward(req, resp);
    }
}
