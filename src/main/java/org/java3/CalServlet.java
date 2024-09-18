package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calServlet")
public class CalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/calculator.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int num1 = Integer.parseInt(req.getParameter("num1"));
            int num2 = Integer.parseInt(req.getParameter("num2"));
            String operator = req.getParameter("operator");

            int result = 0;
            switch (operator) {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if (num2 == 0) {
                        req.setAttribute("error", "Lỗi chia 0");
                    }
                    result = num1 / num2;
                    break;
                default:
                    req.setAttribute("error", "Lỗi cú pháp");
            }

            req.setAttribute("result", result);
        }
        catch (Exception ex) {
            req.setAttribute("error", "Lỗi nhập dữ liệu");
        }
        req.getRequestDispatcher("/calculator.jsp").forward(req, resp);
    }
}
