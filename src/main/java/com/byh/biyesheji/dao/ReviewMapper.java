package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.Review;
import com.byh.biyesheji.pojo.ReviewExample;

import java.util.List;

public interface ReviewMapper extends CrudDao<Review>{

    List<Review> selectByExample(ReviewExample example);

}