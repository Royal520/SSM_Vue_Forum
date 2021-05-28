package com.GL.service.impl;


import com.GL.dao.plateDao;
import com.GL.domin.article;
import com.GL.domin.plate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.GL.service.IplateService;

import java.util.List;

@Service("plateService")
public class plateServiceImpl implements IplateService {

    @Autowired
    plateDao plateDao;
    // page=0时候不分页;

    public List<plate> findAll(Integer page,Integer size) {
        return plateDao.findAll((page-1)*size, size);
    }


    public List<plate> findFuzzy(String name) {
        return plateDao.findFuzzy(name);
    }


    public plate findByCondition(Integer id,String name) {
        return plateDao.findByConditions(id,name);
    }


    public boolean update(plate p) throws Exception {
        if(p.getId()==0)
            return false;
        return plateDao.update(p);
    }


    public boolean Insert(plate p) {
        plateDao.insert(p);
        return true;
    }


    public boolean delete(Integer id) {
            plateDao.delete(id);
            return true;
    }

    public plate getArticlesByplateid(Integer id) {
        return plateDao.getArticlesByplateid(id);
    }
}
