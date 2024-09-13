package com.poly.lab1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/bai4/*")
public class bai4 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		if(uri.contains("/crud/create")) {
			resp.getWriter().print("<h1>Creating new record...</h1>");
		}
		else if (uri.contains("/crud/delete")) {
			resp.getWriter().print("<h1>Deleting new record...</h1>");
		}
		else if (uri.contains("/crud/update")) {
            resp.getWriter().print("<h1>Updating new record...</h1>");
        }
		else if (uri.contains("crud/edit/2024")) {
			resp.getWriter().print("<h1>Editing record in 2024...</h1>");
		}
	}

}
