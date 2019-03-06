package com.byh.biyesheji.service.impl;


import com.byh.biyesheji.dao.RoleMapper;
import com.byh.biyesheji.dao.UserRoleMapper;
import com.byh.biyesheji.pojo.*;
import com.byh.biyesheji.service.RoleService;
import com.byh.biyesheji.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    UserRoleMapper userRoleMapper;
    @Autowired
    UserService userService;

    @Override  //name的所有角色
    public Set<String> listRoleNames(String userName) {
        Set<String> result = new HashSet<>();
        //查出管理员相应的角色
        List<Role> roles = listRoles(userName);
        //把每个角色名放到set集合中
        for (Role role : roles) {
            result.add(role.getName());
        }
        return result;
    }

    @Override  //查出管理员相应的角色
    public List<Role> listRoles(String userName) {
        List<Role> roles = new ArrayList<>();
        //通过name获得user实体
        User user = userService.getByName(userName);
        if(null==user)
            return roles;
        roles = listRoles(user);//调用下面的方法
        return roles;
    }

    @Override  //查出管理员相应的角色
    public List<Role> listRoles(User user) {
        List<Role> roles = new ArrayList<>();
        //通过管理员id获取管理员的角色
        UserRoleExample example = new UserRoleExample();
        example.createCriteria().andUidEqualTo(user.getId());
        List<UserRole> userRoles = userRoleMapper.selectByExample(example);//关联查询  查出用户id对应的角色id的记录

        //通过关联查询 ，查出表Role的给出指定主键id的记录
        for (UserRole userRole : userRoles){
            Role role = roleMapper.selectByPrimaryKey(userRole.getRid());
            roles.add(role);
        }
        return roles;
    }

    @Override
    public List<Role> list() {
        RoleExample example =new RoleExample();
        example.setOrderByClause("id desc");
        return roleMapper.selectByExample(example);
    }

    @Override
    public void add(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public void delete(Long id) {
        roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Role get(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
    }
}
