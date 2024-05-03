<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 5/2/24
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let mypage = {
        init: function () {
        }
    };
    $(function () {
        mypage.init();
    });
</script>
<div class="mypage">
    <div>${user.userId}</div>
    <div>${user.nickname}</div>
    <div>${user.email}</div>
    <button>
        <a href="<c:url value="/logout"/>">
            <div>현재 ID${sessionScope.id} 로그아웃</div>
        </a>
    </button>
    <button>
        <a href="<c:url value="/users/info"/>">
            <div>닉네임 변경페이지</div>
        </a>
    </button>
    <button>
        <a href="<c:url value="/users/myscraps"/>">
            <div>나의 스크랩</div>
        </a>
    </button>
    <button>
        <a href="<c:url value="/users/myposts"/>">
            <div>내가 작성한 글</div>
        </a>
    </button>
</div>
