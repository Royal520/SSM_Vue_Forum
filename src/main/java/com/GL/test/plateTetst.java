package com.GL.test;

import com.GL.service.IbrowseService;
import com.GL.service.IplateService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;

public class plateTetst {
    private IplateService iplateService;
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        iplateService = (IplateService) ac.getBean("plateService");
    }

    @Test
    public void test(){
        iplateService.findAll(-1,100).forEach(a-> System.out.println(a));
    }
    @Test
    public void plateid(){
        System.out.println(iplateService.getArticlesByplateid(1).getArticles());
    }
}
