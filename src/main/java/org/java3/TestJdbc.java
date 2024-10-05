package org.java3;

import org.java3.dao.NewsDAO;
import org.java3.entity.News;

public class TestJdbc {
    public static void main(String[] args) {
        NewsDAO newsDAO = new NewsDAO();
        for (News news : newsDAO.selectAll()) {
            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getCategories_id());

        }
        News news1 = newsDAO.selectById("20240919093010");
        news1.setImg("tphcmgido");
        newsDAO.update(news1);
        System.out.println(newsDAO.selectById("20240919093010").getImg());
    }
}
