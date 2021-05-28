package com.GL.dao;

import com.GL.domin.article;
import com.GL.domin.comment;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface articleDao {

    @Select("select * from article where id=#{id}")
    @Results(id="articleMap",value = {
            @Result(id=true ,column = "id",property = "id"),
            @Result(column = "authorid",property = "authorid"),
            @Result(column = "label",property = "label"),
            @Result(column ="authorid",property = "user",
            one=@One(select = "com.GL.dao.userDao.findById",fetchType = FetchType.EAGER)),
            @Result(column="id",property="comments",
                   many=@Many(select="com.GL.dao.commentDao.allComment", fetchType= FetchType.EAGER))
    })
    public article findByArticleId(@Param("id")Integer id);

    @Select("<script>"+
            "SELECT * from article"+
            "<where>"+
            " <if test=\"page >-1\">limit #{page},#{size}</if>" +
            "</where>"+
            "</script>")

    public List<article> findAll(@Param("page")Integer page, @Param("size") Integer size);

    //根据条件精确查找
    @Select("<script>"+
            "SELECT * from article"+
            "<where>"+
            "1=1"+
            " <if test=\"aid != null\">and authorid=#{aid}</if>" +
            " <if test=\"plateid != null\">and plateid=#{plateid}</if>" +
            " <if test=\"id != null\">and id=#{id}</if>" +
            "</where>"+
            "</script>")
    public List<article> findByConditions(@Param("aid")Integer authorid,@Param("plateid")Integer plateid,@Param("id") Integer id);


    //模糊查询
    @Select("select * from article where username like concat('%',#{uname},'%')")
    public List<article> findFuzzy(@Param("uname")String name);


    //插入操作
    @Insert("Insert into article values (#{id},#{authorid},#{plateid},#{text},#{time},#{likenumber},#{browse},#{title},#{label})")
    public boolean insert(article article);

    //更新操作
    @Update("<script>"+
            "update article "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"authorid!=null\">authorid=#{authorid},</if>"+
            "<if test=\"plateid!=null\">plateid=#{plateid},</if>"+
            "<if test=\"text!=null\">text=#{text},</if>"+
            "<if test=\"time!=null\">time=#{time},</if>"+
            "<if test=\"likenumber!=null\">likenumber=#{likenumber},</if>"+
            "<if test=\"browse!=null\">browse=#{browse},</if>"+
            "<if test=\"title!=null\">title=#{title},</if>"+
            "<if test=\"label!=null\">label=#{label},</if>"+
            " </trim>"+
            "where id=#{id}"+
            "</script>"
    )
    public boolean update(article article);


    //删除
    @Delete("delete from  article where id=#{uid}")
    public void delete(@Param("uid") Integer id);


}
