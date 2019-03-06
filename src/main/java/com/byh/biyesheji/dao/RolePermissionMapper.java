package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.RolePermission;
import com.byh.biyesheji.pojo.RolePermissionExample;

import java.util.List;

public interface RolePermissionMapper extends SysDao<RolePermission>{

    List<RolePermission> selectByExample(RolePermissionExample example);

}