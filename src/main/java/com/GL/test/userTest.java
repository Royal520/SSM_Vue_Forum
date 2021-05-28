package com.GL.test;


import com.GL.dao.userDao;
import com.GL.domin.plate;
import com.GL.domin.user;
import com.GL.service.IplateService;
import com.GL.service.IuserService;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.InputStream;
import java.util.List;


public class userTest {

    private IuserService userService;

    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;
    private com.GL.dao.plateDao plateDao;


    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        userService = (IuserService) ac.getBean("userService");
    }

    @Test
    public void findAll(){
        List<user> all = userService.findAll(0,5);
        for (user account: all) {
            System.out.println(account.toString());
        }
    }

    @Test
    public void findCondition(){
        user byCondition = userService.findByCondition(null, "Royal");
        System.out.println(byCondition);
    }

    @Test
    public void findFuzzy(){
        List<user> all=userService.findFuzzy("刘");
        for (user p:all) {
            System.out.println(p.toString());
        }
    }@Test
    public void delete(){
        userService.delete(4);
        findAll();
    }
    @Test
    public void Insert(){
        user p=new user();
//        p.setName("韩国");
//        p.setSort(2);
        userService.Insert(p);
        findAll();
    }

    @Test
    public void update() throws Exception {
        user p=new user();
        p.setId(2);
//        p.setIntroduce("俄罗斯");
//        p.setSort(4);
        System.out.println(p.getId());
        userService.update(p);
        findAll();
    }

    @Test
    public void findById(){
        System.out.println(userService.findById(1));
    }
}
