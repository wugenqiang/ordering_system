package com.byh.biyesheji.controller;

import com.byh.biyesheji.pojo.Permission;
import com.byh.biyesheji.pojo.Role;
import com.byh.biyesheji.service.PermissionService;
import com.byh.biyesheji.service.RolePermissionService;
import com.byh.biyesheji.service.RoleService;
import com.byh.biyesheji.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员角色controler
 */
@Controller
@RequestMapping("/config")
public class RoleController {
    @Autowired
    RoleService roleService;
    @Autowired
    RolePermissionService rolePermissionService;
    @Autowired
    PermissionService permissionService;

    @RequestMapping("/addRoleUI")
    public String addRole(){

        return "syspage/admin-role-add";
    }

    @RequestMapping("/listRole")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());//分页查询
        List<Role> rs= roleService.list();
        int total = (int) new PageInfo<>(rs).getTotal();//总条数
        page.setTotal(total);

        model.addAttribute("rs", rs);

        model.addAttribute("roleSize",total);

        Map<Role,List<Permission>> role_permissions = new HashMap<>();
         
        for (Role role : rs) {
            List<Permission> ps = permissionService.list(role);
            role_permissions.put(role, ps);
        }
        model.addAttribute("role_permissions", role_permissions);

        return "syspage/admin-role";
    }

    @RequestMapping("/editRole")
    public String list(Model model, long id){
        Role role =roleService.get(id);
        model.addAttribute("role", role);
        //所有权限
        List<Permission> ps = permissionService.list();
        model.addAttribute("ps", ps);
        //当前管理员拥有的权限
        List<Permission> currentPermissions = permissionService.list(role);
        model.addAttribute("currentPermissions", currentPermissions);

        return "syspage/admin-role-edit";
    }

    @RequestMapping("/updateRole")
    public String update(Role role,long[] permissionIds){
        rolePermissionService.setPermissions(role, permissionIds);
        roleService.update(role);
        return "redirect:listRole";
    }
 
    @RequestMapping("/addRole")
    public String list(Model model, Role role){
        roleService.add(role);
        return "redirect:listRole";
    }

    @RequestMapping("/deleteRole")
    public String delete(Model model, long id){
        roleService.delete(id);
        return "redirect:listRole";
    }   
 
}