package com.GL.dao;

import com.GL.domin.comment;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface commentDao {

// 查询所有回复{commentid,replyid}
// 查询一个人的所有评论{userid}articleid;userid;commentid;fatherid;  replyid;
    @Select("<script>"+
            "SELECT * from comment"+
            "<where>"+
            "1=1"+
            " <if test=\"articleid != null and fatherid == null\">and articleid=#{articleid} and fatherid=0</if>" +
            " <if test=\"fatherid != null\">and fatherid=#{fatherid}</if>" +
            " <if test=\"replyid != null\">and replyid=#{replyid}</if>" +
            " <if test=\"commentid != null\">and commentid=#{commentid}</if>" +
            " <if test=\"userid != null\">and userid=#{userid}</if>" +
            "</where>"+
            " <if test=\"page != null and page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    public List<comment> findComment(@Param("page")Integer page, @Param("size") Integer size, @Param("articleid")Integer articleid,
                                        @Param("fatherid")Integer fatherid, @Param("replyid")Integer replyid, @Param("commentid")Integer commentid,@Param("userid")Integer userid);

// 查询一篇文章所有直接评论  {articleid,fatherid}
    @Select("SELECT * from  comment where articleid=#{articleid} and fatherid=0")
    @Results(id="sonMap",value = {
            @Result(column = "userid",property = "userid"),
            @Result(column ="userid",property = "username",
                    one=@One(select = "com.GL.dao.userDao.getDetailById",fetchType = FetchType.EAGER)),
            @Result(column="{articleid=articleid,fatherid=commentid}",property="comments",
                    many=@Many(select="com.GL.dao.commentDao.sonComment", fetchType= FetchType.EAGER))
    })
   public List<comment> allComment(@Param("articleid")Integer articleid);

    // 查询一篇文章所有直接评论  {articleid,fatherid}
    @Select("SELECT * from comment where articleid=#{articleid} and fatherid=#{fatherid}")
    @Results(id="sonsMap",value = {
            @Result(column = "userid",property = "userid"),
            @Result(column ="userid",property = "username",
                    one=@One(select = "com.GL.dao.userDao.getDetailById",fetchType = FetchType.EAGER)),
    })
    public List<comment> sonComment(@Param("articleid")Integer articleid, @Param("fatherid")Integer fatherid);


    //插入操作
    @Insert("Insert into comment values (#{articleid},#{userid},#{commentid},#{fatherid},#{replyid},#{time},#{likenumber},#{sort},#{content})")
    public void insert(comment comment);

    //更新操作只能点赞或取消
    @Update("update comment set likenumber=likenumber+#{arg0} where commentid=#{arg1}")
    public boolean update(Integer n,Integer id);


    //删除
    @Delete("delete from  comment where commentid=#{uid}")
    public boolean delete(@Param("uid") Integer id);
}
