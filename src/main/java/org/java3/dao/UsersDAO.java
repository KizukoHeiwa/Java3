package org.java3.dao;

import org.java3.entity.Users;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO extends AbstractDAO<Users, Object>{
    @Override
    public void insert(Users entity) {
        String sql = "{CALL spUsersInsert(?, ?, ?, ?, ?, ?, ?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getId(),
                entity.getPassword(),
                entity.getFullname(),
                entity.getBirthday(),
                entity.isGender(),
                entity.getMobile(),
                entity.getEmail(),
                entity.isRole()
        );
    }

    @Override
    public void update(Users entity) {
        String sql = "{CALL spUsersUpdate(?, ?, ?, ?, ?, ?, ?, ?)}";
        XJdbc.executeUpdate(sql,
                entity.getId(),
                entity.getPassword(),
                entity.getFullname(),
                entity.getBirthday(),
                entity.isGender(),
                entity.getMobile(),
                entity.getEmail(),
                entity.isRole()
        );
    }

    @Override
    public void delete(Object id) {
        String sql = "{CALL spUsersDelete(?)}";
        XJdbc.executeUpdate(sql, id);
    }

    @Override
    public Users selectById(Object id) {
        String sql = "{CALL spUsersSelectByID(?)}";
        List<Users> list = selectBySql(sql, id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    public List<Users> selectAllNotRole() {
        String sql = "SELECT * FROM USERS WHERE ROLE = 0";
        return selectBySql(sql);
    }

    @Override
    public List<Users> selectAll() {
        String sql = "{CALL spUsersSelectAll}";
        return selectBySql(sql);
    }

    @Override
    protected List<Users> selectBySql(String sql, Object... args) {
        List<Users> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while(rs.next()){
                    Users entity=new Users();
                    entity.setId(rs.getString("id"));
                    entity.setPassword(rs.getString("password"));
                    entity.setFullname(rs.getString("fullname"));
                    entity.setBirthday(rs.getDate("birthday"));
                    entity.setGender(rs.getBoolean("gender"));
                    entity.setMobile(rs.getString("mobile"));
                    entity.setEmail(rs.getString("email"));
                    entity.setRole(rs.getBoolean("role"));
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
