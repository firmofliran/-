<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/24
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>天天生鲜-购物车</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@include file="head.jsp" %>
<%@include file="serachHead.jsp" %>

<div class="total_count">全部商品<em>2</em>件</div>
<ul class="cart_list_th clearfix">
    <li class="col01">商品名称</li>
    <li class="col02">商品单位</li>
    <li class="col03">商品价格</li>
    <li class="col04">数量</li>
    <li class="col05">小计</li>
    <li class="col06">操作</li>
</ul>
<c:forEach items="${cartGoodsList}" var="g">
    <ul class="cart_list_td clearfix">
        <li class="col01"><input type="checkbox" name="" checked></li>
        <li class="col02"><img src="<%=request.getContextPath()%>/images/goods/${g.imgPath}"></li>
        <li class="col03">${g.mainTitle}<br><em>${g.price}元/500g</em></li>
        <li class="col04">500g</li>
        <li class="col05">${g.price}元</li>
        <li class="col06">
            <div class="num_add">
                <a href="javascript:;" class="add fl">+</a>
                <input type="text" class="num_show fl" value="1">
                <a href="javascript:;" class="minus fl">-</a>
            </div>
        </li>
        <li class="col07">${g.price}元</li>
        <li class="col08"><a href="javascript:;">删除</a></li>
    </ul>
</c:forEach>
<%--<ul class="cart_list_td clearfix">
    <li class="col01"><input type="checkbox" name="" checked></li>
    <li class="col02"><img src="<%=request.getContextPath()%>/images/goods/${}"></li>
    <li class="col03">${}<br><em>16.80元/500g</em></li>
    <li class="col04">500g</li>
    <li class="col05">16.80元</li>
    <li class="col06">
        <div class="num_add">
            <a href="javascript:;" class="add fl">+</a>
            <input type="text" class="num_show fl" value="1">
            <a href="javascript:;" class="minus fl">-</a>
        </div>
    </li>
    <li class="col07">16.80元</li>
    <li class="col08"><a href="javascript:;">删除</a></li>
</ul>--%>


<ul class="settlements">
    <li class="col01"><input type="checkbox" name="" checked=""></li>
    <li class="col02">全选</li>
    <li class="col03">合计(不含运费)：<span>¥</span><em>42.60</em><br>共计<b>2</b>件商品</li>
    <li class="col04"><a href="place_order.html">去结算</a></li>
</ul>

<%@include file="foot.jsp" %>

</body>
</html>
