package com.GL.domin;

public class userstatus {

    private Integer id;
    private String Name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @Override
    public String toString() {
        return "userstatus{" +
                "id=" + id +
                ", Name='" + Name + '\'' +
                '}';
    }
}
