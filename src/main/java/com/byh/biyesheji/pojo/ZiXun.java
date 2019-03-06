package com.byh.biyesheji.pojo;

import java.util.Date;

public class ZiXun {
    private Integer id;

    private String content;

    private Integer cstid;

    private Integer status;

    private Date fabudate;

    private Customer customer;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCstid() {
        return cstid;
    }

    public void setCstid(Integer cstid) {
        this.cstid = cstid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getFabudate() {
        return fabudate;
    }

    public void setFabudate(Date fabudate) {
        this.fabudate = fabudate;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "ZiXun{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", cstid=" + cstid +
                ", status=" + status +
                ", fabudate=" + fabudate +
                ", customer=" + customer +
                '}';
    }
}