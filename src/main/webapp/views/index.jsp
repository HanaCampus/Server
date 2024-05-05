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
            var alertMessage = "${alertMessage}";
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
    <meta charset="utf-8" />
    <link rel="stylesheet" href="<c:url value="/css/index.css" />" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판 모음 | HANA CAMPUS</title>
    <meta property="og:type" content="website" />
    <meta
            property="og:image"
            content="/_next/static/media/og-image.aec7a121.png"
    />
    <meta property="og:site_name" content="HANA CAMPUS" />
    <meta property="og:locale" content="ko_KR" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta name="twitter:card" content="summary_large" />
    <meta
            name="twitter:image"
            content="/_next/static/media/og-image.aec7a121.png"
    />
    <meta
            name="description"
            content="HANA CAMPUS는 디지털 하나로 교육생들의 커뮤니티 공간입니다."
    />
    <meta property="og:title" content="게시판 모음" />
    <meta
            property="og:description"
            content="HANA CAMPUS는 디지털 하나로 교육생들의 커뮤니티 공간입니다."
    />
    <meta
            property="og:url"
            content="https://hanacampus.com/articles/categories"
    />
    <meta name="twitter:title" content="게시판 모음" />
    <meta
            name="twitter:description"
            content="HANA CAMPUS는 디지털 하나로 교육생들의 커뮤니티 공간입니다."
    />
    <meta name="next-head-count" content="18" />

    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />
    <meta charset="UTF-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
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
    <noscript data-n-css=""> </noscript>
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
            <h2 class="css-1wvv5q9">
                <a href="/"
                ><div class="css-1icvysg">
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 124 19"
                            aria-hidden="true"
                            focusable="false"
                            class="nav-icon"
                    >
                        <circle cx="49.5" cy="14.5" r="2.5" fill="#61A3F3"></circle>
                    </svg>
                    <span
                            style="
                    position: absolute;
                    border: 0px;
                    width: 1px;
                    height: 1px;
                    padding: 0px;
                    margin: -1px;
                    overflow: hidden;
                    clip: rect(0px, 0px, 0px, 0px);
                    white-space: nowrap;
                    overflow-wrap: normal;
                  "
                    >HANA CAMPUS</span
                    >
                </div></a
                >
            </h2>
            <div class="css-uewl2b">
                <a class="css-1vfruvg" href="/legal/1"
                >커뮤니티 이용 약관 및 개인정보 처리 방침</a
                >
            </div>
            <div class="css-uewl2b">
            <span>팀 연락처: </span
            ><a href="mailto:test@gmail.com" class="css-1etjkub"
            >test@gmail.com</a
            >
            </div>
            <div class="css-uewl2b">© 2024. HANA CAMPUS. All rights reserved.</div>
        </footer>
    </div>
</div>

</body>
</html>
