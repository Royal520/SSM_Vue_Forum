package com.GL.domin;

import java.util.Date;

public class admin {
    private Integer id;
    private String account;
    private Date lastTime;
    private String ip;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Override
    public String toString() {
        return "admin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", lastTime=" + lastTime +
                ", ip='" + ip + '\'' +
                '}';
    }
}
