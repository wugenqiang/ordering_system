<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/4
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">共有数据：<strong>${totals}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">台后订单列表</th>
                </tr>
                <tr class="text-c">
                    <th width="">ID</th>
                    <th>地址</th>
                    <th>买家</th>
                    <th>总价</th>
                    <th>状态</th>
                    <th width="150">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${os}" var="order">
                <tr class="text-c">
                    <td>${order.id}</td>
                    <td>${order.address}</td>
                    <td>${order.customer.name}</td>
                    <td>${order.total}</td>
                    <td>
                        <c:if test="${order.status==0}">
                            未支付
                        </c:if>
                        <c:if test="${order.status==1}">
                            未发货
                        </c:if>
                        <c:if test="${order.status==2}">
                            已发货
                        </c:if>
                        <c:if test="${order.status==3}">
                            已收货
                        </c:if>
                    </td>
                    <td>
                        <a title="查看" href="javascript:;"
                           onclick="orderIetm_list('订单详情','seeOrderItem?oid=${order.id}','1','500','310')"
                           class="ml-5" style="text-decoration:none">
                            <span class="label label-success radius">查看详情</span>
                        </a>
                        <c:if test="${order.status==1}">
                            <a title="发货" href="/order/orderDelivery?id=${order.id}"
                               class="ml-5" style="text-decoration:none">
                                    <span class="label label-success radius">发货</span>
                            </a>
                        </c:if>
                        <c:if test="${order.status==2}">
                            <span class="label radius">已发货</span>
                        </c:if>
                    </td>
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
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-编辑*/
    function orderIetm_list(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


</script>

</body>
</html>
