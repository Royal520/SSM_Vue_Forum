package com.GL.domin;


import java.util.List;

public class plate {
    private int id;
    private String name;
    private String introduce;
    private int sort;
    private int statu;
    private List<article> articles;

    public List<article> getArticles() {
        return articles;
    }

    public void setArticles(List<article> articles) {
        this.articles = articles;
    }

    public int getStatu() {
        return statu;
    }

    public void setStatu(int statu) {
        this.statu = statu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "plate{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduce='" + introduce + '\'' +
                ", sort=" + sort +
                ", statu=" + statu +
                ", articles=" + articles +
                '}';
    }
}
