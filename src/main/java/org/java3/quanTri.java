package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;

import java.io.IOException;

@WebServlet({"/quanTri", "/quanTri/edit"})
public class quanTri extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listNews", new NewsDAO().selectNewsByAuthor("Ngô Tấn An"));
        req.setAttribute("listCategories", new CategoriesDAO().selectAll());
        req.setAttribute("author", new UsersDAO().selectById("20240905083009"));

        if (req.getParameter("edit") != null){
            req.setAttribute("news", new NewsDAO().selectById(req.getParameter("edit")));
        }

        req.getRequestDispatcher("quanTri.jsp").forward(req, resp);
    }
}
