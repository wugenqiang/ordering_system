package com.byh.biyesheji.controller;

import com.byh.biyesheji.pojo.Role;
import com.byh.biyesheji.pojo.User;
import com.byh.biyesheji.service.RoleService;
import com.byh.biyesheji.service.UserRoleService;
import com.byh.biyesheji.service.UserService;
import com.byh.biyesheji.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员controller
 */
@Controller
@RequestMapping("/config")
public class UserController {
    @Autowired
    UserRoleService userRoleService;
    @Autowired
    UserService userService;
    @Autowired
    RoleService roleService;


    @RequestMapping("/enableStatus")
    @ResponseBody
    public String enableStatus(@RequestParam(value = "name") String name){
        return userService.enableStatus(name);
    }

    @RequestMapping("/stopStatus")
    @ResponseBody
    public String stopStatus(@RequestParam(value = "name") String name){
        return userService.stopStatus(name);
    }

    @RequestMapping("/adminAdd")
    public String adminadd(Model model){
        List<Role> list = roleService.list();
        model.addAttribute("rolelist",list);
        return "syspage/admin-add";
    }

    @RequestMapping("/listUser")
    public String list(Model model, Page page){

        PageHelper.offsetPage(page.getStart(),page.getCount());//分页查询
        List<User> us= userService.list();
        int total = (int) new PageInfo<>(us).getTotal();//总条数
        page.setTotal(total);

        model.addAttribute("us", us);//所有用户
        model.addAttribute("total",total);

        Map<User,List<Role>> user_roles = new HashMap<>();
        //每个用户对应的权限
        for (User user : us) {
            List<Role> roles=roleService.listRoles(user);
            user_roles.put(user, roles);
        }
        model.addAttribute("user_roles", user_roles);
 
        return "syspage/admin-list";
    }

    /**
     * 修改管理员角色
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/editUser")
    public String edit(Model model, Long id){
        List<Role> rs = roleService.list();
        model.addAttribute("rs", rs);      
        User user =userService.get(id);
        model.addAttribute("user", user);
        //当前拥有的角色
        List<Role> roles =roleService.listRoles(user);
        model.addAttribute("currentRoles", roles);
         
        return "syspage/admin-edit";
    }

    @RequestMapping("deleteUser")
    public String delete(Model model, long id){
        userService.delete(id);
        return "redirect:listUser";
    }

    @RequestMapping("updateUser")
    public String update(User user, long[] roleIds){
        userRoleService.setRoles(user,roleIds);
         
        String password=user.getPassword();
        //如果在修改的时候没有设置密码，就表示不改动密码
        if(user.getPassword().length()!=0) {
            String salt = new SecureRandomNumberGenerator().nextBytes().toString();
            int times = 2;
            String algorithmName = "md5";
            String encodedPassword = new SimpleHash(algorithmName,password,salt,times).toString();
            user.setSalt(salt);
            user.setPassword(encodedPassword);
        }
        else
            user.setPassword(null);
         
        userService.update(user);
 
        return "redirect:listUser";
 
    }
 
    @RequestMapping("addUser")
    public String add(User user,long[] roleIds){

        String salt = new SecureRandomNumberGenerator().nextBytes().toString();//生成随机数
        int times = 2;
        String algorithmName = "md5";
          
        String encodedPassword = new SimpleHash(algorithmName,user.getPassword(),salt,times).toString();
         
        User u = new User();
        u.setName(user.getName());
        u.setPassword(encodedPassword);
        u.setSalt(salt);
        u.setStatus(1);
        u.setAddress(user.getAddress());
        u.setPhone(user.getPhone());
        userService.add(u);

        userRoleService.setRoles(u,roleIds);
         
        return "redirect:listUser";
    }
 
}