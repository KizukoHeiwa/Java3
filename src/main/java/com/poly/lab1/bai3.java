package com.poly.lab1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/bai3")
public class bai3 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = req.getRequestURL().toString(); // Full URL
        String uri = req.getRequestURI(); // URI without protocol and host
        String queryString = req.getQueryString(); // Query string (part after ?)
        String servletPath = req.getServletPath(); // Servlet path
        String contextPath = req.getContextPath(); // Context path
        String pathInfo = req.getPathInfo(); // Any extra path information
        String method = req.getMethod(); // HTTP method (GET, POST, etc.)
        
        // Output the information as HTML
        resp.getWriter().println("<html><body>");
        resp.getWriter().println("<h1>Request Information</h1>");
        resp.getWriter().println("<p><strong>URL:</strong> " + url + "</p>");
        resp.getWriter().println("<p><strong>URI:</strong> " + uri + "</p>");
        resp.getWriter().println("<p><strong>Query String:</strong> " + queryString + "</p>");
        resp.getWriter().println("<p><strong>Servlet Path:</strong> " + servletPath + "</p>");
        resp.getWriter().println("<p><strong>Context Path:</strong> " + contextPath + "</p>");
        resp.getWriter().println("<p><strong>Path Info:</strong> " + pathInfo + "</p>");
        resp.getWriter().println("<p><strong>Method:</strong> " + method + "</p>");
        resp.getWriter().println("</body></html>");
	}

}
