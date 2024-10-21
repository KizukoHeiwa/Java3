package org.java3.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class SanPham {
    String maSP;
    String tenSP;
    double gia;
    String loaiSP;
}
