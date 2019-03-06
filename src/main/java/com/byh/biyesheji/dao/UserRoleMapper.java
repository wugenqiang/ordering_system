package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.UserRole;
import com.byh.biyesheji.pojo.UserRoleExample;

import java.util.List;

public interface UserRoleMapper extends SysDao<UserRole>{

    List<UserRole> selectByExample(UserRoleExample example);

}