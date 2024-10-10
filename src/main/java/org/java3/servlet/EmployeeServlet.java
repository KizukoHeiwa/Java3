package org.java3.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import org.java3.daos.EmployeeDAO;
import org.java3.daos.EmployeeDAOImpl;
import org.java3.entity.Employee;


@MultipartConfig()
@WebServlet({ 
	"/employee/index", 
	"/employee/edit/*", 
	"/employee/create", 
	"/employee/update",
	"/employee/delete", 
	"/employee/reset",
	"/employee/upload"
})
public class EmployeeServlet extends HttpServlet {
	
	Employee form = new Employee();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		/*
		 * Part part = request.getPart("photo"); try { BeanUtils.populate(form,
		 * request.getParameterMap()); form.setPhoto(part.getSubmittedFileName()); }
		 * catch (IllegalAccessException | InvocationTargetException e) {
		 * e.printStackTrace(); }
		 */
		EmployeeDAO dao = new EmployeeDAOImpl();
		String path = request.getServletPath();
		DateTimeConverter dtc = new DateConverter(new Date());
		dtc.setPattern("MM/dd/yy");
		ConvertUtils.register(dtc, Date.class);
		
		if (path.contains("edit")) {
			String id = request.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("create")) {
			try {
				BeanUtils.populate(form, request.getParameterMap());
				//Part part = request.getPart("photo");	
				//form.setPhoto(part.getSubmittedFileName());
				dao.create(form);
				form = new Employee();
			} catch (Exception e) {
				System.out.println(e.getMessage());
				request.setAttribute("message","Trùng khóa chính");
			}
		} else if (path.contains("update")) {
			try {
				//Part part = request.getPart("photo");
				BeanUtils.populate(form, request.getParameterMap());
				//form.setPhoto(part.getSubmittedFileName());
				dao.update(form);
			} catch (Exception e) {	}		
		} else if (path.contains("delete")) {
			dao.deleteById(form.getId());
			form = new Employee();
		} else if (path.contains("upload")){
			Part part = request.getPart("photo");
			try {
				BeanUtils.populate(form, request.getParameterMap());
				form.setPhoto(part.getSubmittedFileName());
				upload(request,part,"images");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		} else {
			form = new Employee();
		}
		
		request.setAttribute("item", form);
		List<Employee> list = dao.findAll();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/Employee.jsp").forward(request, response);
	}

	public void upload(HttpServletRequest request,Part part,String folder) {
		String path = request.getServletContext().getRealPath(folder);
		// kiem tra folder images co ton tai chua, neu chua thi tao
		File dir = new File(path);
		if (!dir.exists()) dir.mkdir();
		// sao chep hinh tu local len WEb Server
		try {
			part.write(path + "/" + part.getSubmittedFileName());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	}

