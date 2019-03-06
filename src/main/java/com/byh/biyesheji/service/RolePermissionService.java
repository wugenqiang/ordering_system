package com.byh.biyesheji.service;

import com.byh.biyesheji.pojo.Role;

public interface RolePermissionService {

    /**
     * 设置角色能拥有的权限
     * @param role 角色
     * @param permissionIds 权限ids
     */
    public void setPermissions(Role role, long[] permissionIds);

    /**
     * 根据角色id删除角色下的所有权限
     * @param roleId
     */
    public void deleteByRole(long roleId);

    /**
     * 根据权限id删除一条权限
     * @param permissionId
     */
    public void deleteByPermission(long permissionId);
}
