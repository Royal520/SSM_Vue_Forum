package com.GL.service;

import com.GL.domin.focus;

import java.util.List;

public interface IfocusService {
    public List<focus> getAllFans(Integer page,Integer size,Integer bloggerid);

    public List<focus> getAllBolgger(Integer page,Integer size,Integer fansid);

    public boolean insertFocus(focus focus);

    public boolean updateFocus(focus focus);

    public boolean deleteFocus(Integer bloggerid,Integer fansid);
}
