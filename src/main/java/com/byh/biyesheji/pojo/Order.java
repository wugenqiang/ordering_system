package com.byh.biyesheji.pojo;
import java.util.List;

public class Order {

    private Integer id;

    private String code;//订单编号

    private String address;

    private Integer status;

    private Integer cstid;

    private List<OrderItem> orderItems;

    private Customer customer;

    private float total;  //总价

    private int totalNumber; //总数量

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCstid() {
        return cstid;
    }

    public void setCstid(Integer cstid) {
        this.cstid = cstid;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", address='" + address + '\'' +
                ", status=" + status +
                ", cstid=" + cstid +
                ", orderItems=" + orderItems +
                ", customer=" + customer +
                ", total=" + total +
                ", totalNumber=" + totalNumber +
                '}';
    }
}