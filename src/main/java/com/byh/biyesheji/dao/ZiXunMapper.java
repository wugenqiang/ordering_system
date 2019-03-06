package com.byh.biyesheji.dao;

import com.byh.biyesheji.pojo.ZiXun;
import com.byh.biyesheji.pojo.ZiXunExample;

import java.util.List;

public interface ZiXunMapper extends CrudDao<ZiXun> {

    List<ZiXun> selectByExample(ZiXunExample example);

    /**
     * 资讯审核
     * @param zid
     */
    void shenhe(int zid);

}