<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/28/24
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<div class="text-center">
    <div></div>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=${kakaoApiKey}&redirect_uri=${redirectUrl}&response_type=code">
        <img src="<c:url value="/img/kakao_login_medium_narrow.png"/>">
    </a>
</div>

