package org.java3.daos;

import java.util.List;

import org.java3.entity.Employee;

public interface EmployeeDAO {
		/**Truy vấn tất cả*/
		List<Employee> findAll();
		/**Truy vấn theo mã*/
		Employee findById(String id);
		/**Thêm mới*/
		void create(Employee item);
		/**Cập nhật*/
		void update(Employee item);
		/**Xóa theo mã*/
		void deleteById(String id);
}
