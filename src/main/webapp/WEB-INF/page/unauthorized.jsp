<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/10
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/publicMeta.jsp"%>
<%@include file="../include/publicHeader.jsp"%>
<%@include file="../include/publicMenu.jsp"%>


<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666">权限不足</span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

    <article class="page-404 minWP text-c">
        <p class="error-title"><i class="Hui-iconfont va-m">&#xe688;</i>
            <span class="va-m"> 权限不足 </span>
        </p>
        <p class="error-description">不好意思，您的权限不足~</p>
        <p class="error-info">您可以：
            <a href="javascript:;" onclick="history.go(-1)" class="c-primary">&lt; 返回上一页</a>
            <span class="ml-20">|</span>
            <a href="/index" class="c-primary ml-20">去首页 &gt;</a>
        </p>
    </article>

</section>

<%@include file="../include/publicFooter.jsp"%>
</body>
</html>

