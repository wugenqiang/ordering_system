<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/6
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>


<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="l">
                    <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加角色','addRoleUI','800')">
                        <i class="Hui-iconfont">&#xe600;</i> 添加角色
                    </a>
                </span>
                <span class="r">共有数据：<strong>${roleSize}</strong> 条</span>
            </div>
            <div class="mt-10">
                <table class="table table-border table-bordered table-hover table-bg">
                    <thead>
                    <tr>
                        <th scope="col" colspan="6">角色管理</th>
                    </tr>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" value="" name=""></th>
                        <th width="40">ID</th>
                        <th width="200">角色名</th>
                        <th width="200">角色描述</th>
                        <th width="300">权限</th>
                        <th width="70">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rs}" var="role">
                        <tr class="text-c">
                            <td><input type="checkbox" value="" name=""></td>
                            <td>${role.id}</td>
                            <td>${role.name}</td>
                            <td>${role.desc_}</td>
                            <td>
                                <c:forEach items="${role_permissions[role]}" var="permission">
                                    ${permission.name}
                                </c:forEach>
                            </td>
                            <td class="f-14">
                                <a title="编辑" href="javascript:;" onclick="admin_role_edit('角色编辑','editRole?id=${role.id}','1')" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a deleteLink="true" title="删除" href="/config/deleteRole?id=${role.id}" class="ml-5" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </article>
        <article class="cl pd-20">
            <%@include file="../adminPage.jsp"%>
        </article>
    </div>
</section>

<%@include file="../../include/publicFooter.jsp"%>
<script type="text/javascript">

    /*删除链接*/
    $(function(){
        $("a").click(function(){
            var deleteLink = $(this).attr("deleteLink");
            console.log(deleteLink);
            if("true"==deleteLink){
                var confirmDelete = confirm("确认要删除");
                if(confirmDelete)
                    return true;
                return false;

            }
        });
    })
    /*管理员-角色-添加*/
    function admin_role_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-角色-编辑*/
    function admin_role_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

</script>
</body>
</html>