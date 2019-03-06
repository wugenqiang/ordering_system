package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.Role;
import com.byh.biyesheji.pojo.RoleExample;

import java.util.List;

public interface RoleMapper extends SysDao<Role> {

    List<Role> selectByExample(RoleExample example);

}