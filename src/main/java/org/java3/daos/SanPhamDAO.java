package org.java3.daos;

import org.java3.entities.SanPham;
import org.java3.utils.XJdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanPhamDAO extends AbstractDAO<SanPham, Object> {

    @Override
    public void insert(SanPham entity) {
        String sql = "INSERT INTO SANPHAM VALUE (?, ?, ?, ?)";
        XJdbc.executeUpdate(sql,
                entity.getMaSP(),
                entity.getTenSP(),
                entity.getGia(),
                entity.getLoaiSP());

    }

    @Override
    public void update(SanPham entity) {
        String sql = "UPDATE SANPHAM SET TENSP = ?, GIA = ?, LOAISP = ? WHERE MASP = ?";
        XJdbc.executeUpdate(sql,
                entity.getTenSP(),
                entity.getGia(),
                entity.getLoaiSP(),
                entity.getMaSP());
    }

    @Override
    public void delete(Object id) {
        String sql = "DELETE FROM SANPHAM WHERE MASP =?";
        XJdbc.executeUpdate(sql, id);
    }

    @Override
    public SanPham selectById(Object id) {
        String sql = "SELECT * FROM SANPHAM WHERE MASP = ?";
        List<SanPham> list = selectBySql(sql, id);
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<SanPham> selectAll() {
        String sql = "SELECT * FROM SANPHAM";
        return selectBySql(sql);
    }

    public List<SanPham> selectByCategory(Object category) {
        String sql = "SELECT * FROM SANPHAM WHERE LOAISP = ?";
        return selectBySql(sql, category);
    }

    @Override
    protected List<SanPham> selectBySql(String sql, Object... args) {
        List<SanPham> list = new ArrayList<>();
        try {
            ResultSet rs = null;
            try {
                rs = XJdbc.executeQuery(sql, args);
                while (rs.next()) {
                    SanPham entity = new SanPham();
                    entity.setMaSP(rs.getString("maSP"));
                    entity.setTenSP(rs.getString("tenSP"));
                    entity.setGia(rs.getDouble("gia"));
                    entity.setLoaiSP(rs.getString("loaiSP"));
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
