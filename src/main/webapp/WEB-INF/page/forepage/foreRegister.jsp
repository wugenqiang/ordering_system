<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/19
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../../foreinclude/foreHander.jsp"%>

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
                            <li>Register</li>
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
=            Login Register page content         =
=============================================-->

<div class="page-section mb-50">
    <div class="container">

        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-3 col-xs-12"></div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
                <form action="/fore/foreRegister" method="post" class="loginForm" >

                    <div class="login-form">
                        <h4 class="login-title">Register</h4>

                        <div class="row">
                            <div class="col-md-6 col-12 mb-20">
                                <label>姓名</label>
                                <input class="mb-0" type="text" name="name" id="name" placeholder="Name">
                            </div>
                            <div class="col-md-6 col-12 mb-20">
                                <label>pwd</label>
                                <input class="mb-0" type="text" name="password" id="password" placeholder="">
                            </div>
                            <div class="col-md-12 mb-20">
                                <label>地址:</label>
                                <input class="mb-0" type="text" name="address" id="address" placeholder="Email Address">
                            </div>
                            <div class="col-md-6 mb-20">
                                <label>手机:</label>
                                <input class="mb-0" type="password"  name="phone" id="phone" placeholder="Password">
                            </div>

                            <div class="col-12">
                                <button type="submit" class="register-button mt-0">Register</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!--=====  End of Login Register page content  ======-->
<script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        //验证不能为空
        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                alert("账号不能为空");
                return false;
            }
            return true;
        });
    })
</script>

<%@ include file="../../foreinclude/foreFooter.jsp"%>
