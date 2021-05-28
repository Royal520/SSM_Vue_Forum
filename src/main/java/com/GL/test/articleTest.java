package com.GL.test;

import com.GL.dao.articleDao;
import com.GL.domin.article;
import com.GL.domin.plate;
import com.GL.service.IarticleService;
import com.GL.service.IplateService;
import com.GL.service.impl.articleServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

public class articleTest {
    private IplateService iplateService;
    private IarticleService iarticleService;
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;
    private com.GL.dao.plateDao plateDao;
    private articleDao articleDao;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        iplateService = (IplateService) ac.getBean("plateService");
        iarticleService=(IarticleService) ac.getBean("articleService");
        articleDao=(articleDao) ac.getBean("articleDao");
    }

    @Test
    public  void find(){
//        plate articleById =iplateService.getArticleById(1);
//        System.out.println("cnm");
//      System.out.println(articleById.getArticles().get(0).toString());
//        ar.findByConditions("",)
//        articleDao dao=new articleDao();
//        System.out.println(articleDao.findByConditions(null,1).toString());
//        System.out.println(iarticleService.findAll(-1,2));
//        iarticleService.findByCondition(1,1);
//        System.out.println(iarticleService.findByCondition(null,1).get(1).toString());
//        System.out.println( iplateService.getArticleByplateid(1));
//        System.out.println(iplateService.getArticleByplateid(1).getArticles().toString());
        System.out.println(articleDao.findByArticleId(1));
    }

    @Test
    public void Insert(){
        article article=new article();
        article.setAuthorid(1);
        article.setTitle("asdfasdf");
        article.setText("asdfasdfasd");
//        article.setLabel("asdfasdfasdfasdfasdfasd");
        articleDao.insert(article);
    }
}
