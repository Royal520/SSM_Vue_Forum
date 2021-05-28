package com.GL.dao;

import com.GL.domin.focus;
import com.GL.domin.user;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface focusDao {
//    根据bloggerid 查粉丝
//    根据fansid 查关注数目
//    实现多对一
    @Select("<script>"+
            "SELECT * from focus"+
            "<where>"+
            "1=1"+
            " <if test=\"bloggerid != null\">and bloggerid=#{bloggerid}</if>" +
            " <if test=\"fansid != null\">and fansid=#{fansid}</if>" +
            "</where>"+
            " <if test=\"page != null and page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    @Results(id="focusMap",value = {
            @Result(id=true,column = "bloggerid",property = "bloggerid"),
            @Result(id=true,column = "fansid",property = "fansid"),
            @Result(column = "bloggerid" ,property = "bloggerUser",
                    one=@One(
                    select="com.GL.dao.userDao.findById",
                    fetchType= FetchType.LAZY)
            ),
            @Result(column = "fansid" ,property = "fansUser",
                    one=@One(
                            select="com.GL.dao.userDao.findById",
                            fetchType= FetchType.LAZY)
            )
    })
    public List<focus> findById(@Param("page") Integer page, @Param("size") Integer size, @Param("bloggerid") Integer bloggerid, @Param("fansid") Integer fansid);

    @Update("<script>"+
            "update focus "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"status!=null\">status=#{status},</if>"+
            "<if test=\"sort!=null\">sort=#{sort},</if>"+
            " </trim>"+
            "where bloggerid=#{bloggerid} and fansid=#{fansid}"+
            "</script>")
    public boolean updateFocus(focus focus);

    @Insert("insert into focus values(#{blogerid},#{fansid},#{status},#{sort})")
    public boolean insertFocus(focus focus);

    @Delete("delete from focus where bloggerid=#{bloggerid} and fansid=#{fansid}")
    public boolean deleteFocus(@Param("bloggerid") Integer bloggerid,@Param("fansid")Integer fansid);

}
