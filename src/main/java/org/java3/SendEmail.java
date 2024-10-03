package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("EmailForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message;
        try {
            String from = req.getParameter("from");
            String to = req.getParameter("to");
            String subject = req.getParameter("subject");
            String body = req.getParameter("body");

            Mailer.sendEmail(from, to, subject, body);
            message = "Email from " + from + " to " + to + " successfully sent";
        }
        catch (Exception e) {
            message = "Email sent failed";
        }

        req.setAttribute("message", message);
        req.getRequestDispatcher("EmailForm.jsp").forward(req, resp);
    }
}
