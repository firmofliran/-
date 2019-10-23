<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/23
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="list_title clearfix">
    <h3 class="fl" id="model01">${categoryGoodsList[0].categoryName}</h3>
    <div class="subtitle fl">
        <span>|</span>
        <c:forEach items="${moreGoodsList}" var="g">
        <a href="#">${g.title}</a>
        </c:forEach>
        <%--<a href="#">加州提子</a>
        <a href="#">亚马逊牛油果</a>--%>
    </div>
    <a href="list.html" class="goods_more fr" id="fruit_more">查看更多 ></a>
</div>
<div class="goods_con clearfix">
    <div class="goods_banner fl"><img src="<%=request.getContextPath()%>/images/${bannerPath}"></div>
    <ul class="goods_list fl">
        <c:forEach items="${categoryGoodsList}" var="g">
            <li>
                <h4><a href="#">${g.title}</a></h4>
                <a href="<%=request.getContextPath()%>/goods/queryGoodsDetail/${g.id}"><img src="<%=request.getContextPath()%>/images/goods/${g.imgPath}"></a>
                <div class="prize">¥ ${g.price}</div>
            </li>
        </c:forEach>
    </ul>
</div>
