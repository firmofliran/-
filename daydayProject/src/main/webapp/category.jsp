<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 2019/10/23
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="subnav fl">
    <c:forEach items="${categoryList}" var="category" varStatus="num">
        <li><a href="#model0${num.count}" class="${category.className}">${category.title}</a></li>
    </c:forEach>

</ul>
