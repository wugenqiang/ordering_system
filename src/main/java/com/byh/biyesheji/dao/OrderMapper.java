package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.Order;
import com.byh.biyesheji.pojo.OrderExample;

import java.util.List;

public interface OrderMapper extends CrudDao<Order>{

    List<Order> selectByExample(OrderExample example);

}