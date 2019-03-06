package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.Permission;
import com.byh.biyesheji.pojo.PermissionExample;

import java.util.List;

public interface PermissionMapper extends SysDao<Permission>{

    List<Permission> selectByExample(PermissionExample example);

}