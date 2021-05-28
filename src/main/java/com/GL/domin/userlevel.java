package com.GL.domin;

public class userlevel {
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
        return "userlevel{" +
                "id=" + id +
                ", Name='" + Name + '\'' +
                '}';
    }
}
