package com.GL.service;

import com.GL.domin.user;

import java.util.List;

public interface IuserService {
    public List<user> findAll(Integer page, Integer size);

    public List<user> findFuzzy(String name);

    public user findById(Integer id);

    public user findByCondition(Integer id,String name);

    public boolean update(user user) ;

    public boolean Insert(user user);

    public boolean delete(Integer id);
}
