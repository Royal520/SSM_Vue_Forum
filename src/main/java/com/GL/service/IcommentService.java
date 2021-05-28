package com.GL.service;

import com.GL.domin.comment;

import java.util.List;


public interface IcommentService {
   /*
    * page:-1为所有
    * size:大小
    * articleid: 一篇文章所有根评论
    * fatherid: 查询子评论
    * replyid: 查询评论的回复
    * commentid: 一个评论的信息
    * userid: 查询一个用户的所有评论
    */
    public List<comment> findComment(Integer page,Integer size,Integer articleid, Integer fatherid,Integer replyid,Integer commentid,Integer userid);

    public boolean insertComment(comment comment);

    public boolean updateComment(Integer action,Integer commentid);

    public boolean deleteComment(Integer commentid);
}
