package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.Category;
import com.byh.biyesheji.pojo.CategoryExample;

import java.util.List;

public interface CategoryMapper extends CrudDao<Category>{

     List<Category> selectByExample(CategoryExample example);

}