package com.byh.biyesheji.service.impl;

import com.byh.biyesheji.dao.CustomerMapper;
import com.byh.biyesheji.dao.ProductMapper;
import com.byh.biyesheji.dao.ReviewMapper;
import com.byh.biyesheji.pojo.*;
import com.byh.biyesheji.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Review> list() {
        List<Review> reviews = reviewMapper.selectByExample(null);
        for (Review review:reviews){
            Customer customer = customerMapper.selectByPrimaryKey(review.getCstid());
            Product product = productMapper.selectByPrimaryKey(review.getPid());
            review.setCustomer(customer);
            review.setProduct(product);
        }
        return reviews;
    }

    @Override
    public List<Review> getReviewListByPid(int id) {
        ReviewExample example = new ReviewExample();
        example.createCriteria().andPidEqualTo(id);
        List<Review> reviews = reviewMapper.selectByExample(example);
        for (Review review:reviews){
            Customer customer = customerMapper.selectByPrimaryKey(review.getCstid());
            review.setCustomer(customer);
        }

        return reviews;
    }

    @Override
    public void del(int id) {
        reviewMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Review get(int id) {
        return reviewMapper.selectByPrimaryKey(id);
    }

    @Override
    public void save(Review review) {
        reviewMapper.insert(review);
    }
}
