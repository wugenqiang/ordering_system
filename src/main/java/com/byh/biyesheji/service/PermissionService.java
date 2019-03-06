package com.byh.biyesheji.service;

import com.byh.biyesheji.pojo.Permission;
import com.byh.biyesheji.pojo.Role;

import java.util.List;
import java.util.Set;

public interface PermissionService {

    /**
     * 获得当前管理员的权限列表
     * @param userName 管理员名字
     * @return
     */
    public Set<String> listPermissions(String userName);

    /**
     * 所有存在数据库的权限集合
     * @return
     */
    public List<Permission> list();

    /**
     * 添加权限
     * @param permission
     */
    public void add(Permission permission);

    /**
     * 删除权限
     * @param id 权限id
     */
    public void delete(Long id);

    /**
     * 获得一条权限
     * @param id 权限id
     * @return
     */
    public Permission get(Long id);

    /**
     * 更新权限信息
     * @param permission
     */
    public void update(Permission permission);

    /**
     * 根据角色获取权限
     * @param role
     * @return
     */
    public List<Permission> list(Role role);

    /**
     * 查询传入的url是否被维护
     * @param requestURI
     * @return 有？true：false
     */
    public boolean needInterceptor(String requestURI);

    /**
     * 获得对应管理员的拥有角色的权限能访问的url
     * @param userName
     * @return
     */
    public Set<String> listPermissionURLs(String userName);
}
