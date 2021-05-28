package com.GL.service.impl;

import com.GL.dao.browseDao;
import com.GL.domin.browse;
import com.GL.service.IbrowseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("browseService")
public class browseServiceImpl implements IbrowseService {

    @Autowired
    com.GL.dao.browseDao browseDao;

    public List<browse> findAll(Integer page, Integer size, Integer userid, Integer articleid) {
        return browseDao.findBrowse(page, size, userid, articleid);
    }

    public boolean insertBrowse(browse browse) {
        return browseDao.insertBrowse(browse);
    }

    public boolean updateBrowse(browse browse) {
        return browseDao.updateBrowse(browse);
    }

}
