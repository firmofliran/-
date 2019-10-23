<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/21
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>天天生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

    //2.点击验证码 更新验证码
    $(function () {
        $("#changeCode").click(function () {
            $(this).attr("src", "${pageContext.request.contextPath}/user/createCode?" + Math.random());
        })

        //3.验证输入的验证码 是否正确
        $("#btn").click(function () {
            var vcode = $("#vcode").val();
            if (vcode == "") {
                $("#msgCode").html("<span style='color: red'>请填写验证码</span>");
                return;
            }
            var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;
            var formData = "";
            var username = $('#username').val();
            if (re.test(username)) {
                formData = "usernameOrEmail="+username+ "&password="+ $("#password").val()+"&vcode="+ $("#vcode").val()

            } else {
                formData = "usernameOrEmail="+username+ "&password="+ $("#password").val()+"&vcode="+ $("#vcode").val()
            }


            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/user/login",
                data: formData,
                success: function (data) {
                    $("#msgCode").hide();
                    $("#user_error").hide();
                    if (data.code == 0) {
                        alert("登陆成功")
                        location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else if (data.msg == 'codeError') {
                        $("#msgCode").html("<span style='color: red'>ERROR</span>").show();
                        $("#pagecode").attr("src", "${pageContext.request.contextPath}/user/createCode?" + Math.random());
                    } else {
                        $("#user_error").html("账号或者密码错误").show();
                    }
                }
            })
        })
    })

</script>
<body>
<div class="login_top clearfix">
    <a href="${pageContext.request.contextPath}/index.jsp" class="login_logo"><img
            src="${pageContext.request.contextPath}/images/logo02.png"></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="register.html">立即注册</a>
            </div>
            <div class="form_input">
                <form action="${pageContext.request.contextPath}/user/register">
                    <input type="text" name="username" id="username" class="name_input" required=required
                           placeholder="请输入用户名">
                    <div class="user_error">输入错误</div>
                    <input type="password" id="password" name="pwd" class="pass_input" required=required
                           placeholder="请输入密码">
                    <div class="pwd_error">输入错误</div>
                    <div style="position: absolute;left: 0;top: 120px;">
                        <img src="${pageContext.request.contextPath}/user/createCode" id="changeCode"
                             style=" margin-bottom: -10px;"> <input
                            style="background: #fdfdfd;height: 25px;width: 100px;vertical-align: middle;" id="vcode">
                        <span id="msgCode"></span>
                    </div>
                    <div class="more_input clearfix">
                        <input type="checkbox" name="">

                        <label>记住用户名</label>
                        <a href="#">忘记密码</a>
                    </div>
                    <input type="button" value="登录" class="input_submit" id="btn">
                </form>
            </div>
        </div>

    </div>
</div>

<div class="footer no-mp">
    <div class="foot_link">
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情链接</a>
    </div>
    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888 京ICP备*******8号</p>
</div>

</body>
</html>