package com.byh.biyesheji.service.impl;

import com.byh.biyesheji.dao.OrderItemMapper;
import com.byh.biyesheji.pojo.Order;
import com.byh.biyesheji.pojo.OrderItem;
import com.byh.biyesheji.pojo.OrderItemExample;
import com.byh.biyesheji.pojo.Product;
import com.byh.biyesheji.service.OrderItemService;
import com.byh.biyesheji.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;

    @Override
    public void save(OrderItem c) {
        orderItemMapper.insert(c);
    }

    @Override
    public void del(int id) {
        orderItemMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(OrderItem c) {
        orderItemMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public OrderItem get(int id) {
        OrderItem result = orderItemMapper.selectByPrimaryKey(id);
        setProduct(result);
        return result;
    }

    public List<OrderItem> list(){
        OrderItemExample example =new OrderItemExample();
        example.setOrderByClause("id asc");
        return orderItemMapper.selectByExample(example);

    }

    @Override
    public void fill(List<Order> os) {
        for (Order o :os){
            fill(o);
        }
    }
    /*
    1. 根据订单id查询出其对应的所有订单项
    2. 通过setProduct为所有的订单项设置Product属性
    3. 遍历所有的订单项，然后计算出该订单的总金额和总数量
    4. 最后再把订单项设置在订单的orderItems属性上。
     */
    @Override
    public void fill(Order o) {
        OrderItemExample example = new OrderItemExample();
        example.createCriteria().andOidEqualTo(o.getId());
        example.setOrderByClause("id asc");
        List<OrderItem> ois = orderItemMapper.selectByExample(example);//查出当前订单下的所有订单项
        setProduct(ois);//现在当前订单的每个订单项都有商品属性

        float total = 0;//该订单总金额
        int totalNumber = 0;//该订单总数
        for (OrderItem oi :ois){
            total+=oi.getNumber()*oi.getProduct().getPrice();//数量 * 单价
            totalNumber+=oi.getNumber();
        }
        o.setTotal(total); //设置总金额
        o.setTotalNumber(totalNumber);
        o.setOrderItems(ois); //当前订单的订单项

    }
    //给当前订单下每个订单项设置商品
    private void setProduct(List<OrderItem> ois) {
        for (OrderItem oi: ois) {
            setProduct(oi);
        }
    }
    //给订单项设置商品
    private void setProduct(OrderItem oi) {
        Product p = productService.get(oi.getPid());
        oi.setProduct(p);
    }

    @Override
    public List<OrderItem> listByCustomer(int cstid) {//根据用户id查询orderitem表中oid为空的集合
        OrderItemExample example =new OrderItemExample();
        example.createCriteria().andCstidEqualTo(cstid).andOidIsNull();
        List<OrderItem> result = orderItemMapper.selectByExample(example);
        setProduct(result);
        return result;
    }
}
