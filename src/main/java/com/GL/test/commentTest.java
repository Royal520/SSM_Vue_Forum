package com.GL.test;

import com.GL.dao.articleDao;
import com.GL.domin.comment;
import com.GL.service.IarticleService;
import com.GL.service.IcommentService;
import com.GL.service.IplateService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

public class commentTest {
    private IcommentService icommentService;
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;
    private comment comment =new comment();

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        icommentService = (IcommentService) ac.getBean("commentService");
    }

    @Test
    public void find(){
//        List<comment> comment = icommentService.findComment(-1, 10, null, null, null, null, 1);
    List<comment>   comment= icommentService.findComment(-1,10,1,0,null,null,null);
        System.out.println(comment);
    }

    @Test
    public void Insert(){
        comment.setContent("【表情】 am theree");
        comment.setArticleid(1);
        comment.setFatherid(0);
        comment.setUserid(2);
//        icommentService.insertComment(comment);
        icommentService.deleteComment(3);
        List<comment>comments=icommentService.findComment(null,null,null,null,null,null,null);
        System.out.println(comments);
    }
}
