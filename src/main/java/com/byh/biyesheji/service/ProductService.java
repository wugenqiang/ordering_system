package com.byh.biyesheji.service;

import com.byh.biyesheji.pojo.Category;
import com.byh.biyesheji.pojo.Product;
import com.byh.biyesheji.pojo.ProductVO;
import com.byh.biyesheji.pojo.User;

import java.util.List;

public interface ProductService extends CrudService<Product>{

    /**
     * 商品上线
     * @param name
     * @return
     */
   public String enableStatus(String name);

    /**
     * 商品下线
     * @param name
     * @return
     */
   public String stopStatus(String name);

    /**
     * 设置商品图片保存位置
     * @param vo
     */
   public void setImageURL(ProductVO vo);

    /**
     * 获得分类实体
     * @param id 分类id
     * @return
     */
   public Category getCategoryByCid(int id);

    /**
     * 更新商品
     * @param product
     */
   public void update(Product product);

    /**
     *  获取分类下的所有上线商品列表
     * @param id
     * @return
     */
   public List<Product> getProductsByCid(Integer id);

    /**
     * 获得商品所属商家
     * @param id 商家id
     * @return
     */
   public User getUserByBid(long id);

    /**
     * 模糊搜索
     * @param pName 商品name
     * @return 商品集合
     */
   public List<Product> findByName(String pName);

    /**
     *
     * @param cid
     * @return
     */
   public List<Product> findByCid(int cid);

   public boolean findProByCid(int id);

}
