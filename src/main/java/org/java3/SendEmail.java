package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/newsletters")
public class SendEmail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String from = req.getParameter("from");
            String to = req.getParameter("to");
            String subject = req.getParameter("subject");
            String body = req.getParameter("body");

            Mailer.sendEmail(from, to, subject, body);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("/");
    }
}
