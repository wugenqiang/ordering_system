package com.byh.biyesheji.service.impl;

import com.byh.biyesheji.dao.UserRoleMapper;
import com.byh.biyesheji.pojo.User;
import com.byh.biyesheji.pojo.UserRole;
import com.byh.biyesheji.pojo.UserRoleExample;
import com.byh.biyesheji.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceimpl implements UserRoleService {

    @Autowired
    UserRoleMapper userRoleMapper;

    @Override
    public void setRoles(User user, long[] roleIds) {
        //删除当前管理员所有的角色
        UserRoleExample example= new UserRoleExample();
        example.createCriteria().andUidEqualTo(user.getId());

        List<UserRole> urs= userRoleMapper.selectByExample(example);

        for (UserRole userRole : urs)
            userRoleMapper.deleteByPrimaryKey(userRole.getId());

        //设置新的角色关系
        if(null!=roleIds)
            for (long rid : roleIds) {
                UserRole userRole = new UserRole();
                userRole.setRid(rid);
                userRole.setUid(user.getId());//插入管理员新的所有权限
                userRoleMapper.insert(userRole);
            }
    }

    @Override
    public void deleteByUser(long userId) {
        UserRoleExample example= new UserRoleExample();
        example.createCriteria().andUidEqualTo(userId);
        List<UserRole> urs= userRoleMapper.selectByExample(example);//urs:传进来的管理员的id去作为条件查询UserRole表的记录的集合
        for (UserRole userRole : urs) {//依次删除记录
            userRoleMapper.deleteByPrimaryKey(userRole.getId());
        }
    }

    @Override
    public void deleteByRole(long roleId) {
        UserRoleExample example= new UserRoleExample();
        example.createCriteria().andRidEqualTo(roleId);
        List<UserRole> urs= userRoleMapper.selectByExample(example);//查询UserRole表为角色id的记录  下面删除
        for (UserRole userRole : urs) {
            userRoleMapper.deleteByPrimaryKey(userRole.getId());
        }
    }
}
