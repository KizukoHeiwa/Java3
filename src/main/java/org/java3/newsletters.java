package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.java3.dao.NewslettersDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.Newsletters;

import java.io.IOException;

@WebServlet("/newsletters")
public class newsletters extends HttpServlet {
    String username = "";
    UsersDAO usersDAO = new UsersDAO();
    NewslettersDAO newslettersDAO = new NewslettersDAO();
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

        if (usersDAO.selectById(username).isRole()) {
            req.setAttribute("listNewsletters", newslettersDAO.selectAll());
            req.setAttribute("author", new UsersDAO().selectById(username));
            req.getRequestDispatcher("/newsletters.jsp").forward(req, resp);
        }
        else {
            resp.sendRedirect(req.getContextPath() + "/dangNhap");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("update") != null) {
            Newsletters newsletters = newslettersDAO.selectById(req.getParameter("update"));
            newsletters.setEnabled(!newsletters.isEnabled());
            newslettersDAO.update(newsletters);
        }
        resp.sendRedirect(req.getContextPath() + "/newsletters");
    }
}
