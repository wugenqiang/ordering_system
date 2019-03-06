<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/19
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>校园快捷订餐</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">

    <!-- CSS
    ============================================ -->
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">

    <!-- Ionicons CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/ionicons.min.css" rel="stylesheet">

    <!-- Plugins CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet">

    <!-- Helper CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/helper.css" rel="stylesheet">

    <!-- Main CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.8.3.min.js"></script>

</head>

<body class="grey-bg">

<!--=============================================
=            header container         =
=============================================-->

<div class="header-container header-container-home-4 header-sticky white-bg">

    <!--=============================================
    =            header top         =
    =============================================-->

    <div class="header-top pt-15 pb-15">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="header-top-text text-center text-lg-left mb-0 mb-md-15 mb-sm-15">
                        <p><i class="icon ion-md-alarm"></i> 下单后，15分钟内送达,投诉电话  <span class="support-no">: (012) 800 456 789</span></p>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <!--=======  header top dropdowns  =======-->

                    <div class="header-top-dropdown d-flex justify-content-center justify-content-lg-end">


                        <!--=======  single dropdown  =======-->

                        <div class="single-dropdown">

                            <a href="/fore/foreIndex" id="changeLanguage"><span id="languageName">首页</span></a>

                        </div>

                        <span class="separator pl-15 pr-15">|</span>

                        <!--=======  End of single dropdown  =======-->
                        <c:if test="${cst!=null}">
                            <div class="single-dropdown">
                                <a href="#"><span>欢迎您，${cst.name}
                                     <c:if test="${cst.status==1}">(会员)</c:if>
                                     <c:if test="${cst.status==0}">(普通用户)</c:if>
                                    </span>
                                </a>
                            </div>
                            <span class="separator pl-15 pr-15">|</span>
                            <div class="single-dropdown">
                                <a href="/fore/foreCstLoginOut"><span>退出</span></a>
                            </div>
                        </c:if>
                        <c:if test="${cst==null}">
                            <div class="single-dropdown">
                                <a href="foreLoginUI"><span>登陆</span></a>
                            </div>
                            <span class="separator pl-15 pr-15">|</span>
                            <div class="single-dropdown">
                                <a href="foreRegisterUI"><span>注册</span></a>
                            </div>
                        </c:if>
                        <!--=======  End of single dropdown  =======-->



                    </div>


                    <!--=======  End of header top dropdowns  =======-->
                </div>
            </div>
        </div>
    </div>

    <!--=====  End of header top  ======-->

    <!--=============================================
    =            navigation menu top            =
    =============================================-->


    <div class="navigation-menu-top navigation-menu-top-home-4 pt-35 pb-35 pt-md-15 pb-md-15 pt-sm-15 pb-sm-15 mb-md-55 mb-sm-55">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-6 col-lg-2 col-md-6 col-sm-6 order-1 order-lg-1">
                    <!--=======  logo  =======-->

                    <div class="logo">
                        <a href="/fore/foreIndex">
                            <img src="${pageContext.request.contextPath}/assets/images/logo.png" class="img-fluid" alt="">
                        </a>
                    </div>

                    <!--=======  End of logo  =======-->
                </div>
                <div class="col-12 col-lg-8 col-md-12 col-sm-12 order-3 order-lg-2">
                    <!--=======  header feature container  =======-->

                    <div class="header-feature-container mt-md-15 mt-sm-15">
                        <!--=======  single feature  =======-->

                        <div class="single-feature d-flex">
                            <div class="image">
                                <i class="icon ion-md-globe"></i>
                            </div>
                            <div class="content">
                                <h5>免费送货</h5>
                                <p>所有订单免运费</p>
                            </div>
                        </div>

                        <!--=======  End of single feature  =======-->
                        <!--=======  single feature  =======-->

                        <div class="single-feature d-flex">
                            <div class="image">
                                <i class="icon ion-md-checkmark-circle-outline"></i>
                            </div>
                            <div class="content">
                                <h5>退货</h5>
                                <p>下单5分钟内无条件取消</p>
                            </div>
                        </div>

                        <!--=======  End of single feature  =======-->
                        <!--=======  single feature  =======-->

                        <div class="single-feature d-flex mb-sm-0">
                            <div class="image">
                                <i class="icon ion-md-notifications-outline"></i>
                            </div>
                            <div class="content">
                                <h5>会员折扣</h5>
                                <p>每个订单超过$ 120.00</p>
                            </div>
                        </div>

                        <!--=======  End of single feature  =======-->


                    </div>

                    <!--=======  End of header feature container  =======-->


                </div>
                <div class=" col-6 col-lg-2 col-md-6 col-sm-6 order-2 order-lg-3">
                    <!--=======  cart icon  =======-->

                    <div class="minicart-section minicart-section-home-4">
                        <a href="/fore/forecart" id="cart-icon">
                            <span class="image"><i class="icon ion-md-cart"></i></span>
                            <h5>我的购物车<i class="fa fa-angle-down"></i></h5>
                            <p>点击查看</p>
                        </a>
                    </div>

                    <!--=======  End of cart icon  =======-->
                </div>
            </div>
        </div>
    </div>

    <!--=======  End of navigation menu top  =======-->
    <!--=============================================
=            navigation menu         =
=============================================-->

    <div class="navigation-menu navigation-menu-home-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-lg-7">
                    <!--=======  sticky logo  =======-->

                    <div class="sticky-logo">
                        <a href="/fore/foreIndex">
                            <img src="${pageContext.request.contextPath}/assets/images/logo.png" class="img-fluid" alt="">
                        </a>
                    </div>

                    <!--=======  End of sticky logo  =======-->

                    <!--=======  search icon for tablet  =======-->

                    <div class="search-icon-menutop-tablet search-icon-menutop-tablet-home-4 text-right d-inline-block d-lg-none">
                        <a href="#" id="search-overlay-active-button">
                            <i class="icon ion-md-search"></i>
                        </a>
                    </div>

                    <!--=======  End of search icon for tablet  =======-->
                    <!-- navigation section -->
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li class="active menu-item-has-children"><a href="#">美食分类</a>
                                    <ul class="sub-menu">
                                        <c:forEach items="${categories}" var="category">
                                            <li><a href="foreFindCategory?id=${category.id}" class="fruit">${category.name}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>
                                <li><a href="/fore/forebought">我的订单</a></li>
                                <li><a href="/fore/foreZixuns">校园资讯</a></li>
                                <li><a href="/fore/faq">常问问题</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- end of navigation section -->
                </div>
                <div class="col-12 col-lg-3">
                    <!--=======  navigation search bar  =======-->

                    <div class="navigation-search d-none d-lg-block">
                        <form method="post" action="/fore/foreNameLike">
                            <input type="search" placeholder="Search product ..." name="pName">
                            <button type="submit"><i class="icon ion-md-search"></i></button>
                        </form>
                    </div>

                    <!--=======  End of navigation search bar  =======-->
                </div>
                <div class="col-12 d-block d-lg-none">
                    <!-- Mobile Menu -->
                    <div class="mobile-menu"></div>
                </div>
            </div>
        </div>
    </div>

    <!--=====  End of navigation menu  ======-->

</div>

<!--=====  End of header container  ======-->