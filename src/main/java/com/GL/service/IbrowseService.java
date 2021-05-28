package com.GL.service;

import com.GL.domin.browse;

import java.util.List;

public interface IbrowseService {
    public List<browse> findAll(Integer page,Integer size,Integer userid,Integer articleid);

    public boolean insertBrowse(browse browse);

    public boolean updateBrowse(browse browse);

}
