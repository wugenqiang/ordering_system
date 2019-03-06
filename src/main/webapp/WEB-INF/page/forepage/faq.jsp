<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/25
  Time: 17:43
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
                            <li class="parent-page"><a href="index.html">Home</a></li>
                            <li>FAQ</li>
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
=            FAQ page content         =
=============================================-->

<div class="page-section mb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="faq-wrapper">

                    <div id="accordion">
                        <div class="card">
                            <div class="card-header" id="headingOne">
                                <h5 class="mb-0">
                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne"
                                            aria-expanded="true" aria-controls="collapseOne">
                                        有哪些配送方式? <span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>均为人工准时配送到指定地点</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseTwo" aria-expanded="false"
                                            aria-controls="collapseTwo">
                                        有哪些支付方式? <span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>常见的支付方式都可以，例如：微信、支付宝、银行卡等</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingThree">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseThree" aria-expanded="false"
                                            aria-controls="collapseThree">
                                        下单后可以取消我的订单吗? <span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>下单五分钟之内可以取消</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingFour">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseFour" aria-expanded="false"
                                            aria-controls="collapseFour">
                                        如何对购买的订单进行评价? <span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>在我的订单页面可以进行评价</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingFive">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseFive" aria-expanded="false"
                                            aria-controls="collapseFive">
                                        下单后，长时间不发货怎么办?<span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingFive"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>下单后25分钟内送到，不会出现配送延迟</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header" id="headingSix">
                                <h5 class="mb-0">
                                    <button class="btn btn-link collapsed" data-toggle="collapse"
                                            data-target="#collapseSix" aria-expanded="false"
                                            aria-controls="collapseSix">
                                        相关的活动与优惠在哪?<span> <i class="fa fa-chevron-down"></i>
												<i class="fa fa-chevron-up"></i> </span>
                                    </button>
                                </h5>
                            </div>
                            <div id="collapseSix" class="collapse" aria-labelledby="headingSix"
                                 data-parent="#accordion">
                                <div class="card-body">
                                    <p>最新的优惠会在首页出现，请到首页查看</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<!--=====  End of FAQ page content  ======-->

<!--=====  End of FAQ page content  ======-->
<%@ include file="../../foreinclude/foreFooter.jsp"%>
