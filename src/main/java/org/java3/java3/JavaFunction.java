package org.java3.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/JavaFunction")
public class JavaFunction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = new HashMap<>();
        map.put("title", "Tiêu đề bản tin");
        map.put("content", "Nội dung bản tin thường rất dài chỉ giới hạn lại 100 ký tự. Nội dung bản tin thường rất dài chỉ giới hạn lại 100 ký tự. Nội dung bản tin thường rất dài chỉ giới hạn lại 100 ký tự. Nội dung bản tin thường rất dài chỉ giới hạn lại 100 ký tự. Nội dung bản tin thường rất dài chỉ giới hạn lại 100 ký tự. ");
        req.setAttribute("item", map);
        req.getRequestDispatcher("JavaFunction.jsp").forward(req, resp);
    }
}
