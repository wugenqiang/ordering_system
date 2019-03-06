<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/20
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../foreinclude/foreHander1.jsp"%>
<!--=============================================
=            breadcrumb area         =
=============================================-->

<div class="breadcrumb-area pt-15 pb-15">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!--=======  breadcrumb container  =======-->

                <div class="breadcrumb-container">
                    <nav>
                        <ul>
                            <li class="parent-page"><a href="/fore/foreIndex">Home</a></li>
                            <li>Seach</li>
                        </ul>
                    </nav>
                </div>

                <!--=======  End of breadcrumb container  =======-->
            </div>
        </div>
    </div>
</div>

<!--=====  End of breadcrumb area  ======-->

<!--=============================================
=            shop page content         =
=============================================-->

<div class="shop-page-content mb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 order-1 order-lg-2">


                <!--=======  Shop header  =======-->

                <div class="shop-header mb-30">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 d-flex align-items-center">
                            <!--=======  view mode  =======-->
                            <div class="view-mode-icons mb-xs-10">
                                <a href="#" data-target="grid"><i class="icon ion-md-apps"></i></a>
                                <a class="active"  href="#" data-target="list"><i class="icon ion-ios-list"></i></a>
                            </div>
                            <!--=======  End of view mode  =======-->

                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-12 d-flex flex-column flex-sm-row justify-content-between align-items-left align-items-sm-center">
                            <!--=======  Sort by dropdown  =======-->

                            <div class="sort-by-dropdown d-flex align-items-center mb-xs-10">

                            </div>

                            <!--=======  End of Sort by dropdown  =======-->

                            <p class="result-show-message">搜索结果${total}条</p>
                        </div>
                    </div>
                </div>

                <!--=======  End of Shop header  =======-->

                <!--=======  shop product display area  =======-->
                <div class="shop-product-wrap list row mb-30 no-gutters">
                <c:forEach items="${products}" var="p">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
                        <!--=======  grid view product  =======-->

                        <!--=======  single product  =======-->

                        <div class="fl-product shop-grid-view-product">
                            <div class="image">
                                <a href="foreDetailUI?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.imageurl}" class="img-fluid" alt="">
                                    <img src="${pageContext.request.contextPath}/${p.imageurl}" class="img-fluid" alt="">
                                </a>
                                <!-- wishlist icon -->
                                <span class="wishlist-icon">
                                            <a href="#" ><i class="icon ion-md-heart-empty"></i></a>
                                    </span>
                            </div>
                            <div class="content">
                                <h2 class="product-title"> <a href="foreDetailUI?id=${p.id}">${p.name}</a></h2>
                                <div class="rating">
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p class="product-price">
                                    <span class="main-price discounted">$${p.price+15}</span>
                                    <span class="discounted-price">$${p.price}</span>
                                </p>

                            </div>
                        </div>

                        <!--=======  End of single product  =======-->

                        <!--=======  End of grid view product  =======-->

                        <!--=======  list view product  =======-->

                        <div class="fl-product shop-list-view-product">
                            <div class="image">
                                <a href="foreDetailUI?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.imageurl}" class="img-fluid" alt="" width="50px" height="50px">
                                    <img src="${pageContext.request.contextPath}/${p.imageurl}" class="img-fluid" alt="" width="50px" height="50px">
                                </a>
                            </div>
                            <div class="content" style="padding-top: 55px">
                                <h2 class="product-title"> <a href="foreDetailUI?id=${p.id}">${p.name}</a></h2>
                                <div class="rating">
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star active"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <br/>
                                <p>${p.miaoshu}</p>
                                <p class="product-price">
                                    <span class="main-price discounted">$${p.price+15}</span>
                                    <span class="discounted-price">$${p.price}</span>
                                </p>
                            </div>


                        </div>

                        <!--=======  End of list view product  =======-->
                    </div>
                </c:forEach>


                </div>

                <!--=======  End of shop product display area  =======-->

                <!--=======  pagination area  =======-->

                <div class="pagination-area ">
                    <ul>
                        <div class="pagination-area ">
                            <ul>
                                <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                                    <a  href="?start=0">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
                                    <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                                        <a href="?start=${status.index*page.count}"
                                           <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                                        >${status.count}</a>
                                    </li>
                                </c:forEach>

                                <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                                    <a href="?start=${page.last}">
                                        <span aria-hidden="true">末页</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </div>

                <!--=======  End of pagination area  =======-->
            </div>
        </div>
    </div>
</div>

<!--=====  End of shop page content  ======-->
<%@ include file="../../foreinclude/foreFooter.jsp"%>
