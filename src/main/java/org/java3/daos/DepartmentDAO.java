package org.java3.daos;

import java.util.List;

import org.java3.entity.Department;

public interface DepartmentDAO {
		/**Truy vấn tất cả*/
		List<Department> findAll();
		/**Truy vấn theo mã*/
		Department findById(String id);
		/**Thêm mới*/
		void create(Department item);
		/**Cập nhật*/
		void update(Department item);
		/**Xóa theo mã*/
		void deleteById(String id);
}
