package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.Users;

import java.io.IOException;

@WebServlet("/dangNhap")
public class dangNhap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/dangNhap.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsersDAO usersDAO = new UsersDAO();
        String username = req.getParameter("username").replaceAll(" ", "");
        String password = req.getParameter("password").replaceAll(" ", "");
        Users user = usersDAO.selectById(username);
        if (user != null && user.getPassword().equalsIgnoreCase(password)) {
            req.setAttribute("listNews", new NewsDAO().selectNewsByAuthor(username));
            req.setAttribute("author", new UsersDAO().selectById(username));
            req.getRequestDispatcher("/quanTri.jsp").forward(req, resp);
        }
        else {
            req.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
            req.setAttribute("username", username);
            req.getRequestDispatcher("/dangNhap.jsp").forward(req, resp);
        }
    }
}
