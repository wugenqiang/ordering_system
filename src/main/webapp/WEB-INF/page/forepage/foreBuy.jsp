<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/19
  Time: 21:37
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
                            <li>buy</li>
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
=            Cart page content         =
=============================================-->


<div class="page-section mb-50">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="#">
                    <!--=======  cart table  =======-->

                    <div class="cart-table table-responsive mb-40">
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="pro-thumbnail">图片</th>
                                <th class="pro-title">名称</th>
                                <th class="pro-price">单价</th>
                                <th class="pro-quantity">数量</th>
                                <th class="pro-subtotal">小计</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ois}" var="orderItem">
                                <tr>
                                    <td class="pro-thumbnail">
                                        <a href="single-product.html"><img src="${pageContext.request.contextPath}/${orderItem.product.imageurl}" class="img-fluid" alt="Product"></a>
                                    </td>
                                    <td class="pro-title"><a href="single-product.html">${orderItem.product.name}</a></td>
                                    <c:if test="${cst.status==0}"><td class="pro-price"><span>$${orderItem.product.price}</span></td></c:if>
                                    <c:if test="${cst.status==1}"><td class="pro-price"><span>$${orderItem.product.price*0.8}</span></td></c:if>
                                    <td class="pro-quantity"><div class="pro-qty"><span>${orderItem.number}</span></div></td>
                                    <c:if test="${cst.status==0}">
                                        <td class="pro-subtotal"><span id="xiaoji1">$${orderItem.number*orderItem.product.price}</span></td>
                                    </c:if>
                                    <c:if test="${cst.status==1}">
                                        <td class="pro-subtotal"><span id="xiaoji08">$${orderItem.number*orderItem.product.price*0.8}</span></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!--=======  End of cart table  =======-->
                </form>

                <!---->
                <div class="page-section mb-50">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">

                                <!-- Checkout Form s-->
                                <form action="#" class="checkout-form">
                                    <div class="row row-40">

                                        <div class="col-lg-12 mb-20">

                                            <!-- Billing Address -->
                                            <div id="billing-form" class="mb-40">
                                                <h4 class="checkout-title">收货信息填写</h4>

                                                <div class="row">

                                                    <div class="col-md-6 col-12 mb-20">
                                                        <label>姓名</label>
                                                        <input type="text" name="name" id="name" placeholder="name">
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-20">
                                                        <label>手机号</label>
                                                        <input type="text" name="phone" id="phone" placeholder="Phone number">
                                                    </div>
                                                    <div class="col-md-6 col-12 mb-20">
                                                        <label>邮箱</label>
                                                        <input type="email" name="email" id="email" placeholder="Email Address">
                                                    </div>

                                                    <div class="col-md-12 col-12 mb-20">
                                                        <label>地址</label>
                                                        <input type="text" name="address" id="address" placeholder="Address">
                                                    </div>

                                                    <div class="col-12 mb-20">
                                                        <div class="check-box">
                                                            <input type="checkbox" id="create_account">
                                                            <label for="create_account">创建新账户?</label>
                                                        </div>
                                                        <div class="check-box">
                                                            <input type="checkbox" id="shiping_address" data-shipping>
                                                            <label for="shiping_address">运到不同的地点</label>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>


                                        </div>

                                        <div class="col-lg-12">
                                            <div class="row">
                                                <!-- Cart Total -->
                                                <div class="col-6 mb-60">

                                                    <h4 class="checkout-title">购物车信息</h4>

                                                    <div class="checkout-cart-total">
                                                        <p>数量 <span>${number}</span></p>
                                                        <p>小计 <span>$${total}</span></p>

                                                        <p>运费 <span>$10.00</span></p>

                                                        <h4>总计 <span>$${total+10}</span></h4>

                                                    </div>

                                                </div>

                                                <!-- Payment Method -->
                                                <div class="col-6">


                                                    <h4 class="checkout-title">支付方式</h4>

                                                    <div class="checkout-payment-method">

                                                        <div class="single-method">
                                                            <input type="radio" id="payment_check" onclick="payedFunc(this);" name="payment-method" value="check">
                                                            <label for="payment_check">支票支付</label>
                                                            <p data-method="check">请在商店街，商店城，商店状态，商店邮政编码，商店国家/地区发送支票商店名称。</p>
                                                        </div>

                                                        <div class="single-method">
                                                            <input type="radio" id="payment_bank" onclick="payedFunc(this);" name="payment-method" value="bank">
                                                            <label for="payment_bank">直接银行转账</label>
                                                            <p data-method="bank">请填写银行卡账号</p>
                                                        </div>

                                                        <div class="single-method">
                                                            <input type="radio" id="payment_cash" onclick="payedFunc(this);" name="payment-method" value="cash">
                                                            <label for="payment_cash">货到付款</label>
                                                            <p data-method="cash">订单准备就绪，即时配送</p>
                                                        </div>

                                                        <div class="single-method">
                                                            <input type="radio" id="payment_paypal" onclick="payedFunc(this);" name="payment-method" value="paypal">
                                                            <label for="payment_paypal">支付宝</label>
                                                            <p data-method="paypal">扫描支付宝二维码支付</p>
                                                        </div>

                                                        <div class="single-method">
                                                            <input type="radio" id="payment_payoneer" onclick="payedFunc(this);" name="payment-method" value="payoneer">
                                                            <label for="payment_payoneer">微信</label>
                                                            <p data-method="payoneer">扫描微信二维码支付</p>
                                                        </div>

                                                        <div class="single-method">
                                                            <input type="checkbox" id="accept_terms" onclick="yuedu(this)">
                                                            <label for="accept_terms">我已阅读并接受条款和条件</label>
                                                        </div>

                                                    </div>

                                                    <button class="place-order">
                                                        <a href="javascript:;" id="order_btn" onclick="createOrder();">提交订单</a>
                                                    </button>

                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <!---->

            </div>
        </div>
    </div>
</div>
<!--=====  End of Cart page content  ======-->
<script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
    var readed = false;//是否点击我已阅读
    var payedFun = false; //是否选中支付方式
    function yuedu(object){
        if(object.checked==1){
            readed = true;
        }else {
            readed = false;
        }
    }
    function payedFunc(object) {
        if(object.checked==1){
            payedFun = true;
        }else {
            payedFun = false;
        }
    }
    function createOrder() {
        var name = $("#name").val();
        var email = $("#email").val();
        var address = $("#address").val();
        var phone = $("#phone").val();
        if(name==""||email==""||address==""||phone==""){
            alert("收货信息不能为空！");
            return;
        }
        if(!readed){
            alert("请点击我已阅读并接受条款和条件！");
            return;
        }
        if(!payedFun){
            alert("请选择一种支付方式！");
            return false;
        }

        var cstAddress = "姓名："+name+",邮箱："+email+",配送地址："+address+",手机号："+phone;
        window.location.href="foreCreateOrder?address="+cstAddress;
    }
    //鼠标移入事件
    $("#order_btn").mouseenter(function () {
        this.style.color="#ff1059";
    });
    $("#order_btn").mouseout(function () {
        this.style.color="white";
    })

</script>

<%@ include file="../../foreinclude/foreFooter.jsp"%>
