package com.GL.dao;

import com.GL.domin.admin;
import com.GL.domin.user;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface adminDao {
    @Select("<script>"+
            "SELECT * from admin"+
            " <if test=\"page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    public List<admin> findAll(@Param("page")Integer page, @Param("size") Integer size);

    //根据条件精确查找
    @Select("<script>"+
            "SELECT * from admin"+
            "<where>"+
            "1=1"+
            " <if test=\"uid != null\">and id=#{uid}</if>" +
            " <if test=\"account != null\">and account=#{account}</if>" +
            "</where>"+
            "</script>")
    public admin findByConditions(@Param("uid")Integer id,@Param("account")String account);

    //模糊查询
    @Select("select * from admin where account like concat('%',#{uname},'%')")
    public List<admin> findFuzzy(@Param("uname")String name);


    //插入操作
    @Insert("Insert into admin values (#{id},#{account},#{lastTime},#{ip})")
    public void insert(admin admin);

    //更新操作
    @Update("<script>"+
            "update admin "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"account!=null\">account=#{account},</if>"+
            "<if test=\"lastTime!=null\">lastTime=#{lastTime},</if>"+
            "<if test=\"ip!=null\">ip=#{ip},</if>"+
            " </trim>"+
            "where id=#{id}"+
            "</script>"
    )
    public boolean update(admin admin);


    //删除
    @Delete("delete from  admin where id=#{uid}")
    public void delete(@Param("uid") Integer id);
}
