package com.byh.biyesheji.service;

import java.util.List;

public interface CrudService<T> {

    /**
     * 所有数据
     * @return
     */
    public List<T> list();

    /**
     * 保存数据
     * @param entity
     */
    public void save(T entity);

    /**
     * 删除数据
     * @param id
     */
    public void del(int id);

    /**
     * 获得单条数据
     * @param id
     * @return
     */
    T get(int id);

}
