package com.GL.domin;

import java.util.List;

public class focus {
    private Integer bloggerid;
    private Integer fansid;
    private Integer status;
    private Integer sort;
    private user bloggerUser; //多对一
    private user fansUser; // 多对一

    public focus(Integer bloggerid, Integer fansid, Integer status, Integer sort) {
        this.bloggerid = bloggerid;
        this.fansid = fansid;
        this.status = status;
        this.sort = sort;
    }

    public user getBloggerUser() {
        return bloggerUser;
    }

    public void setBloggerUser(user bloggerUser) {
        this.bloggerUser = bloggerUser;
    }

    public user getFansUser() {
        return fansUser;
    }

    public void setFansUser(user fansUser) {
        this.fansUser = fansUser;
    }

    public Integer getBloggerid() {
        return bloggerid;
    }

    public void setBloggerid(Integer bloggerid) {
        this.bloggerid = bloggerid;
    }

    public Integer getFansid() {
        return fansid;
    }

    public void setFansid(Integer fansid) {
        this.fansid = fansid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String toString() {
        return "focus{" +
                "bloggerid=" + bloggerid +
                ", fansid=" + fansid +
                ", status=" + status +
                ", sort=" + sort +
                ", bloggerUser=" + bloggerUser +
                ", fansUser=" + fansUser +
                '}';
    }
}
