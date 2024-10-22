package org.java3.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.java3.daos.UsersDAO;

import java.io.IOException;

@WebServlet("/Users")
public class UsersServlet extends HttpServlet {
    UsersDAO usersDAO = new UsersDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("listUsers", usersDAO.selectAll());
        req.getRequestDispatcher("/views/Users.jsp").forward(req, resp);
    }
}
