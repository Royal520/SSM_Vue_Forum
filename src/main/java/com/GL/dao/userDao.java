package com.GL.dao;

import com.GL.domin.plate;
import com.GL.domin.user;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface userDao {
    @Select("<script>"+
            "SELECT * from user"+
            " <if test=\"page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    public List<user> findAll(@Param("page")Integer page, @Param("size") Integer size);

    //根据条件精确查找
    @Select("<script>"+
            "SELECT * from user"+
            "<where>"+
            "1=1"+
            " <if test=\"id != null\">and id=#{id}</if>" +
            " <if test=\"name != null\">and username=#{name}</if>" +
            "</where>"+
            "</script>")
    public user findByConditions(@Param("id")Integer id,@Param("name")String name);

    @Select("select * from user where id=#{id}")
    public user findById(@Param("id") Integer id);


    @Select("select username from user where id=#{id}")
    public String getDetailById(@Param("id") Integer id);
    //模糊查询
    @Select("select * from user where username like concat('%',#{uname},'%')")
    public List<user> findFuzzy(@Param("uname")String name);


    //插入操作
    @Insert("Insert into user values (#{id},#{username},#{password},#{mail},#{phone},#{levelid},#{uuid},#{time},#{stateid})")
    public boolean insert(user user);

    //更新操作
    @Update("<script>"+
            "update user "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"username!=null\">username=#{username},</if>"+
            "<if test=\"password!=null\">password=#{password},</if>"+
            "<if test=\"mail!=null\">mail=#{mail},</if>"+
            "<if test=\"phone!=null\">phone=#{phone},</if>"+
            "<if test=\"levelid!=null\">levelid=#{levelid},</if>"+
            "<if test=\"time!=null\">time=#{time},</if>"+
            "<if test=\"stateid!=null\">stateid=#{stateid},</if>"+
            " </trim>"+
            "where id=#{id}"+
            "</script>"
    )
    public boolean update(user user);


    //删除
    @Delete("delete from  user where id=#{uid}")
    public boolean delete(@Param("uid") Integer id);
}
