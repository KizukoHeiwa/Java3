package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.News;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet({"/quanTri",
        "/quanTri/edit",
        "/quanTri/upload"
})
public class quanTri extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listNews", new NewsDAO().selectNewsByAuthor("20240921121534"));
        req.setAttribute("listCategories", new CategoriesDAO().selectAll());
        req.setAttribute("author", new UsersDAO().selectById("20240921121534"));
        req.setAttribute("isEdit", false);

        if (req.getParameter("edit") != null){
            req.setAttribute("news", new NewsDAO().selectById(req.getParameter("edit")));
            req.setAttribute("isEdit", true);
        }

        req.getRequestDispatcher("/quanTri.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now()));
        NewsDAO newsDAO = new NewsDAO();
        News news = new News();
        news.setId(DateTimeFormatter.ofPattern("yyyyMMddHHmmss").format(LocalDateTime.now()));
        news.setTitle(req.getParameter("title"));
        news.setContent(req.getParameter("content"));
        news.setImg(req.getParameter("img"));
        news.setPosted_date(new Date());
        news.setAuthor(req.getParameter("author"));
        news.setView_count(0);
        news.setCategories_id(req.getParameter("categories"));
        news.setHome(Boolean.parseBoolean(req.getParameter("home")));
        newsDAO.insert(news);
    }
}
