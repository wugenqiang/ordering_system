package com.byh.biyesheji.dao;

/**
 * 管理员模块公共方法
 * @param <T>
 */
public interface SysDao<T> {
    /**
     * 删除数据
     * @param id
     * @return
     */
    public int deleteByPrimaryKey(Long id);

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
    public T selectByPrimaryKey(Long id);

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
