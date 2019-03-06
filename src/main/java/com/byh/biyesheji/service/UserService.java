package com.byh.biyesheji.service;

import com.byh.biyesheji.pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 获得密码
     * @param name 管理员名字
     * @return
     */
    public String getPassword(String name);

    /**
     * 获得管理员实体
     * @param name 管理员名字
     * @return
     */
    public User getByName(String name);

    /**
     * 管理员列表
     * @return
     */
    public List<User> list();

    /**
     * 添加管理员
     * @param user
     */
    public void add(User user);

    /**
     * 删除管理员
     * @param id
     */
    public void delete(Long id);

    /**
     * 获得一个管理员
     * @param id
     * @return
     */
    public User get(Long id);

    /**
     * 更新一个管理员
     * @param user
     */
    public void update(User user);

    /**
     * 管理员启用
     * @param name
     * @return
     */
    public String enableStatus(String name);

    /**
     * 管理员禁用
     * @param name
     * @return
     */
    public String stopStatus(String name);

    /**
     * 根据商品id获得所属商家（管理员即商家）
     * @param id
     * @return
     */
    public User getUserByPid(int id);
}
