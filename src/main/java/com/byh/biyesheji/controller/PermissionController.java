package com.byh.biyesheji.controller;

import com.byh.biyesheji.pojo.Permission;
import com.byh.biyesheji.service.PermissionService;
import com.byh.biyesheji.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 权限模块controller
 */
@Controller
@RequestMapping("/config")
public class PermissionController {
    @Autowired
    PermissionService permissionService;

    /**
     * 添加权限页面
     * @return
     */
    @RequestMapping("/adminPerAddUI")
    public String addUI(){
        return "syspage/admin-permission-add";
    }

    /**
     * 权限列表
     * @param model
     * @param page
     * @return
     */
    @RequestMapping("/listPermission")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());//分页查询
        List<Permission> ps= permissionService.list();
        int total = (int) new PageInfo<>(ps).getTotal();//总条数
        page.setTotal(total);

        model.addAttribute("ps", ps);
        model.addAttribute("perCount",ps.size());
        return "syspage/admin-permission";
    }

    @RequestMapping("/editPermission")
    public String list(Model model, long id){
        Permission permission =permissionService.get(id);
        model.addAttribute("permission", permission);
        return "syspage/admin-permission-edit";
    }

    @RequestMapping("/updatePermission")
    public String update(Permission permission){
        permissionService.update(permission);
        return "redirect:listPermission";
    }
 
    @RequestMapping("/addPermission")
    public String list(Model model, Permission permission){
        permissionService.add(permission);
        return "redirect:listPermission";
    }

    @RequestMapping("/deletePermission")
    public String delete(Model model, long id){
        permissionService.delete(id);
        return "redirect:listPermission";
    }   
 
}