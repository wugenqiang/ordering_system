<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/12
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../../include/publicMeta.jsp"%>

<article class="cl pd-20">
    <form action="/product/addProduct" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-admin-add"  target="_parent">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>商品单价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="" id="price" name="price">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>人气：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="" id="zan" name="zan">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>销量：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="" id="number" name="number">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>描述：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="" id="miaoshu" name="miaoshu">
            </div>
        </div>

       <div class="row cl">
           <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span> 上传图片：</label>
           <div class="formControls col-xs-8 col-sm-9">
               <input type="file" name="image" accept="image/*"/>
           </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">分类：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="cid" size="1">
                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
				</select>
				</span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">商家：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="bid" size="1">
                    <c:forEach items="${userList}" var="user">
                        <option value="${user.id}">${user.name}</option>
                    </c:forEach>
				</select>
				</span>
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