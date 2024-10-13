package org.java3.dao;

import org.java3.entity.Newsletters;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewslettersDAO extends AbstractDAO<Newsletters, Object> {
    @Override
    public void insert(Newsletters entity) {
        String sql = "{CALL spNewslettersInsert(?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getEmail(),
                entity.isEnabled());
    }

    @Override
    public void update(Newsletters entity) {
        String sql = "{CALL spNewslettersUpdate(?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getEmail(),
                entity.isEnabled());
    }

    @Override
    public void delete(Object id) {
        String sql = "{CALL spNewslettersDelete(?)}";
        XJdbc.executeUpdate(sql, id);
    }

    @Override
    public Newsletters selectById(Object id) {
        String sql = "{CALL spNewslettersSelectByID(?)}";
        List<Newsletters> list = selectBySql(sql, id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<Newsletters> selectAll() {
        String sql = "{CALL spNewslettersSelectAll}";
        return selectBySql(sql);
    }

    @Override
    protected List<Newsletters> selectBySql(String sql, Object... args) {
        List<Newsletters> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while(rs.next()){
                    Newsletters entity=new Newsletters();
                    entity.setEmail(rs.getString("email"));
                    entity.setEnabled(rs.getBoolean("enabled"));
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
