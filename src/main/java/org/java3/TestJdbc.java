package org.java3;

import org.java3.dao.NewsDAO;
import org.java3.entity.News;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;

public class TestJdbc {
    public static void main(String[] args) {
//        NewsDAO newsDAO = new NewsDAO();
//        String[] news_id = {"20240919093010", "20240920121525", "20240920183055"};
//        for (String s : news_id) {
//            News news = newsDAO.selectById(s);
//            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getImg() + " - " + news.getView_count());
//        }
//        System.out.println();
//        for (String s : news_id) {
//            News news = newsDAO.selectById(s);
//            news.setView_count(news.getView_count() + 1);
//            newsDAO.update(news);
//            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getImg() + " - " + news.getView_count());
//        }
////        News news1 = newsDAO.selectById("20240919093010");
////        news1.setImg("tphcmgido");
////        newsDAO.update(news1);
////        System.out.println(newsDAO.selectById("20240919093010").getImg());

        //Bài 1.1
//        try {
//            String sql = "SELECT * FROM NEWS WHERE HOME = ?";
//            String[] values = {"1"};   // mảng chứa các giá trị tham số
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.2
//        try {
//            String sql = "SELECT * FROM NEWS WHERE CONTENT LIKE '%' + ? + '%'";
//            String[] values = {"chương trình"};   // mảng chứa các giá trị tham số
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.3
//        try {
//            String sql = "INSERT INTO NEWS VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";  // thử từng câu
//            String[] values = {"202410061006", "Test insert 1", "Test insert 1 content", "Test-insert-1.img", "2024-10-06", "Ngô Tấn An", "100", "KHOAHOC", "1"};
//            int rows = XJdbc.executeUpdate(sql, values);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.4
//        try {
//            String sql = "UPDATE NEWS SET TITLE = ?, CONTENT = ?, IMG = ?, POSTED_DATE = ?, AUTHOR = ?, VIEW_COUNT = ?, CATEGORIES_ID = ?, HOME = ? WHERE ID = ?";  // thử từng câu
//            String[] values = {"Test update 1", "Test update 1 content", "Test-update-1.img", "2024-10-06", "Ngô Tấn An", "100", "KHOAHOC", "1", "202410061006"};
//            int rows = XJdbc.executeUpdate(sql, values);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.5
//        try {
//            String sql = "DELETE FROM NEWS WHERE ID = ?";  // thử từng câu
//            String[] values = {"202410061006"};
//            int rows = XJdbc.executeUpdate(sql, values);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.6
//        try {
//            String sql = "SELECT TOP 3 * FROM NEWS ORDER BY VIEW_COUNT DESC";
//            String[] values = {};   // mảng chứa các giá trị tham số
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.7
//        try {
//            String sql = "SELECT TOP 3 * FROM NEWS ORDER BY POSTED_DATE DESC";
//            String[] values = {};   // mảng chứa các giá trị tham số
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 1.8
//        try {
//            String sql = "SELECT N.* FROM NEWS N, USERS U WHERE N.AUTHOR = U.FULLNAME AND U.ID = ?";
//            String[] values = {"20240921121534"};   // mảng chứa các giá trị tham số
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //Bài 3.1
//        try {
//            String sql = "{CALL spCategoriesInsert(?, ?)}";
//            String[] values = {"DOISONG", "Đời sống"};
//            int rows = XJdbc.executeUpdate(sql, values);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        try {
//            String sql = "{CALL spCategoriesDelete(?)}";
//            String[] values = {"DOISONG"};
//            int rows = XJdbc.executeUpdate(sql, values);
//            System.out.println(rows);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        //Bài 3.2
//        try {
//            String sql = "{CALL spNewsSelectAll()}";
//            String[] values = {};
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        //Bài 3.3
//        try {
//            String sql = "{CALL spNewsSelectById(?)}";
//            String[] values = {"20240928203001"};
//            ResultSet resultSet = XJdbc.executeQuery(sql, values);
//            String value = "";
//            while(resultSet.next()) {
//                value += resultSet.getString("id"); // thay column bằng tên cột trong bảng
//                value += " - " + resultSet.getString("title");
//                value += " - " + resultSet.getString("content");
//                value += " - " + resultSet.getString("img");
//                value += " - " + resultSet.getString("posted_date");
//                value += " - " + resultSet.getString("author");
//                value += " - " + resultSet.getString("view_count");
//                value += " - " + resultSet.getString("home");
//
//                System.out.println(value);
//                value = "";
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
