package org.java3;

import org.java3.dao.NewsDAO;
import org.java3.entity.News;

public class TestJdbc {
    public static void main(String[] args) {
        for (News news : new NewsDAO().selectAll()) {
            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getCategories_id());
        }
    }
}
