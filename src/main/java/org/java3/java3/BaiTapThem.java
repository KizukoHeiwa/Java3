package org.java3.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/BaiTapThem/*"})
public class BaiTapThem extends HttpServlet {
    boolean show = false;
    List<Product> products = new java.util.ArrayList<>(List.of(
            new Product("SP001", "Sản phẩm 1", 1000),
            new Product("SP002", "Sản phẩm 2", 2000),
            new Product("SP003", "Sản phẩm 3", 3000)
    ));
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getRequestURI().contains("/show")) {
            show = !show;
        }
        if (req.getRequestURI().contains("/delete")) {
            String maSP = req.getQueryString().substring(3);
            for (Product product : products) {
                if (product.getMa().equals(maSP)) {
                    req.setAttribute("message", "Đã xóa sản phẩm: " + product.getMa() + " - " + product.getTenSP() + " - " + product.getGia());
                    products.remove(product);
                    break;
                }
            }
        }
        if (req.getRequestURI().contains("/edit")) {
            String maSP = req.getQueryString().substring(3);
            for (Product product : products) {
                if (product.getMa().equals(maSP)) {
                    req.setAttribute("message", "Đã sửa sản phẩm: " + product.getMa() + " - " + product.getTenSP() + " - " + product.getGia());
                    break;
                }
            }
        }

        req.setAttribute("show", show);
        req.setAttribute("products", products);
        req.getRequestDispatcher("/BaiTapThem.jsp").forward(req, resp);
    }
}

