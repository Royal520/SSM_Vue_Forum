package com.GL.service.impl;

import com.GL.dao.focusDao;
import com.GL.domin.focus;
import com.GL.service.IfocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("focusService")
public class focusServiceImpl implements IfocusService {
    @Autowired
    private focusDao focusDao;
    public List<focus> getAllFans(Integer page,Integer size,Integer bloggerid) {
        return focusDao.findById(page,size,bloggerid,null);
    }

    public List<focus> getAllBolgger(Integer page,Integer size,Integer fansid) {
        return focusDao.findById(page,size,null,fansid);

    }

    public boolean insertFocus(focus focus) {
        return focusDao.insertFocus(focus);
    }

    public boolean updateFocus(focus focus) {
        return focusDao.updateFocus(focus);
    }

    public boolean deleteFocus(Integer bloggerid, Integer fansid) {
        return focusDao.deleteFocus(bloggerid, fansid);
    }
}
