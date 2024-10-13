package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.NewsDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.Users;

import java.io.IOException;

@WebServlet("/dangNhap")
public class dangNhap extends HttpServlet {
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
        req.getRequestDispatcher("/dangNhap.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsersDAO usersDAO = new UsersDAO();
        String username = req.getParameter("username").replaceAll(" ", "");
        String password = req.getParameter("password").replaceAll(" ", "");
        Users user = usersDAO.selectById(username);
        if (user != null && user.getPassword().equalsIgnoreCase(password)) {

            req.getSession().setAttribute("username", username); // session
            if(req.getParameter("remember-me") != null) {
                byte[] bytes = (username+","+password).getBytes();
                String userInfo =Base64.encodeBase64String(bytes);
                Cookie cookie = new Cookie("user", userInfo);
                cookie.setMaxAge(30*24*60*60); // hiệu lực 30 ngày
                cookie.setPath("/"); // hiệu lực toàn ứng dụng
                // Gửi về trình duyệt
                resp.addCookie(cookie); // cookie
            }
            else {
                Cookie cookie = new Cookie("user", null);
                cookie.setMaxAge(0); // xóa cookie
                cookie.setPath("/");
                resp.addCookie(cookie); // cookie
            }

            req.setAttribute("user", new UsersDAO().selectById(username));
            req.setAttribute("listCategories", new CategoriesDAO().selectAll());
            if (user.isRole()) {
                req.setAttribute("listUsers", usersDAO.selectAllNotRole());
                req.getRequestDispatcher("/quanTri.jsp").forward(req, resp);
            }
            else {
                req.setAttribute("listNews", new NewsDAO().selectNewsByAuthor(username));
                req.getRequestDispatcher("/phongVien.jsp").forward(req, resp);
            }
        }
        else {
            req.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng");
            req.setAttribute("username", username);
            req.getRequestDispatcher("/dangNhap.jsp").forward(req, resp);
        }
    }
}
