package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;

@WebServlet("/signin")
public class Demo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("demo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String gioiTinh = req.getParameter("gioiTinh");
        String tthn = (req.getParameter("tthn") != null)?"Đã kết hôn":"Độc thân";
        String national = req.getParameter("national");
        String[] soThich = req.getParameterValues("soThich");

        String output = "Username: " + username
                + "\nPassword: " + password
                + "\nGiới tính: " + gioiTinh
                + "\nTình trạng hôn nhân: " + tthn
                + "\nQuốc tịch: " + national
                + "\nSở thích: " + Arrays.toString(soThich);

//        System.out.println("Username: " + username);
//        System.out.println("Password: " + password);
//        System.out.println("Giới tính: " + gioiTinh);
//        System.out.println("Tình trạng hôn nhân: " + tthn);
//        System.out.println("Quốc tịch: " + national);
//        System.out.println("Sở thích: " + Arrays.toString(soThich));

        req.setAttribute("output", output);
        req.setAttribute("soThich", Arrays.toString(soThich));
        req.getRequestDispatcher("demo.jsp").forward(req, resp);
    }
}
