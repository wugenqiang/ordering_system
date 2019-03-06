<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/19
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--=============================================
=            footer         =
=============================================-->

<div class="footer-container">
    <!--=======  footer navigation  =======-->

    <div class="footer-navigation pt-40 pb-20 pb-lg-40 pt-sm-30 pb-sm-10">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <!--=======  address block  =======-->

                    <div class="address-block">
                        <div class="image">
                            <a href="/fore/foreIndex">
                                <img src="${pageContext.request.contextPath}/assets/images/logo.png" class="img-fluid" alt="">
                            </a>
                        </div>

                        <div class="address-text">
                            <ul>
                                <li>地址: 泸州职业技术学院</li>
                                <li>手机: (012) 800 456 789</li>
                                <li>传真: (012) 800 456 789</li>
                                <li>电子邮箱: 1191741799@qq.com</li>
                            </ul>
                        </div>

                        <div class="social-links">
                            <ul>
                                <li><a href="#" class="twitter"  data-tooltip="Twitter"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" class="facebook"  data-tooltip="Facebook"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#" class="behance" data-tooltip="Behance"><i class="fa fa-behance"></i></a></li>
                                <li><a href="#" class="pinterest" data-tooltip="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#" class="rss" data-tooltip="RSS"><i class="fa fa-rss"></i></a></li>
                            </ul>
                        </div>
                    </div>

                    <!--=======  End of address block  =======-->
                </div>
                <div class="col-lg-2 col-md-6">
                    <!--=======  widget block  =======-->

                    <div class="widget-block">
                        <h4 class="footer-widget-title mb-sm-10">信息</h4>
                        <ul>
                            <li><a href="#">关于我们</a></li>
                            <li><a href="#">联系我们</a></li>
                            <li><a href="#">服务</a></li>
                            <li><a href="#">校园资讯</a></li>
                            <li><a href="#">平台优惠</a></li>
                            <li><a href="#l">美食推荐</a></li>
                        </ul>
                    </div>

                    <!--=======  End of widget block  =======-->
                </div>
                <div class="col-lg-2 col-md-6">
                    <!--=======  widget block  =======-->

                    <div class="widget-block">
                        <h4 class="footer-widget-title mt-sm-20 mb-sm-10">商家指南</h4>
                        <ul>
                            <li><a href="#">卖家中心</a></li>
                            <li><a href="#">物流服务</a></li>
                            <li><a href="#">交易规则</a></li>
                            <li><a href="#">在线帮助</a></li>

                        </ul>
                    </div>

                    <!--=======  End of widget block  =======-->
                </div>
                <div class="col-lg-4 col-md-6">
                    <!--=======  widget block  =======-->

                    <div class="widget-block">
                        <h4 class="footer-widget-title mt-sm-20 mb-sm-10">订阅我们</h4>
                        <p>获取有关我们最新商店和特别优惠的电子邮件更新。</p>

                        <!--=======  newsletter formq  =======-->

                        <div class="newsletter-form mb-20">
                            <form id="mc-form" class="mc-form">
                                <input type="email" placeholder="Enter your email" required>
                                <button type="submit" value="submit">订阅</button>
                            </form>
                        </div>

                        <!-- mailchimp-alerts Start -->
                        <div class="mailchimp-alerts">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                        </div><!-- mailchimp-alerts end -->

                        <!--=======  End of newsletter formq  =======-->
                    </div>

                    <!--=======  End of widget block  =======-->
                </div>
            </div>
        </div>
    </div>

    <!--=======  End of footer navigation  =======-->

    <!--=======  footer copyright  =======-->

    <div class="footer-copyright pt-20 pb-20">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-left mb-20 mb-md-0">
                    <!--=======  footer copyright text  =======-->

                    <div class="footer-copyright-text">
                        <p>Copyright &copy; 2018 <a href="#">白宇宏</a></p>
                    </div>

                    <!--=======  End of footer copyright text  =======-->
                </div>
                <div class="col-md-6 text-center text-md-right">
                    <!--=======  payment logo  =======-->

                    <div class="payment-logo">
                        <img src="${pageContext.request.contextPath}/assets/images/payment.png" class="img-fluid" alt="">
                    </div>

                    <!--=======  End of payment logo  =======-->
                </div>
            </div>
        </div>
    </div>

    <!--=======  End of footer copyright  =======-->
</div>

<!--=====  End of footer  ======-->

<!--=============================================
=            search overlay         =
=============================================-->

<div class="search-overlay" id="search-overlay">
    <a href="#" class="search-overlay-close" id="search-overlay-close"><i class="fa fa-times"></i></a>
    <div class="search-box">
        <input type="search" placeholder="Search entire store here">
        <button><i class="icon ion-md-search"></i></button>
    </div>
</div>

<!--=====  End of search overlay  ======-->

<!-- scroll to top  -->
<a href="#" class="scroll-top"></a>
<!-- end of scroll to top -->

<!-- JS
============================================ -->
<!-- jQuery JS -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery.min.js"></script>

<!-- Popper JS -->
<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- Plugins JS -->
<script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>

</html>
