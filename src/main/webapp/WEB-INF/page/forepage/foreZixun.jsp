<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/26
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                            <li>information</li>
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
=            blog page content         =
=============================================-->

<div class="blog-page-content mb-50">
    <div class="container">
        <div class="row">


            <div class="col-lg-12 order-1">
                <!--=======  blog post container  =======-->

                <div class="blog-single-post-container mb-30">

                    <!--=======  post title  =======-->


                    <h3 class="post-title">校园资讯</h3>

                    <!--=======  End of post title  =======-->

                    <div class="post-content mb-40">


                        <blockquote>
                            <p>
                                用户可发布自己的问题，管理员审核通过后进行显示
                                <button style="float:right" class="btn btn-default"><a href="javascript:;" onclick="fabuzixun();">发布</a></button>
                            </p>

                        </blockquote>

                    </div>
                    <!--=======  End of Post content  =======-->
                </div>

                <!--=======  End of blog post container  =======-->

                <!--=============================================
                =            Comment section         =
                =============================================-->

                <div class="comment-section mb-md-30 mb-sm-30">


                    <!--=======  comment container  =======-->

                    <div class="comment-container mb-40">
                        <!--=======  single comment  =======-->
                        <c:forEach items="${list}" var="z">
                        <div class="single-comment">
                            <!--
                                <span class="reply-btn"><a href="#">Reply</a></span>
                            -->
                            <div class="image">
                                <img src="assets/images/blog-image/comment-icon.png" alt="">
                            </div>
                            <div class="content">
                                <h3 class="user">${z.customer.name} <span class="comment-time"><fmt:formatDate value="${z.fabudate}" pattern="yyyy年MM月dd日HH点mm分" /></span></h3>
                                <p class="comment-text">${z.content}.</p>
                            </div>

                        </div>
                        </c:forEach>

                        <!--=======  End of single comment  =======-->
                    </div>
                    <!--=======  End of comment container  =======-->
                 <!--=======  End of comment form container  =======-->
                </div>
                <!--=====  End of Comment section  ======-->
            </div>
        </div>
    </div>
</div>

<!--=====  End of blog page content  ======-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  id="myModal" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--登陆框头部-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    发布资讯！
                </h4>
            </div>
            <!--登陆框中间部分(from表单)-->
            <div class="modal-body">
                <!--评价-->
                <div class="form-group">
                    <label for="contents" class="col-sm-4 control-label">输入信息</label>
                    <div class="col-sm-12">
                        <textarea class="form-control" name="content" id="contents" placeholder="Say you want to say..." required="required"></textarea>
                    </div>
                </div>
                <input type="hidden" name="cstid" value="${cst.id}"/>
                <!--登陆按钮-->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-default"  id="modalFabu">发布</button>
                    </div>
                </div>
                <%--</form>--%>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script>
    function fabuzixun(){
        $('#myModal').modal('show');
    }
    $(function () {
        $("#modalFabu").click(function () {
            var content = $("#contents").val();
            $.get(
                "foreZixunadd",
                {"content":content},
                function (result) {
                    if(result=="success"){
                        alert("已提交，请等待管理员审核！");
                        $('#myModal').modal('hide');
                    }
                }
            );
            //get结束
        });
    })
</script>
<!--====  End of My Account page content  ====-->
<%@ include file="../../foreinclude/foreFooter.jsp"%>