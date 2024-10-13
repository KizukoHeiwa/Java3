package org.java3.dao;

import org.java3.entity.News;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO extends AbstractDAO<News, Object> {
    @Override
    public void insert(News entity) {
        String sql = "{CALL spNewsInsert(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getId(),
                entity.getTitle(),
                entity.getContent(),
                entity.getImg(),
                entity.getPosted_date(),
                entity.getAuthor(),
                entity.getView_count(),
                entity.getCategories_id(),
                entity.isHome()
            );
    }

    @Override
    public void update(News entity) {
        String sql = "{CALL spNewsUpdate(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getId(),
                entity.getTitle(),
                entity.getContent(),
                entity.getImg(),
                entity.getPosted_date(),
                entity.getAuthor(),
                entity.getView_count(),
                entity.getCategories_id(),
                entity.isHome()
            );
    }

    @Override
    public void delete(Object id) {
        String sql = "{CALL spNewsDelete(?)}";
        XJdbc.executeUpdate(sql, id);
    }

    @Override
    public News selectById(Object id) {
        String sql = "{CALL spNewsSelectByID(?)}";
        List<News> list = selectBySql(sql, id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<News> selectAll() {
        String sql = "{CALL spNewsSelectAll}";
        return selectBySql(sql);
    }

    public List<News> selectAllDesc() {
        String sql = "{CALL spNewsSelectAllDesc}";
        return selectBySql(sql);
    }

    public List<News> selectTopViewNews() {
        String sql = "SELECT TOP 5 * FROM NEWS ORDER BY VIEW_COUNT DESC";
        return selectBySql(sql);
    }

    public List<News> selectLatestNews() {
        String sql = "SELECT TOP 5 * FROM NEWS ORDER BY POSTED_DATE DESC";
        return selectBySql(sql);
    }

    public List<News> selectNewsByAuthor(String author) {
        String sql = "SELECT N.* FROM NEWS N, USERS U WHERE AUTHOR = FULLNAME AND U.ID = ? ORDER BY HOME DESC, ID DESC";
        return selectBySql(sql, author);
    }

    public List<News> selectNewsByCategory(String categoryId) {
        String sql = "SELECT N.* FROM NEWS N, CATEGORIES C WHERE C.ID = CATEGORIES_ID AND C.ID =? ORDER BY HOME DESC, ID DESC";
        return selectBySql(sql, categoryId);
    }

    @Override
    protected List<News> selectBySql(String sql, Object... args) {
        List<News> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while(rs.next()){
                    News entity = new News();
                    entity.setId(rs.getString("id"));
                    entity.setTitle(rs.getString("title"));
                    entity.setContent(rs.getString("content"));
                    entity.setImg(rs.getString("img"));
                    entity.setPosted_date(rs.getDate("posted_date"));
                    entity.setAuthor(rs.getString("author"));
                    entity.setView_count(rs.getInt("view_count"));
                    entity.setCategories_id(rs.getString("categories_id"));
                    entity.setHome(rs.getBoolean("home"));
                    list.add(entity);
                }
            }
            finally{
                rs.getStatement().getConnection().close();
            }
        }
        catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }
}
