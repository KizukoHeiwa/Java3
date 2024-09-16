package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Date;

@WebServlet("/sharerServlet")
public class SharerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "Welcome to FPT Polytechnic");
        request.setAttribute("now", new Date());
        request.getRequestDispatcher("page.jsp").forward(request, response);
    }
}
