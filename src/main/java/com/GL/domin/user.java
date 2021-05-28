package com.GL.domin;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.List;

public class user {
    private int id;
    private String username;
    private String password;
    private String mail;
    private String phone;
    private int levelid;
    private String uuid;
    private Date time;
    private int stateid;
    private List<focus> fans;
    private List<focus> focus;
    private List<comment> comments;
    private List<comment> replys;
    private List<article> articles;
    private List<browse> browses;
    private userstatus status;
    private userlevel level;

    public userstatus getStatus() {
        return status;
    }

    public void setStatus(userstatus status) {
        this.status = status;
    }

    public userlevel getLevel() {
        return level;
    }

    public void setLevel(userlevel level) {
        this.level = level;
    }

    public List<browse> getBrowses() {
        return browses;
    }

    public void setBrowses(List<browse> browses) {
        this.browses = browses;
    }

    public List<focus> getFans() {
        return fans;
    }

    public void setFans(List<focus> fans) {
        this.fans = fans;
    }

    public List<focus> getFocus() {
        return focus;
    }

    public void setFocus(List<focus> focus) {
        this.focus = focus;
    }

    public List<comment> getComments() {
        return comments;
    }

    public void setComments(List<comment> comments) {
        this.comments = comments;
    }

    public List<comment> getReplys() {
        return replys;
    }

    public void setReplys(List<comment> replys) {
        this.replys = replys;
    }

    public List<article> getArticles() {
        return articles;
    }

    public void setArticles(List<article> articles) {
        this.articles = articles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getLevelid() {
        return levelid;
    }

    public void setLevelid(int levelid) {
        this.levelid = levelid;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public Date getTime() {
        return time;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public void setTime(Date time) {
        this.time = time;
    }

    public int getStateid() {
        return stateid;
    }

    public void setStateid(int stateid) {
        this.stateid = stateid;
    }

    @Override
    public String toString() {
        return "user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", mail='" + mail + '\'' +
                ", phone='" + phone + '\'' +
                ", levelid=" + levelid +
                ", uuid='" + uuid + '\'' +
                ", time=" + time +
                ", stateid=" + stateid +
                ", fans=" + fans +
                ", focus=" + focus +
                ", comments=" + comments +
                ", replys=" + replys +
                ", articles=" + articles +
                ", browses=" + browses +
                ", status=" + status +
                ", level=" + level +
                '}';
    }
}
