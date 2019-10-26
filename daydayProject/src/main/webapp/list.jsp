<%@ page import="com.github.pagehelper.PageInfo" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/23
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品列表</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<%@include file="head.jsp" %>
<div id="header">

</div>
<%@include file="serachHead.jsp"%>

<div class="navbar_con">
    <div class="navbar clearfix">
        <div class="subnav_con fl">
            <h1>全部商品分类</h1>
            <span></span>
            <ul class="subnav">
                <li><a href="#" class="fruit">新鲜水果</a></li>
                <li><a href="#" class="seafood">海鲜水产</a></li>
                <li><a href="#" class="meet">猪牛羊肉</a></li>
                <li><a href="#" class="egg">禽类蛋品</a></li>
                <li><a href="#" class="vegetables">新鲜蔬菜</a></li>
                <li><a href="#" class="ice">速冻食品</a></li>
            </ul>
        </div>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>

<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
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
        <div class="sort_bar">
            <a href="javascript:void(0)" class="active" id="default">默认</a>
            <a href="javascript:void(0)" id="priceSort">价格</a>
            <a href="javascript:void(0)" id="num">人气</a>
        </div>

        <script>
            $(function () {
                // 将数字转换成金额显示
                function toMoney(num) {
                    if (num) {
                        if (isNaN(num)) {
                            alert('金额中含有不能识别的字符');
                            return;
                        }
                        num = typeof num == 'string' ? parseFloat(num) : num // 判断是否是字符串如果是字符串转成数字
                        num = num.toFixed(2); // 保留两位
                        console.log(num)
                        num = parseFloat(num); // 转成数字
                        num = num.toLocaleString(); // 转成金额显示模式
                        // 判断是否有小数
                        if (num.indexOf('.') === -1) {
                            num = '￥' + num + '.00';
                        } else {
                            // console.log(num.split('.')[1].length)
                            num = num.split('.')[1].length < 2 ? '￥' + num + '0' : '￥' + num;
                        }
                        return num; // 返回的是字符串23,245.12保留2位小数
                    } else {
                        return num = null;
                    }
                }

                //按照条件给商品排序
                var isPriceSort = 'false';
                $("#priceSort").click(function () {
                    $(this).siblings().removeClass("active");
                    $(this).addClass("active");
                    isPriceSort = 'true';
                    getGoods(currentPage, isPriceSort)
                })
                $("#default").click(function () {
                    $(this).siblings().removeClass("active");
                    $(this).addClass("active");
                    isPriceSort = 'false';
                    getGoods(currentPage, isPriceSort)
                })
                $("#num").click(function () {
                    $(this).siblings().removeClass("active");
                    $(this).addClass("active");
                })
                var currentPage =${detailPageInfo.pageNum};
                //上一页
                $("#pre").click(function () {
                    currentPage -= 1;
                    if (currentPage <= 0) {
                        currentPage = 1;
                    }
                    getGoods(currentPage, isPriceSort)
                    $("#color"+currentPage).addClass("active")
                    $("#color"+currentPage).siblings().removeClass("active")
                })
                //下一页
                $("#next").click(function () {
                    currentPage += 1;
                    if (currentPage >=${detailPageInfo.pages}) {
                        currentPage =${detailPageInfo.pages};
                    }
                    getGoods(currentPage, isPriceSort)
                    $("#color"+currentPage).addClass("active")
                    $("#color"+currentPage).siblings().removeClass("active")

                })

                <c:if test="${!empty detailPageInfo.list}">

                function getGoods(currentPage, isPriceSort) {
                    $.get("${pageContext.request.contextPath}/goods/queryAllByIdJson", {
                        id:${detailPageInfo.list[0].categoryId},
                        currentPage: currentPage,
                        pageSize: ${detailPageInfo.pageSize},
                        isPriceSort: isPriceSort
                    }, function (pageInfo) {
                        var htmlData = '';
                        var data = pageInfo.list;
                        for (var d in data) {
                            htmlData += ' <li> ' +
                                '<a href="${pageContext.request.contextPath}/goods/queryGoodsDetail/'+data[d].id +'">' +
                                '<img src="<%=request.getContextPath()%>/images/goods/' + data[d].imgPath + '">' +
                                '</a> <h4><a href="${pageContext.request.contextPath}/goods/queryGoodsDetail/' + data[d].id + '">' + data[d].mainTitle + '</a></h4>' +
                                '<div class="operate"><span class="prize">' + toMoney(data[d].price) + '</span>' +
                                '<span class="unit">' + toMoney(data[d].price)+ '/500g</span><a href="#" class="add_goods" title="加入购物车">' +
                                '</a></div>' +
                                '</li>'
                        }
                        $("#show").html(htmlData);
                    })

                }

                </c:if>


            })
        </script>
        <ul class="goods_type_list clearfix" id="show">
            <c:forEach items="${detailPageInfo.list}" var="d">
                <li>
                    <a href="${pageContext.request.contextPath}/goods/queryGoodsDetail/${d.id}"><img src="<%=request.getContextPath()%>/images/goods/${d.imgPath}"></a>
                    <h4><a href="${pageContext.request.contextPath}/goods/queryGoodsDetail/${d.id}">${d.mainTitle}</a>
                    </h4>
                    <div class="operate">
                        <span class="prize">${d.price}</span>
                        <span class="unit">${d.price}/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>
            </c:forEach>
            <%--<li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods004.jpg"></a>
                <h4><a href="#">吐鲁番梨光杏</a></h4>
                <div class="operate">
                    <span class="prize">￥5.50</span>
                    <span class="unit">5.50/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods005.jpg"></a>
                <h4><a href="#">黄肉桃</a></h4>
                <div class="operate">
                    <span class="prize">￥10.00</span>
                    <span class="unit">10.00/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods006.jpg"></a>
                <h4><a href="#">进口西梅</a></h4>
                <div class="operate">
                    <span class="prize">￥28.80</span>
                    <span class="unit">28.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods007.jpg"></a>
                <h4><a href="#">香梨</a></h4>
                <div class="operate">
                    <span class="prize">￥6.45</span>
                    <span class="unit">6.45/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods008.jpg"></a>
                <h4><a href="#">栗子</a></h4>
                <div class="operate">
                    <span class="prize">￥9.50</span>
                    <span class="unit">9.50/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods009.jpg"></a>
                <h4><a href="#">海南香蕉</a></h4>
                <div class="operate">
                    <span class="prize">￥3.30</span>
                    <span class="unit">3.30/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods010.jpg"></a>
                <h4><a href="#">青苹果</a></h4>
                <div class="operate">
                    <span class="prize">￥5.00</span>
                    <span class="unit">5.00/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods011.jpg"></a>
                <h4><a href="#">山莓</a></h4>
                <div class="operate">
                    <span class="prize">￥28.80</span>
                    <span class="unit">28.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>

            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods012.jpg"></a>
                <h4><a href="#">奇异果</a></h4>
                <div class="operate">
                    <span class="prize">￥25.80</span>
                    <span class="unit">25.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods013.jpg"></a>
                <h4><a href="#">蜜桔</a></h4>
                <div class="operate">
                    <span class="prize">￥4.80</span>
                    <span class="unit">4.8/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods014.jpg"></a>
                <h4><a href="#">脐橙</a></h4>
                <div class="operate">
                    <span class="prize">￥3.50</span>
                    <span class="unit">3.50/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods001.jpg"></a>
                <h4><a href="#">进口柠檬</a></h4>
                <div class="operate">
                    <span class="prize">￥3.90</span>
                    <span class="unit">3.90/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>
            <li>
                <a href="#"><img src="<%=request.getContextPath()%>/images/goods/goods002.jpg"></a>
                <h4><a href="#">玫瑰香葡萄</a></h4>
                <div class="operate">
                    <span class="prize">￥16.80</span>
                    <span class="unit">16.80/500g</span>
                    <a href="#" class="add_goods" title="加入购物车"></a>
                </div>
            </li>--%>
        </ul>

        <div class="pagenation">
            <a href="javascript:void(0)" id="pre">
                &lt;上一页
            </a>
            <c:forEach items="${detailPageInfo.navigatepageNums}" var="current">
                <c:if test="${current==1}">
                    <a href="javascript:void(0)" class="active" id="color${current}">${current}</a>
                </c:if>
                <c:if test="${current!=1}">
                    <a href="javascript:void(0)" id="color${current}">${current}</a>
                </c:if>
            </c:forEach>
            <a href="javascript:void(0)" id="next">下一页></a>
            总页数:${detailPageInfo.pages}
        </div>
    </div>
</div>

<%@include file="foot.jsp"%>

</body>
</html>
>
