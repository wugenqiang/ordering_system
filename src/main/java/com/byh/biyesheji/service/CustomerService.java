package com.byh.biyesheji.service;

import com.byh.biyesheji.pojo.Customer;

public interface CustomerService extends CrudService<Customer>{

    /**
     * 返回登陆的用户
     * @param customer
     * @return
     */
    public Customer foreLogin(Customer customer);

    /**
     * 设置会员
     * @param id
     */
    public void shezhihuiyuan(int id);



}
