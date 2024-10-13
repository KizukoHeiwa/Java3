package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.dao.UsersDAO;
import org.java3.entity.Users;
import org.java3.utils.XDate;

import java.io.IOException;

@WebServlet("/dangKy")
public class dangKy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/dangKy.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = new Users();
        user.setId(req.getParameter("username"));
        user.setPassword(req.getParameter("password"));
        user.setFullname(req.getParameter("fullname"));
        user.setBirthday(XDate.toDate(req.getParameter("birthday"), "yyyy-MM-dd"));
        user.setGender(req.getParameter("gender").equals("Nam"));
        user.setMobile(req.getParameter("mobile"));
        user.setEmail(req.getParameter("email"));
        user.setRole(false);

        new UsersDAO().insert(user);
        resp.sendRedirect(req.getContextPath() + "/dangNhap");
    }
}
