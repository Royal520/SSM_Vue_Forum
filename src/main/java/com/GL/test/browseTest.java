package com.GL.test;

import com.GL.dao.articleDao;
import com.GL.domin.browse;
import com.GL.service.IarticleService;
import com.GL.service.IbrowseService;
import com.GL.service.IplateService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

public class browseTest {
    private IbrowseService ibrowseService;
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        ibrowseService = (IbrowseService) ac.getBean("browseService");
    }

    @Test
    public  void find(){

//        System.out.println(ibrowseService.findAll(null,1,1,null).toString());
        browse browse=new browse(4,1,1,1);

        ibrowseService.updateBrowse(browse);
        List<browse> all = ibrowseService.findAll(null, null, null, 1);
        all.forEach(b -> System.out.println(b));

//        System.out.println(iplateService.getArticleByplateid(1).getArticles().toString());
    }
}
