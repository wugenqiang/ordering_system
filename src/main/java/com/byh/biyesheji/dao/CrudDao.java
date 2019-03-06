package com.byh.biyesheji.dao;

/**
 * 公共dao层方法
 * @param <T>
 */
public interface CrudDao<T> {

    /**
     * 删除数据
     * @param id
     * @return
     */
    public int deleteByPrimaryKey(int id);

    /**
     * 插入数据
     * @param entity
     * @return
     */
    public int insert(T entity);

    /**
     * 动态保存数据
     * @param entity
     * @return
     */
    public int insertSelective(T entity);

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    public T selectByPrimaryKey(int id);

    /**
     * 更新数据
     * @param entity
     * @return
     */
    public int updateByPrimaryKey(T entity);

    /**
     * 动态更新
     * @param entity
     * @return
     */
    public int updateByPrimaryKeySelective(T entity);


}
