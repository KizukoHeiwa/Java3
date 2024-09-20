package org.java3.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/JavaFormat")
public class JavaFormat extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("name", "iPhone 16 Pro Max 256GB");
        map.put("price", 34990000.123);
        map.put("date", new Date());
        req.setAttribute("item", map);
        req.getRequestDispatcher("JavaFormat.jsp").forward(req,resp);
    }
}
