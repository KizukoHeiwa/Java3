package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.News;
import org.java3.utils.XDate;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Date;
@MultipartConfig
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
        String date = XDate.toString(new Date(), "yyyyMMddHHmmss");
        System.out.println(date);
        NewsDAO newsDAO = new NewsDAO();
        News news = new News();
        news.setId(XDate.toString(new Date(), "yyyyMMddHHmmss"));
        news.setTitle(req.getParameter("title"));
        news.setContent(req.getParameter("content"));

//        Collection<Part> ListFiles = req.getParts();
//        Part file = ListFiles.iterator().next();

        Part file = req.getPart("img");

        String path = "/static/files/" + file.getSubmittedFileName();
        String filename = req.getServletContext().getRealPath(path);
        Path path1 = Paths.get(filename);
        Files.deleteIfExists(path1);
        Files.createDirectories(path1);
        file.write(filename);

        news.setImg(file.getSubmittedFileName());

//        if (ListFiles.isEmpty()) {
//            news.setImg("");
//            return;
//        }

        news.setPosted_date(new Timestamp(System.currentTimeMillis()));
        news.setAuthor(req.getParameter("author"));
        news.setView_count(0);
        news.setCategories_id(req.getParameter("categories"));
        news.setHome(Boolean.parseBoolean(req.getParameter("home")));

        System.out.println(news.getTitle() + " - " + news.getImg() + " - " + news.getContent() + " - " + news.getAuthor() + " - " + news.getPosted_date() + " - " + news.getCategories_id());

        newsDAO.insert(news);

        doGet(req, resp);
    }
}
