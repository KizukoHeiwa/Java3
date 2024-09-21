package org.java3.java3;

public class Product {
    private String ma;
    private String tenSP;
    private double gia;

    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public Product(String ma, String tenSP, double gia) {
        this.ma = ma;
        this.tenSP = tenSP;
        this.gia = gia;
    }

    public Product() {
    }
}
