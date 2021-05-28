package com.GL.domin;

import org.springframework.context.annotation.Bean;

public class browse {
    private Integer userid;
    private Integer articleid;
    private Integer like;  //喜欢为1
    private Integer collect; //收藏为1
    private user user;
    private article article;

    public browse(Integer userid, Integer articleid, Integer like, Integer collect) {
        this.userid = userid;
        this.articleid = articleid;
        this.like = like;
        this.collect = collect;
    }

    public article getArticle() {
        return article;
    }

    public void setArticle(article article) {
        this.article = article;
    }

    public user getUser() {
        return user;
    }

    public void setUser(user user) {
        this.user = user;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    public Integer getLike() {
        return like;
    }

    public void setLike(Integer like) {
        this.like = like;
    }

    public Integer getCollect() {
        return collect;
    }

    public void setCollect(Integer collect) {
        this.collect = collect;
    }

    @Override
    public String toString() {
        return "browse{" +
                "userid=" + userid +
                ", articleid=" + articleid +
                ", like=" + like +
                ", collect=" + collect +
                ", user=" + user +
                ", article=" + article +
                '}';
    }
}
