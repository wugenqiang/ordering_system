<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/8
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../include/publicMeta.jsp"%>

<article class="cl pd-20">
    <form action="/config/updateRole" method="post" class="form form-horizontal" id="form-admin-role-add" target="_parent">
        <div class="row cl">
            <input type="hidden" name="id" value="${role.id}">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>角色名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${role.name}" placeholder="" id="roleName" name="name" datatype="*4-16" nullmsg="用户账户不能为空">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${role.desc_}" placeholder="" id="" name="desc_">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">角色权限：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <dl class="permission-list">
                    <dl class="cl permission-list2">
                        <dd>
                           <c:forEach items="${ps}" var="permission" varStatus="st">
                               <c:set var="hasPermission" value="false" />
                               <c:forEach items="${currentPermissions}" var="currentPermission">
                                   <c:if test="${permission.id==currentPermission.id}">
                                       <c:set var="hasPermission" value="true" />
                                   </c:if>
                               </c:forEach>
                               <label class="">
                                   <input type="checkbox"  ${hasPermission?"checked='checked'":"" }  name="permissionIds"  value="${permission.id}">${permission.name}&nbsp;&nbsp;<br/>
                               </label>
                           </c:forEach>
                        </dd>
                    </dl>
                </dl>

            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
            </div>
        </div>
    </form>
</article>

<%@include file="../../include/publicFooter.jsp"%>
<script type="text/javascript">
    $(function(){
        $(".permission-list dt input:checkbox").click(function(){
            $(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
        });
        $(".permission-list2 dd input:checkbox").click(function(){
            var l =$(this).parent().parent().find("input:checked").length;
            var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
            if($(this).prop("checked")){
                $(this).closest("dl").find("dt input:checkbox").prop("checked",true);
                $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
            }
            else{
                if(l==0){
                    $(this).closest("dl").find("dt input:checkbox").prop("checked",false);
                }
                if(l2==0){
                    $(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
                }
            }
        });

        $("#form-admin-role-add").validate({
            rules:{
                roleName:{
                    required:true,
                },
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                $(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
