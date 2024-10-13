package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.commons.codec.binary.Base64;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.News;
import org.java3.entity.Users;
import org.java3.utils.XDate;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
@MultipartConfig
@WebServlet({"/phongVien",
        "/phongVien/edit",
        "/phongVien/upload",
        "/phongVien/delete"
})
public class phongVien extends HttpServlet {
    String username = "";
    Users user = new Users();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie cookie: cookies) {
                if(cookie.getName().equals("user")) {
                    String encoded = cookie.getValue();
                    byte[] bytes = Base64.decodeBase64(encoded);
                    String[] userInfo = new String(bytes).split(",");
                    username = userInfo[0];
                }
            }
        }

        user = new UsersDAO().selectById(username);

        if (user.isRole()) {
            req.setAttribute("user", new UsersDAO().selectAll());
        }
        else {
            req.setAttribute("user", user);
        }

        req.setAttribute("listNews", new NewsDAO().selectNewsByAuthor(username));
        req.setAttribute("isEdit", false);
        req.setAttribute("listCategories", new CategoriesDAO().selectAll());

        if (req.getParameter("edit") != null){
            req.setAttribute("news", new NewsDAO().selectById(req.getParameter("edit")));
            req.setAttribute("isEdit", true);
        }

        req.getRequestDispatcher("/phongVien.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        NewsDAO newsDAO = new NewsDAO();
        News news = new News();
        if (req.getQueryString().contains("delete")) {
            String id = req.getParameter("delete");
            newsDAO.delete(id);
            resp.sendRedirect(req.getContextPath() + "/phongVien");
        }
        else {
            String date = XDate.toString(new Date(), "yyyyMMddHHmmss");
            news.setTitle(req.getParameter("title"));
            news.setContent(req.getParameter("content"));

//            Collection<Part> ListFiles = req.getParts();
//            Part file = ListFiles.iterator().next();

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

//            if (ListFiles.isEmpty()) {
//                news.setImg("");
//                return;
//            }

            news.setPosted_date(XDate.toDate(date, "yyyyMMddhhmmss"));
            news.setAuthor(req.getParameter("author"));
            news.setCategories_id(req.getParameter("categories"));
            news.setHome(req.getParameter("home") != null);

            if (req.getQueryString().contains("upload")) {
                news.setId(XDate.toString(new Date(), "yyyyMMddHHmmss"));
                news.setView_count(0);

                newsDAO.insert(news);
                resp.sendRedirect(req.getContextPath() + "/phongVien?edit=" + news.getId());
            }
            else if (req.getQueryString().contains("edit")) {
                news.setId(req.getParameter("edit"));
                newsDAO.update(news);
                resp.sendRedirect(req.getContextPath() + "/phongVien?edit=" + news.getId());
            }
        }
    }
}
