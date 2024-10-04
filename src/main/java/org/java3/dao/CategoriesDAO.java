package org.java3.dao;

import org.java3.entity.Categories;
import org.java3.utils.XJdbc;

import java.util.List;

public class CategoriesDAO extends AbstractDAO<Categories, Object>{
    @Override
    public void insert(Categories entity) {
        String sql = "{CALL spCategoriesInsert(?, ?)";
        XJdbc.executeQuery(sql, entity.getId(), entity.getName());
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
        String sql = "{CALL spCategorySelectByID}";
        XJdbc.executeQuery(sql);
        return null;
    }

    @Override
    public List<Categories> selectAll() {
        return List.of();
    }

    @Override
    protected List<Categories> selectBySql(String sql, Object... args) {
        return List.of();
    }
}
