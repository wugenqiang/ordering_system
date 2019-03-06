package com.byh.biyesheji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 专门用于显示页面的控制器
 */
@Controller
@RequestMapping("")
public class PageController {

    /**
     * 后台主页页面
     * @return
     */
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    /**
     * 后台登陆页面
     * @return
     */
    @RequestMapping(value="login",method= RequestMethod.GET)
    public String login(){
        return "login";
    }

    /**
     * 无权限页面
     * @return
     */
    @RequestMapping("/unauthorized")
    public String noPerms(){
        return "unauthorized";
    }



}
