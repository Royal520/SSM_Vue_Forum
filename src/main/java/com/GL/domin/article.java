package com.GL.domin;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class article {
    private Integer id;
    private Integer authorid;
    private Integer plateid;
    private String text;
    private Date time;
    private Integer likenumber;
    private Integer browse;
    private String title;
    private String label;

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    private user user;
    private List<comment> comments;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }




    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAuthorid() {
        return authorid;
    }

    public void setAuthorid(Integer authorid) {
        this.authorid = authorid;
    }

    public Integer getPlateid() {
        return plateid;
    }

    public void setPlateid(Integer plateid) {
        this.plateid = plateid;
    }

    public Integer getLikenumber() {
        return likenumber;
    }

    public void setLikenumber(Integer likenumber) {
        this.likenumber = likenumber;
    }

    public Integer getBrowse() {
        return browse;
    }

    public void setBrowse(Integer browse) {
        this.browse = browse;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }



    public user getUser() {
        return user;
    }

    public void setUser(user user) {
        this.user = user;
    }

    public List<comment> getComments() {
        return comments;
    }

    public void setComments(List<comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "article{" +
                "id=" + id +
                ", authorid=" + authorid +
                ", plateid=" + plateid +
                ", text='" + text + '\'' +
                ", time=" + time +
                ", likenumber=" + likenumber +
                ", browse=" + browse +
                ", title='" + title + '\'' +
                ", label='" + label + '\'' +
                ", user=" + user +
                ", comments=" + comments +
                '}';
    }
}
