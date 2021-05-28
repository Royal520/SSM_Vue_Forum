package com.GL.service.impl;

import com.GL.dao.articleDao;
import com.GL.domin.article;
import com.GL.service.IarticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("articleService")
public class articleServiceImpl implements IarticleService {
    @Autowired
    private articleDao articleDao;

    public List<article> findAll(Integer page, Integer size) {
        return articleDao.findAll(page,size);
    }

    public List<article> findFuzzy(String name) {
        return null;
    }

    public article findById(Integer id){
        return articleDao.findByArticleId(id);
    }

    public List<article> findByCondition(Integer authorid, Integer plateid) {
        return articleDao.findByConditions(authorid,plateid,null);
    }

    public boolean update(article p) throws Exception {
        return articleDao.update(p);
    }

    public boolean Insert(article p) {
        return articleDao.insert(p);
    }

    public boolean delete(Integer id) {
        return false;
    }
}
