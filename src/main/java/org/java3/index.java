package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.NewsDAO;

import java.io.IOException;

@WebServlet("")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listNews", new NewsDAO().selectAllDesc());
        req.setAttribute("listTopViewNews", new NewsDAO().selectTopViewNews());
        req.setAttribute("listLatestNews", new NewsDAO().selectLatestNews());

        String query = (req.getQueryString() != null ? req.getQueryString() : "");

        if (query.contains("category")) {
            req.setAttribute("listNews", new NewsDAO().selectNewsByCategory(req.getParameter("category")));
        }
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
