package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;

import java.io.IOException;

@WebServlet({"/Cookies_Session", "/login"})
public class Bai3_Cookies_Session extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie cookie: cookies) {
                if(cookie.getName().equals("user")) {
                    String encoded = cookie.getValue();
                    byte[] bytes = Base64.decodeBase64(encoded);
                    String[] userInfo = new String(bytes).split(",");
                    req.setAttribute("username", userInfo[0]);
                    req.setAttribute("password", userInfo[1]);
                }
            }
        }
        req.getRequestDispatcher("Bai3_Cookies_Session.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember-me");
        if(username.equalsIgnoreCase("FPT") && password.equals("poly")) {
            req.setAttribute("message", "Login successfully!");
            req.getSession().setAttribute("username", username); // session
            if(remember != null) {
                byte[] bytes = (username+","+password).getBytes();
                String userInfo =Base64.encodeBase64String(bytes);
                Cookie cookie = new Cookie("user", userInfo);
                cookie.setMaxAge(30*24*60*60); // hiệu lực 30 ngày
                cookie.setPath("/"); // hiệu lực toàn ứng dụng
                // Gửi về trình duyệt
                resp.addCookie(cookie); // cookie
            }
            else {
                Cookie cookie = new Cookie("user", "");
                cookie.setMaxAge(0); // xóa cookie
                cookie.setPath("/");
                resp.addCookie(cookie); // cookie
            }
        }
        else {
            req.setAttribute("message", "Invalid login info!");
        }
        req.getRequestDispatcher("Bai3_Cookies_Session.jsp").forward(req, resp);
    }
}
