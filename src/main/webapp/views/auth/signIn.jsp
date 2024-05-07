<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/28/24
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    .logo {
        width: 180px; /* 로고의 기본 크기 */
        margin: 20px 0; /* 로고 위아래로 20px의 마진 추가 */
    }

    .loginBtn img {
        width: 100%; /* 버튼의 너비를 부모 요소에 맞춤 */
    }

    @media (max-width: 767px) {
        .logo {
            width: 150px; /* 로고 크기 축소 */
        }
    }

    @media (max-width: 479px) {
        .logo {
            width: 120px; /* 더 작은 로고 크기 */
        }
        .loginBtn {
            padding: 10px;
        }
    }

    .loginBtn {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap; /* 요소들이 자연스럽게 줄바꿈 */
    }

    .logo, .loginBtn img {
        width: 50vw; /* 뷰포트 너비의 50% */
        max-width: 300px; /* 최대 너비 설정 */
        min-width: 150px; /* 최소 너비 설정 */
    }

    .loginBtn a {
        display: block; /* 링크를 블록 요소로 설정하여 마진 적용 가능 */
        margin: 20px 0; /* 링크 위아래로 20px의 마진 추가 */
    }

</style>

<div class="text-center">
    <div class="loginBtn">
        <img class="logo" src="/img/logo.png"/>
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=${kakaoApiKey}&redirect_uri=${redirectUrl}&response_type=code">
            <img src="<c:url value="/img/kakao_login_medium_wide.png"/>">
        </a>
    </div>
</div>

