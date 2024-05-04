<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/30/24
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let nav = {
        init: function () {
        }
    };
    const onClickLoginPage = () => {
        location.href = "<c:url value='/auth/sign-in'/>";
    };
    $(function () {
        nav.init();
    });
</script>
<div class="navigation-bar">
    <div class="nav-item">
        <a href="<c:url value="/"/>">
            <span style="color: #028e25; font-weight: bold">HANA CAMPUS</span>
        </a>
    </div>
    <div></div>
    <div class="button-group">
        <div class="button-container">
            <c:choose>
                <c:when test="${sessionScope.id == null}">
                    <button onclick="onClickLoginPage()">
                        <div>로그인</div>
                    </button>
                </c:when>
                <c:otherwise>
                    <button>
                        <a href="<c:url value="/users/mypage"/>">
                            <div>마이페이지</div>
                        </a>
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

