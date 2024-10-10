package org.java3.daos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.java3.entity.Employee;
import org.java3.util.Jdbc;

public class EmployeeDAOImpl implements EmployeeDAO {
	@Override
	public List<Employee> findAll() {
		String sql = "SELECT * FROM Employees";
		try {
			List<Employee> entities = new ArrayList<>();
			Object[] values = {};
			ResultSet resultSet = Jdbc.executeQuery(sql, values);
			while (resultSet.next()) {
				Employee employee = new Employee();
				employee.setId(resultSet.getString("Id"));
				employee.setFullname(resultSet.getString("fullname"));
				employee.setPassword(resultSet.getString("password"));
				employee.setGender(resultSet.getBoolean("gender"));
				employee.setBirthday(resultSet.getDate("birthday"));
				employee.setPhoto(resultSet.getString("photo"));
				employee.setSalary(resultSet.getDouble("salary"));
				employee.setDepartment_id(resultSet.getString("department_id"));
				entities.add(employee);
			}
			return entities;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Employee findById(String id) {
		String sql = "SELECT * FROM Employees WHERE Id=?";
		try {
			Object[] values = { id };
			ResultSet resultSet = Jdbc.executeQuery(sql, values);
			if (resultSet.next()) {
				Employee employee = new Employee();
				employee.setId(resultSet.getString("Id"));
				employee.setFullname(resultSet.getString("fullname"));
				employee.setPassword(resultSet.getString("password"));
				employee.setGender(resultSet.getBoolean("gender"));
				employee.setBirthday(resultSet.getDate("birthday"));
				employee.setPhoto(resultSet.getString("photo"));
				employee.setSalary(resultSet.getDouble("salary"));
				employee.setDepartment_id(resultSet.getString("department_id"));
				return employee;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		throw new RuntimeException("Not found");
	}

	@Override
	public void create(Employee employee) {
		String sql = "INSERT INTO Employees VALUES(?,?,?,?,?,?,?,?)";
		try {
			Object[] values = { 
				employee.getId(), 
				employee.getFullname(), 
				employee.getPassword(),
				employee.getGender(),
				employee.getBirthday(),
				employee.getPhoto(),
				employee.getSalary(),
				employee.getDepartment_id()
			};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Employee employee) {
		String sql = "UPDATE Employees SET fullname=?, password=?, gender = ? , birthday = ? ," 
				+ " photo = ? , salary= ?,  department_id = ? "
				+ " WHERE Id=?";
		try {
			Object[] values = { 		 
				employee.getFullname(), 
				employee.getPassword(),
				employee.getGender(),
				employee.getBirthday(),
				employee.getPhoto(),
				employee.getSalary(),
				employee.getDepartment_id(),
				employee.getId()
			};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteById(String id) {
		String sql = "DELETE FROM Employees WHERE Id=?";
		try {
			Object[] values = { id };
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		EmployeeDAOImpl dao = new EmployeeDAOImpl();
		//dao.deleteById("em01");
		Employee employee = dao.findById("em01");
		System.out.println(employee.getPassword());
	}
}
