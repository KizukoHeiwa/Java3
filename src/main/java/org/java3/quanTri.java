package org.java3;

import jakarta.servlet.RequestDispatcher;
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
        "/quanTri/upload",
        "/quanTri/delete"
})
public class quanTri extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listCategories", new CategoriesDAO().selectAll());
        req.setAttribute("isEdit", false);

        if (req.getParameter("edit") != null){
            req.setAttribute("news", new NewsDAO().selectById(req.getParameter("edit")));
            req.setAttribute("isEdit", true);
        }

        req.getRequestDispatcher("/quanTri.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NewsDAO newsDAO = new NewsDAO();
        News news = new News();
        if (req.getQueryString().contains("delete")) {
            String id = req.getParameter("delete");
            newsDAO.delete(id);
            resp.sendRedirect(req.getContextPath() + "/quanTri");
        }
        else if (req.getQueryString().contains("upload")) {
            String date = XDate.toString(new Date(), "yyyyMMddHHmmss");

            news.setId(XDate.toString(new Date(), "yyyyMMddHHmmss"));
            news.setTitle(req.getParameter("title"));
            news.setContent(req.getParameter("content"));

//        Collection<Part> ListFiles = req.getParts();
//        Part file = ListFiles.iterator().next();

            Part file = req.getPart("img");

            if (!file.getSubmittedFileName().isEmpty()) {
                String path = "/static/files/" + file.getSubmittedFileName();
                String filename = req.getServletContext().getRealPath(path);
                Path path1 = Paths.get(filename);
                Files.deleteIfExists(path1);
                Files.createDirectories(path1);
                file.write(filename);

                news.setImg(file.getSubmittedFileName());
            }


//        if (ListFiles.isEmpty()) {
//            news.setImg("");
//            return;
//        }

            news.setPosted_date(XDate.toDate(date, "yyyyMMddhhmmss"));
            news.setAuthor(req.getParameter("author"));
            news.setView_count(0);
            news.setCategories_id(req.getParameter("categories"));
            news.setHome(Boolean.parseBoolean(req.getParameter("home")));

            newsDAO.insert(news);
            resp.sendRedirect(req.getContextPath() + "/quanTri?edit=" + news.getId());
        }
        else if (req.getQueryString().contains("edit")) {
            String id = req.getParameter("edit");
            news = newsDAO.selectById(id);

            news.setTitle(req.getParameter("title"));
            news.setContent(req.getParameter("content"));

            Part file = req.getPart("img");

            if (!file.getSubmittedFileName().isEmpty()) {
                String path = "/static/files/" + file.getSubmittedFileName();
                String filename = req.getServletContext().getRealPath(path);
                Path path1 = Paths.get(filename);
                Files.deleteIfExists(path1);
                Files.createDirectories(path1);
                file.write(filename);

                news.setImg(file.getSubmittedFileName());
            }

            news.setPosted_date(XDate.toDate(id, "yyyyMMddhhmmss"));
            news.setAuthor(req.getParameter("author"));
            news.setView_count(0);
            news.setCategories_id(req.getParameter("categories"));
            news.setHome(Boolean.parseBoolean(req.getParameter("home")));

            newsDAO.update(news);
            resp.sendRedirect(req.getContextPath() + "/quanTri?edit=" + news.getId());
        }
    }
}
