package org.java3.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.java3.daos.DepartmentDAO;
import org.java3.daos.DepartmentDAOImpl;
import org.java3.entity.Department;

@WebServlet({ 
	"/department/index", 
	"/department/edit/*", 
	"/department/create", 
	"/department/update",
	"/department/delete", 
	"/department/reset" 
})
public class DepartmentServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Department form = new Department();

		try {
			BeanUtils.populate(form, request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		DepartmentDAO dao = new DepartmentDAOImpl();
		String path = request.getServletPath();
		if (path.contains("edit")) {
			String id = request.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("create")) {
			try {
				dao.create(form);
				form = new Department();
			} catch (RuntimeException e) {
				request.setAttribute("message","Trùng khóa chính");
			}
		} else if (path.contains("update")) {
			dao.update(form);
		} else if (path.contains("delete")) {
			dao.deleteById(form.getId());
			form = new Department();
		} else {
			form = new Department();
		}
		
		request.setAttribute("item", form);
		List<Department> list = dao.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Department.jsp").forward(request, response);
	}
}

