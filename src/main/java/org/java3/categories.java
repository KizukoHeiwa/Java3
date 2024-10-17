package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.codec.binary.Base64;
import org.java3.dao.CategoriesDAO;
import org.java3.dao.UsersDAO;
import org.java3.entity.Categories;
import org.java3.entity.Users;

import java.io.IOException;

@WebServlet({"/categories",
        "/categories/insert"
})
public class categories extends HttpServlet {
    String username = "";
    Users user = new Users();
    CategoriesDAO categoriesDAO = new CategoriesDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies = req.getCookies();
        if(cookies != null) {
            for(Cookie cookie: cookies) {
                if(cookie.getName().equals("user")) {
                    String encoded = cookie.getValue();
                    byte[] bytes = Base64.decodeBase64(encoded);
                    String[] userInfo = new String(bytes).split(",");
                    username = userInfo[0];
                }
            }
        }

        user = new UsersDAO().selectById(username);

        req.setAttribute("listCategories", categoriesDAO.selectAll());
        req.setAttribute("author", new UsersDAO().selectById(username));
        req.getRequestDispatcher("categories.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("update") != null) {
            Categories category = categoriesDAO.selectById(req.getParameter("update"));
            category.setId(req.getParameter(category.getId().trim()));
            category.setName(req.getParameter(category.getId().trim() + ".name"));
            System.out.println(req.getParameter("update"));
            System.out.println(category.getName());
            categoriesDAO.update(category);
        }
        if (req.getRequestURI().contains("insert")) {
            Categories category = new Categories();
            category.setId(req.getParameter("category_id"));
            category.setName(req.getParameter("category_name"));
            categoriesDAO.insert(category);
        }
        resp.sendRedirect(req.getContextPath() + "/categories");
    }
}
