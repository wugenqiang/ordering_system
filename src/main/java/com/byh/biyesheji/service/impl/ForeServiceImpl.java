package com.byh.biyesheji.service.impl;

import com.byh.biyesheji.dao.CategoryMapper;
import com.byh.biyesheji.dao.ProductMapper;
import com.byh.biyesheji.pojo.Category;
import com.byh.biyesheji.pojo.CategoryExample;
import com.byh.biyesheji.pojo.Product;
import com.byh.biyesheji.service.ForeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForeServiceImpl implements ForeService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Category> listToThree() {
        CategoryExample example = new CategoryExample();
        example.createCriteria().andIdBetween(1,4); //从1开始计数
        List<Category> categories = categoryMapper.selectByExample(example);
        return categories;
    }

    @Override
    public List<Product> getFivePro() {
        return productMapper.randFive();
    }


}
