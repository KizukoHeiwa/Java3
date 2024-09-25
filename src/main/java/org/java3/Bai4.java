package org.java3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;

@MultipartConfig
@WebServlet("/upload")
public class Bai4 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/upload.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Collection<Part> ListFiles = req.getParts();
        if (ListFiles.isEmpty()) {
            req.setAttribute("message", "Bạn chưa chọn file nào cả!");
            req.getRequestDispatcher("upload.jsp").forward(req, resp);
            return;
        }
        for (Part file : ListFiles) {
            String path = "/static/files/" + file.getSubmittedFileName();
            String filename = req.getServletContext().getRealPath(path);
            Files.createDirectories(Paths.get(filename));
            file.write(filename);
        }
        req.setAttribute("message", "File đã được upload thành công!");
        req.getRequestDispatcher("upload.jsp").forward(req, resp);
    }
}
