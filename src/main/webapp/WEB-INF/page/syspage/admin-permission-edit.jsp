<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/8
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../include/publicMeta.jsp"%>

<article class="cl pd-20">
    <form action="/config/updatePermission" method="post" class="form form-horizontal" id="form-admin-add" target="_parent">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>权限名字：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${permission.name}" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>权限描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${permission.desc_}" placeholder="" id="desc_" name="desc_">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>权限对应的url：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${permission.url}" placeholder="" id="url" name="url">
            </div>
        </div>

        <input type="hidden" name="id" value="${permission.id}">

        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
<%@include file="../../include/publicFooter.jsp"%>

<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });


    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
