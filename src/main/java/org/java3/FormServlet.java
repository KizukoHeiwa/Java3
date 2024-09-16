package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/form/update")
public class FormServlet extends HttpServlet {
    Map<String, Object> map = new HashMap<>() {
        {
            put("fullname", "");
            put("gender", true);
            put("nationality", "VN");
        }
    };
    boolean editable;
    User bean = new User();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        editable = true;
//        map.put("fullname", map.get("fullname"));
//        map.put("gender", map.get("gender"));
//        map.put("nationality", map.get("nationality"));
//        req.setAttribute("user", map);

        bean.setFullname(bean.getFullname());
        bean.setGender(bean.isGender());
        bean.setNationality(bean.getNationality());
        req.setAttribute("user", bean);

        req.setAttribute("editable", editable);
        req.getRequestDispatcher("/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String fullname = req.getParameter("fullname");
//        map.put("fullname", fullname);
//        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
//        map.put("gender", gender);
//        String nationality = req.getParameter("nationality");
//        map.put("nationality", nationality);

        bean.setFullname(req.getParameter("fullname"));
        bean.setGender(Boolean.parseBoolean(req.getParameter("gender")));
        bean.setNationality(req.getParameter("nationality"));
        editable = false;
        System.out.println(bean.getFullname() + " - " + (bean.isGender()?"Nam":"Nữ") + " - " + bean.getNationality());
//        System.out.println(fullname + " - " + (gender?"Nam":"Nữ") + " - " + nationality);
        req.getRequestDispatcher("/form.jsp").forward(req, resp);
    }
}
