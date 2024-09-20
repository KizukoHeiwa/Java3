package org.java3.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/JavaCore")
public class JavaCore extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Country> list = List.of(
                new Country("VN", "Việt Nam"),
                new Country("US", "Mỹ"),
                new Country("CN", "China")
        );
        req.setAttribute("countries", list);
        req.getRequestDispatcher("JavaCore.jsp").forward(req, resp);
    }
}
