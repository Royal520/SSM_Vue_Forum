package com.GL.test;



import com.GL.domin.plate;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.GL.service.IplateService;

import java.io.InputStream;
import java.util.List;


public class SpringTest {

    private IplateService plateService;

    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;
    private com.GL.dao.plateDao plateDao;

//    @Before
//    public  void init()throws Exception{
//        in = Resources.getResourceAsStream("SqlMapConfig.xml");
//        factory = new SqlSessionFactoryBuilder().build(in);
//        session = factory.openSession();
//        plateDao = session.getMapper(Iplate.class);
//    }
//
//    @After
//    public  void destroy()throws  Exception{
//        session.commit();
//        session.close();
//        in.close();
//    }

    @Before
    public void init(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        // 获取对象
        plateService = (IplateService) ac.getBean("plateService");
    }

    @Test
    public void findAll(){
        List<plate> all = plateService.findAll(0,5);
        for (plate account: all) {
            System.out.println(account.toString());
        }
    }

    @Test
    public void findCondition(){
        plate byCondition = plateService.findByCondition(null, "美国");
        System.out.println(byCondition);
    }

    @Test
    public void findFuzzy(){
        List<plate> all=plateService.findFuzzy("国");
        for (plate p:all) {
            System.out.println(p.toString());
        }
    }@Test
    public void delete(){
        plateService.delete(9);
        findAll();
    }
    @Test
    public void Insert(){
        plate p=new plate();
        p.setName("韩国");
        p.setSort(2);
        plateService.Insert(p);
        findAll();
    }

    @Test
    public void update() throws Exception {
        plate p=new plate();
        p.setId(2);
        p.setIntroduce("俄罗斯");
        p.setSort(4);
        System.out.println(p.getId());
        plateService.update(p);
        findAll();
    }

}
