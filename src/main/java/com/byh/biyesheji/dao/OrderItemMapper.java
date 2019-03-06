package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.OrderItem;
import com.byh.biyesheji.pojo.OrderItemExample;

import java.util.List;

public interface OrderItemMapper extends CrudDao<OrderItem>{

    List<OrderItem> selectByExample(OrderItemExample example);

}