package com.GL.test;

import com.GL.domin.focus;
import com.GL.service.IbrowseService;
import com.GL.service.IfocusService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;

public class focusTest {
    private IfocusService ifocusService;
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        ifocusService = (IfocusService) ac.getBean("focusService");
    }

    @Test
    public void test(){
//        List<focus> allFans = ifocusService.getAllFans(null, null, 1);

//        ifocusService.updateFocus(new focus(3,2,0,0));
        ifocusService.deleteFocus(3,2);
//        List<focus> allBolgger = ifocusService.getAllBolgger(null, null, 2);
//        allBolgger.forEach(fan-> System.out.println(fan.getBloggerUser()));
    }

}
