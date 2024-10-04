package org.java3.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class News {
    private String id;
    private String title;
    private String content;
    private String img;
    private Date posted_date;
    private String author;
    private int view_count;
    private String category_id;
    private boolean home;
}
