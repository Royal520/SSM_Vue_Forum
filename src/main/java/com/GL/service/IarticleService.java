package com.GL.service;

import com.GL.domin.article;

import java.util.List;

public interface IarticleService {
    public List<article> findAll(Integer page, Integer size);

    public List<article> findFuzzy(String name);

    public article findById(Integer id);

    public List<article> findByCondition(Integer authorid,Integer plateid);

    public boolean update(article p) throws Exception;

    public boolean Insert(article p);

    public boolean delete(Integer id);
}
