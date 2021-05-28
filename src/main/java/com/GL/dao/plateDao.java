package com.GL.dao;

import com.GL.domin.article;
import com.GL.domin.plate;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface plateDao {
    @Select("<script>"+
            "SELECT * from plate"+
                        " <if test=\"page >-1\">limit #{page},#{size}</if>" +
            "</script>")
    public  List<plate> findAll(@Param("page")Integer page,@Param("size") Integer size);

//根据条件精确查找
    @Select("<script>"+
            "SELECT * from plate"+
            "<where>"+
            "1=1"+
            " <if test=\"pid != null\">and id=#{pid}</if>" +
            " <if test=\"pname != null\">and name=#{pname}</if>" +
            "</where>"+
            "</script>")
    public plate findByConditions(@Param("pid")Integer id,@Param("pname")String name);

    //模糊查询
    @Select("select * from plate where name like concat('%',#{pname},'%')")
    public List<plate> findFuzzy(@Param("pname")String name);


    //插入操作
    @Insert("Insert into plate values (#{id},#{name},#{introduce},#{sort},#{statu})")
    public void insert(plate plate);

    //更新操作
    @Update("<script>"+
            "update plate "+
            "<trim prefix=\"set\" suffixOverrides=\",\">"+
            "<if test=\"name!=null\">name=#{name},</if>"+
            "<if test=\"introduce!=null\">introduce=#{introduce},</if>"+
            "<if test=\"sort!=null\">sort=#{sort},</if>"+
            "<if test=\"statu!=null\">statu=#{statu},</if>"+
            " </trim>"+
            "where id=#{id}"+
            "</script>"
    )
    public boolean update(plate plate);


    //删除
    @Delete("update plate set statu=-1 where id=#{id}")
    public void delete(@Param("id") Integer id);


//    查找板块文章
    @Select("select * from plate where id=#{id}")
    @Results(id="articleMap",value = {
            @Result(column="{plateid=id}",property="articles",
                    many=@Many(
                            select="com.GL.dao.articleDao.findByConditions",
                            fetchType= FetchType.LAZY
                    )
            )
    })
    plate getArticlesByplateid(@Param("id") Integer id);
}
