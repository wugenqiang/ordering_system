<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/8
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="javascript:;" onclick="admin_permission_add('添加权限节点','adminPerAddUI','','310')" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> 添加权限节点
                    </a>
                </span>
                <span class="r">共有数据：<strong>${perCount}</strong> 条</span> </div>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th scope="col" colspan="7">权限节点</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="40">ID</th>
                    <th width="100">权限名称</th>
                    <th width="100">描述</th>
                    <th width="100">路径</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ps}" var="permission">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${permission.id}</td>
                        <td>${permission.name}</td>
                        <td>${permission.desc_}</td>
                        <td>${permission.url}</td>
                        <td><a title="编辑" href="javascript:;" onclick="admin_permission_edit('角色编辑','editPermission?id=${permission.id}','1','','310')" class="ml-5" style="text-decoration:none">
                            <i class="Hui-iconfont">&#xe6df;</i></a> <a deleteLink="true" title="删除" href="/config/deletePermission?id=${permission.id}" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>
        <article class="cl pd-20">
            <%@include file="../adminPage.jsp"%>
        </article>
    </div>
</section>

<%@include file="../../include/publicFooter.jsp"%>
<script type="text/javascript">

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
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-权限-添加*/
    function admin_permission_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-权限-编辑*/
    function admin_permission_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

</script>

</body>
</html>
