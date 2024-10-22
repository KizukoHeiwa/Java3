package org.java3.daos;

import org.java3.entities.Users;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO extends AbstractDAO<Users, Object> {

    @Override
    public void insert(Users entity) {
        String sql = "INSERT INTO USERS VALUES (?, ?, ?, ?)";
        XJdbc.executeUpdate(sql,
                entity.getId(),
                entity.getFullname(),
                entity.getPassword(),
                entity.isAdmin());
    }

    @Override
    public void update(Users entity) {
        String sql = "UPDATE USERS SET FULLNAME = ?, PASSWORD = ?, ADMIN = ? WHERE ID = ?";
        XJdbc.executeUpdate(sql,
                entity.getFullname(),
                entity.getPassword(),
                entity.isAdmin(),
                entity.getId());
    }

    @Override
    public void delete(Object id) {
        String sql = "DELETE FROM USERS WHERE ID = ?";
        XJdbc.executeUpdate(sql, id);
    }

    @Override
    public Users selectById(Object id) {
        String sql = "SELECT * FROM USERS WHERE ID = ?";
        List<Users> list = selectBySql(sql, id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<Users> selectAll() {
        String sql = "SELECT * FROM USERS";
        return selectBySql(sql);
    }

    @Override
    protected List<Users> selectBySql(String sql, Object... args) {
        List<Users> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while (rs.next()) {
                    Users entity = new Users();
                    entity.setId(rs.getString("id"));
                    entity.setFullname(rs.getString("fullname"));
                    entity.setPassword(rs.getString("password"));
                    entity.setAdmin(rs.getBoolean("admin"));
                    list.add(entity);
                }
            } finally {
                rs.getStatement().getConnection().close();
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return list;
    }
}
