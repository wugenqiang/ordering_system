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

<section class="Hui-article-box">
    <div class="">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="r">共有数据：<strong>${total}</strong> 条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr class="text-c">
                    <th width="">ID</th>
                    <th width="">商品名</th>
                    <th width="">价格</th>
                    <th width="">数量</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderItems}" var="orderItem">
                    <tr class="text-c">
                        <td>${orderItem.id}</td>
                        <td>${orderItem.product.name}</td>
                        <td>${orderItem.product.price}</td>
                        <td>${orderItem.number}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="r">总价<strong>${totalPrice}</strong>元</span>
            </div>
        </article>
    </div>
</section>




</body>
</html>
