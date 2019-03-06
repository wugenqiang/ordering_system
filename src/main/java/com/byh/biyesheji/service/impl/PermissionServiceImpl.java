package com.byh.biyesheji.service.impl;

import com.byh.biyesheji.dao.PermissionMapper;
import com.byh.biyesheji.dao.RolePermissionMapper;
import com.byh.biyesheji.pojo.*;
import com.byh.biyesheji.service.PermissionService;
import com.byh.biyesheji.service.RoleService;
import com.byh.biyesheji.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    PermissionMapper permissionMapper;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;
    @Autowired
    RolePermissionMapper rolePermissionMapper;

    @Override
    public Set<String> listPermissions(String userName) {
        //保存权限的名字
        Set<String> result = new HashSet<>();
        //获得当前用户的所有角色实体
        List<Role> roles = roleService.listRoles(userName);
        //保存关联查询的记录（角色id==权限id的记录）
        List<RolePermission> rolePermissions = new ArrayList<>();
        //遍历角色
        for (Role role : roles) {
            RolePermissionExample example = new RolePermissionExample();
            //关联查询角色和权限  查询这个用户对应的角色id所对应的权限id
            example.createCriteria().andRidEqualTo(role.getId());
            List<RolePermission> rps= rolePermissionMapper.selectByExample(example);
            rolePermissions.addAll(rps);//添加所有权限到集合
        }
        //遍历关联查询后的记录  通过记录的权限id查询出对应的权限的名字
        for (RolePermission rolePermission : rolePermissions) {
            Permission p = permissionMapper.selectByPrimaryKey(rolePermission.getPid());
            if(p!=null){
                //保存权限名到set集合
                result.add(p.getName());
            }
        }
        return result;
    }



    @Override
    public List<Permission> list(Role role) {
        //保存所有的权限实体
        List<Permission> result = new ArrayList<>();
        RolePermissionExample example = new RolePermissionExample();
        example.createCriteria().andRidEqualTo(role.getId());
        //关联查询
        List<RolePermission> rps = rolePermissionMapper.selectByExample(example);
        //根据权限id获得权限 添加到result集合中
        for (RolePermission rolePermission : rps) {
            result.add(permissionMapper.selectByPrimaryKey(rolePermission.getPid()));
        }

        return result;
    }


    @Override
    public List<Permission> list() {
        PermissionExample example =new PermissionExample();
        example.setOrderByClause("id desc");
        return permissionMapper.selectByExample(example);
    }

    @Override
    public void add(Permission u) {
        permissionMapper.insert(u);
    }

    @Override
    public void delete(Long id) {
        permissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Permission u) {
        permissionMapper.updateByPrimaryKeySelective(u);
    }

    @Override
    public Permission get(Long id) {
        return permissionMapper.selectByPrimaryKey(id);
    }


    @Override
    public boolean needInterceptor(String requestURI) {
        List<Permission> ps = list();
        for (Permission p : ps) {
            if (p.getUrl().equals(requestURI))
                return true;
        }
        return false;
    }

    @Override
    public Set<String> listPermissionURLs(String userName) {
        Set<String> result = new HashSet<>();
        //获得当前管理员的角色列表
        List<Role> roles = roleService.listRoles(userName);

        List<RolePermission> rolePermissions = new ArrayList<>();
        //遍历角色列表  关联查询出每个角色对应的权限列表的记录
        for (Role role : roles) {
            RolePermissionExample example = new RolePermissionExample();
            example.createCriteria().andRidEqualTo(role.getId());
            List<RolePermission> rps = rolePermissionMapper.selectByExample(example);
            rolePermissions.addAll(rps);
        }

        //根据关联表的记录查询出具体对应的权限维护的url
        for (RolePermission rolePermission : rolePermissions) {
            Permission p = permissionMapper.selectByPrimaryKey(rolePermission.getPid());
            if(p!=null){
                result.add(p.getUrl());
            }
        }

        return result;
    }




}
