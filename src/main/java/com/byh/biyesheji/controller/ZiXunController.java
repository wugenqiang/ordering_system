package com.byh.biyesheji.controller;

import com.byh.biyesheji.pojo.ZiXun;
import com.byh.biyesheji.service.ZiXunService;
import com.byh.biyesheji.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/zixun")
public class ZiXunController {

    @Autowired
    private ZiXunService ziXunService;

    @RequestMapping("/list")
    public String list(Page page, Model model){
        PageHelper.offsetPage(page.getStart(),page.getCount());//分页查询
        List<ZiXun> list = ziXunService.list1();
        int total = (int) new PageInfo<ZiXun>(list).getTotal();//总条数
        page.setTotal(total);

        model.addAttribute("list",list);
        model.addAttribute("totals",total);

        return "cstpage/zixun-list";
    }

    /**
     * 审核
     * @param zid
     * @return
     */
    @RequestMapping("/zixunshenhe")
    @ResponseBody
    public String zixunshenhe(int zid){
        ziXunService.shenhe(zid);
        return "success";
    }

    @RequestMapping("/del")
    public String del(int id){
        ziXunService.del(id);
        return "redirect:list";
    }

}
