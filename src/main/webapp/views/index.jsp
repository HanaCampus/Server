<%--
  Created by IntelliJ IDEA.
  User: takgyun
  Date: 2024/04/26
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/js/common.js" />"></script>

<script>
    let index = {
        init: function () {
            let alertMessage = "${alertMessage}";
            if (alertMessage) {
                alert(alertMessage);
            }
        }
    };

    $(function () {
        index.init();
    });
</script>

<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="<c:url value="/css/index.css" />"/>
    <link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>
    <%-- TODO: posts.css 중복 삭제 --%>
    <link rel="stylesheet" href="<c:url value="/css/boards/posts.css" />"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <%--  카카오톡 공유 썸네일 설정  --%>
    <meta property="og:url" content="http://43.203.197.213/">
    <meta property="og:title" content="HANA CAMPUS">
    <meta property="og:type" content="website">
    <meta property="og:image" content="<c:url value="/img/logo.png"/>">
    <meta property="og:description" content="HANA CAMPUS는 디지털 하나로 교육생들의 커뮤니티 공간입니다.">
    <title>게시판 모음 | HANA CAMPUS</title>
    <%--  카카오톡 공유 썸네일 설정  --%>

    <meta property="og:site_name" content="HANA CAMPUS"/>
    <meta property="og:locale" content="ko_KR"/>
    <meta property="og:image:width" content="1200"/>
    <meta property="og:image:height" content="630"/>
    <meta name="twitter:card" content="summary_large"/>
    <meta
            name="twitter:image"
            content="/_next/static/media/og-image.aec7a121.png"
    />
    <meta name="twitter:title" content="게시판 모음"/>
    <meta
            name="twitter:description"
            content="HANA CAMPUS는 디지털 하나로 교육생들의 커뮤니티 공간입니다."
    />
    <meta name="next-head-count" content="18"/>

    <meta name="msapplication-TileColor" content="#ffffff"/>
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png"/>
    <meta name="theme-color" content="#ffffff"/>
    <meta charset="UTF-8"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link
            rel="preconnect"
            href="https://fonts.gstatic.com"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            data-href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&amp;display=swap"
    />
    <link
            rel="stylesheet"
            as="style"
            crossorigin="anonymous"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.7/dist/web/static/pretendard-dynamic-subset.css"
    />
    <link
            rel="preload"
            href="/_next/static/css/36840340f3f01bb9.css"
            as="style"
    />
    <link
            rel="stylesheet"
            href="/_next/static/css/36840340f3f01bb9.css"
            data-n-g=""
    />
    <noscript data-n-css=""></noscript>
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;700&amp;display=swap"
    />
</head>

<body>
<div id="__next">
    <div class="main-container">
        <h1 class="main-title">게시판 모음</h1>
        <main class="main-content">
            <jsp:include page="nav.jsp"/>
            <c:choose>
                <c:when test="${center == null}">
                    <jsp:include page="center.jsp"/>
                </c:when>
                <c:otherwise>
                    <jsp:include page="${center}.jsp"/>
                </c:otherwise>
            </c:choose>
        </main>
        <footer class="hana-footer">
            <div class="css-uewl2b">
                <a class="css-1vfruvg" href="/legal/1">
                    커뮤니티 이용 약관 및 개인정보 처리 방침
                </a>
            </div>
            <div class="css-uewl2b">
                <span>팀 연락처: </span>
                <a href="mailto:test@gmail.com" class="css-1etjkub">
                    test@gmail.com
                </a>
            </div>
            <div class="css-uewl2b">© 2024. HANA CAMPUS. All rights reserved.</div>
        </footer>
    </div>
</div>
</body>
</html>
