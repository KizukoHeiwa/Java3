package org.java3.dao;

import org.java3.entity.Categories;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO extends AbstractDAO<Categories, Object>{
    @Override
    public void insert(Categories entity) {
        String sql = "{CALL spCategoriesInsert(?, ?)";
        XJdbc.executeQuery(sql,
                entity.getId(),
                entity.getName());
    }

    @Override
    public void update(Categories entity) {
        String sql = "{CALL spCategoriesUpdate(?, ?)";
        XJdbc.executeQuery(sql, entity.getId(), entity.getName());
    }

    @Override
    public void delete(Object id) {
        String sql = "{CALL spCategoriesDelete(?)}";
        XJdbc.executeQuery(sql, id);
    }

    @Override
    public Categories selectById(Object id) {
        String sql = "{CALL spCategoriesSelectByID}";
        List<Categories> list = selectBySql(sql);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<Categories> selectAll() {
        String sql = "{CALL spCategoriesSelectAll}";
        return selectBySql(sql);
    }

    @Override
    protected List<Categories> selectBySql(String sql, Object... args) {
        List<Categories> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while(rs.next()){
                    Categories entity=new Categories();
                    entity.setId(rs.getString("id"));
                    entity.setName(rs.getString("name"));
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
