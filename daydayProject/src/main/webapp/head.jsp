<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/23
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!</div>
        <div class="fr">
            <div class="login_info fl">

                <em><shiro:user>
                    欢迎您： <shiro:principal/>
                </shiro:user></em>
            </div>
            <div class="login_btn fl">
                <shiro:guest>
                    <a href="<%=request.getContextPath()%>/login.jsp">登录</a>
                    <span>|</span>
                    <a href="<%=request.getContextPath()%>/register.jsp">注册</a>
                </shiro:guest>
            </div>
            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.html">用户中心</a>
                <span>|</span>
                <a href="cart.html">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.html">我的订单</a>
            </div>
        </div>
    </div>
</div>
