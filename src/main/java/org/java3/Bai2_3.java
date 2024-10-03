package org.java3;

import java.sql.ResultSet;

public class Bai2_3 {
    public static void main(String[] args) {
        try {
//            String sql = "SELECT * FROM Departments;";
            String sql = "{CALL spSelectAll}";
            ResultSet resultSet = XJdbc.executeQuery(sql);
            while(resultSet.next()) {
                String id = resultSet.getString("ID");
                String value = resultSet.getString("NAME");
                String description = resultSet.getString("DESCRIPTION");
                System.out.println(id + " | " + value + " | " + description);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        try {
//            String sql = "DELETE FROM Employees WHERE ID = 'NV03'";
////            String sql = "INSERT INTO Employees VALUES ('NV03', '132', N'Nhân viên 3', 'photo3.jpg', 0, '2000-03-13', 30000, 'D03')";
//            int rows = XJdbc.executeUpdate(sql);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
