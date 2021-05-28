package com.GL.service.impl;

import com.GL.dao.commentDao;
import com.GL.domin.comment;
import com.GL.service.IcommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class commentServiceImpl implements IcommentService {

    @Autowired
    private commentDao commentDao;

    public List<comment> findComment(Integer page, Integer size, Integer articleid, Integer fatherid, Integer replyid, Integer commentid, Integer userid) {
        if(articleid!=null&&fatherid==0)
            return commentDao.allComment(articleid);
        else if(articleid!=null&& fatherid!=0)
            return commentDao.sonComment(articleid, fatherid);
        else
            return commentDao.findComment(page, size, articleid, fatherid, replyid, commentid, userid);
    }

    public boolean insertComment(comment comment) {
        try {
            commentDao.insert(comment);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateComment(Integer action, Integer commentid) {
        return commentDao.update(action,commentid);
    }

    public boolean deleteComment(Integer commentid) {
        return commentDao.delete(commentid);
    }
}
