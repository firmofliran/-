<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/23
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品详情</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@include file="head.jsp" %>

<%@include file="serachHead.jsp" %>

<%--<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <div id="category">
            </div>
        </div>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>--%>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
    <span>></span>
    <a href="#">商品详情</a>
</div>

<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl"><img src="<%=request.getContextPath()%>/images/goods/${detail.imgPath}"></div>

    <div class="goods_detail_list fr">
        <h3>${detail.mainTitle}</h3>
        <p>${detail.subTitle}</p>
        <div class="prize_bar">
            <span class="show_pirze">¥<em>${detail.price}</em></span>
            <span class="show_unit">单  位：500g</span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：</div>
            <div class="num_add fl">
                <input type="text" class="num_show fl" value="1">
                <a href="javascript:;" class="add fr">+</a>
                <a href="javascript:;" class="minus fr">-</a>
            </div>
        </div>
        <div class="total">总价：<em>${detail.price}元</em></div>
        <div class="operate_btn">
            <a href="javascript:;" class="buy_btn">立即购买</a>
            <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
        </div>
    </div>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods001.jpg"></a>
                    <h4><a href="#">进口柠檬</a></h4>
                    <div class="prize">￥3.90</div>
                </li>
                <li>
                    <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods002.jpg"></a>
                    <h4><a href="#">玫瑰香葡萄</a></h4>
                    <div class="prize">￥16.80</div>
                </li>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active">商品介绍</li>
            <li>评论</li>
        </ul>

        <div class="tab_content">
            <dl>
                <dt>商品详情：</dt>
                <dd>${detail.product}</dd>
            </dl>
        </div>

    </div>
</div>

<%@include file="foot.jsp" %>
<div class="add_jump"></div>

<script type="text/javascript">
    $("#category").load("${pageContext.request.contextPath}/goods/queryCategory");


    var $add_x = $('#add_cart').offset().top;
    var $add_y = $('#add_cart').offset().left;

    var $to_x = $('#show_count').offset().top;
    var $to_y = $('#show_count').offset().left;

    $(".add_jump").css({'left': $add_y + 80, 'top': $add_x + 10, 'display': 'block'})
    var isAdd = false;
    $('#add_cart').click(function () {
        var num = $(".num_show").val();
        $.post("${pageContext.request.contextPath}/order/addCart", {
            detailId:${detail.id},
            num: num
        }, function (data) {
            if (data.code == 0) {
                if (!isAdd) {
                    isAdd = true;
                    var count = parseInt($('#show_count').text()) + 1;
                    $(".add_jump").stop().animate({
                            'left': $to_y + 7,
                            'top': $to_x + 7
                        },
                        "fast", function () {
                            $(".add_jump").fadeOut('fast', function () {
                                $('#show_count').html(count);
                            });

                        });
                }
            }else if(data.code==1&&data.msg==='login'){
                if(confirm("是否去登录页面")){
                    location.href="${pageContext.request.contextPath}/login.jsp";
                }
            }
        })
        //     $(".add_jump").stop().animate({
        //             'left': $to_y + 7,
        //             'top': $to_x + 7
        //         },
        //         "fast", function () {
        //             $(".add_jump").fadeOut('fast', function () {
        //                 $('#show_count').html(2);
        //             });
        //
        //         });
        // })
    })

</script>

</body>
</html>
