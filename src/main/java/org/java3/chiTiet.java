package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.NewsDAO;

import java.io.IOException;

@WebServlet("/chiTiet")
public class chiTiet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("mainNews", new NewsDAO().selectById(req.getParameter("id")));
        req.setAttribute("listTopViewNews", new NewsDAO().selectTopViewNews());
        req.setAttribute("listLatestNews", new NewsDAO().selectLatestNews());
        req.getRequestDispatcher("/chiTiet.jsp").forward(req, resp);
    }
}
