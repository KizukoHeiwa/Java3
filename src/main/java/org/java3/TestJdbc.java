package org.java3;

import org.java3.dao.NewsDAO;
import org.java3.entity.News;

public class TestJdbc {
    public static void main(String[] args) {
        NewsDAO newsDAO = new NewsDAO();
        String[] news_id = {"20240919093010", "20240920121525", "20240920183055"};
        for (String s : news_id) {
            News news = newsDAO.selectById(s);
            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getImg() + " - " + news.getView_count());
        }
        System.out.println();
        for (String s : news_id) {
            News news = newsDAO.selectById(s);
            news.setView_count(news.getView_count() + 1);
            newsDAO.update(news);
            System.out.println(news.getId() + " - " + news.getContent() + " - " + news.getImg() + " - " + news.getView_count());
        }
//        News news1 = newsDAO.selectById("20240919093010");
//        news1.setImg("tphcmgido");
//        newsDAO.update(news1);
//        System.out.println(newsDAO.selectById("20240919093010").getImg());
    }
}
