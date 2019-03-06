
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/5
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../../include/publicMeta.jsp"%>

<article class="cl pd-20">
    <form action="/config/updateUser" method="post" class="form form-horizontal" id="form-admin-add" target="_parent">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>管理员：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${user.name}" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" value="${user.password}" placeholder="密码" id="password" name="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>状态：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" value="" placeholder="这里填写下状态码，1：启用，0：停用" id="status" name="status">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色：</label>
            <div style="text-align:left;width:300px;margin:0px auto;padding-left:50px">
                <c:forEach items="${rs}" var="r">
                    <c:set var="hasRole" value="false" />
                    <c:forEach items="${currentRoles}" var="currentRole">
                        <c:if test="${r.id==currentRole.id}">
                            <c:set var="hasRole" value="true" />
                        </c:if>
                    </c:forEach>
                    <input type="checkbox"  ${hasRole?"checked='checked'":"" } name="roleIds" value="${r.id}"> ${r.name}<br>
                </c:forEach>
            </div>
            <input type="hidden" name="id" value="${user.id}">
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${user.address}" placeholder="" id="address" name="address">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>联系方式：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="${user.phone}" placeholder="" id="phone" name="phone">
            </div>
        </div>

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
