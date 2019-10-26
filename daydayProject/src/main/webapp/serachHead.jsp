<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/25
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="search_bar clearfix">
    <a href="${pageContext.request.contextPath}/order/queryAllCartInfo" class="logo fl"><img
            src="<%=request.getContextPath()%>/images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="${pageContext.request.contextPath}/order/queryAllCartInfo" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">0</div>
    </div>
</div>
<script>
    $(function () {
        $.get("${pageContext.request.contextPath}/order/queryCartCount", function (data) {
            if (data.code == 0) {
                $('#show_count').html(data.msg);
            }
        });
    })
</script>
