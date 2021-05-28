package com.GL.service;

import com.GL.domin.article;
import com.GL.domin.plate;

import java.util.List;


public interface IplateService {
    public List<plate> findAll(Integer page,Integer size);

    public List<plate> findFuzzy(String name);

    public plate findByCondition(Integer id,String name);

    public boolean update(plate p) throws Exception;

    public boolean Insert(plate p);

    public boolean delete(Integer id);

    public plate getArticlesByplateid(Integer id);
}
