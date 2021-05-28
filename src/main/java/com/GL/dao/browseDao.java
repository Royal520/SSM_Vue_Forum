package com.GL.dao;

import com.GL.domin.browse;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface browseDao {
    @Select("<script>"+
            "SELECT * from browse"+
            "<where>"+
            "1=1"+
            " <if test=\"userid != null\">and userid=#{userid}</if>" +
            " <if test=\"articleid != null\">and articleid=#{articleid}</if>" +
            "</where>"+
            " <if test=\"page != null and page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    @Results(id="browseMap",value = {
            @Result(id=true,column = "userid",property = "userid"),
            @Result(column="userid",property="user",
                one=@One(
                        select="com.GL.dao.userDao.findById",
                        fetchType= FetchType.LAZY
                )
            ),
            @Result(column="{id=articleid}",property="article",
                one=@One(
                        select="com.GL.dao.articleDao.findByConditions",
                        fetchType= FetchType.LAZY
                )
            ),

    })
    public List<browse> findBrowse(@Param("page") Integer page, @Param("size") Integer size, @Param("userid") Integer userid,@Param("articleid")Integer articleid);

    @Insert("insert into browse values (#{userid},#{articleid},#{like},#{collect}")
    public boolean insertBrowse(browse browse);

    @Update("<script>"+
            "update browse "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"like != null\">`like`=#{like},</if>"+
            "<if test=\"collect != null\">collect=#{collect},</if>"+
            " </trim>"+
            "where userid=#{userid} and articleid=#{articleid}"+
            "</script>")
    public boolean updateBrowse(browse browse);

}
