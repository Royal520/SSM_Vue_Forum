package com.GL.service.impl;

import com.GL.dao.userDao;
import com.GL.domin.user;
import com.GL.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class userServiceImpl implements IuserService {

    @Autowired
    private userDao userDao;

    public List<user> findAll(Integer page, Integer size) {
        return userDao.findAll(page,size);
    }

    public List<user> findFuzzy(String name) {
        return userDao.findFuzzy(name);
    }

    public user findById(Integer id) {
        return userDao.findById(id);
    }

    public user findByCondition(Integer id, String name) {
        return userDao.findByConditions(id,name);
    }

    public boolean update(user user)  {
        return userDao.update(user);
    }

    public boolean Insert(user user) {
          return userDao.insert(user);
    }

    public boolean delete(Integer id) {
        return userDao.delete(id);
    }
}
