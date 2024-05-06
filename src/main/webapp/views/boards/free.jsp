<%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />" />
<link rel="stylesheet" href="<c:url value="/css/boards/posts.css" />" />

<script>
    let free = {
        init: function () {

        }
    };

    $(function () {
        free.init();
    });

    function pleaseLogin() {
        alert("로그인 후, 이용해주세요!");
        location.reload();
    }
</script>

<div class="freeBoard">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/"/>">⇦</a></div>
        <h3 class="title">자유 게시판</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/"/>">게시판 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/boards"/>?id=1">자유 게시판</a>
        </div>

        <div class="button">
            <c:choose>
                <c:when test="${sessionScope.id == null}">
                    <a onclick="pleaseLogin()">글쓰기</a>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value="/posts/writepost"/>">글쓰기</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="search">
        <input type="text" name="searchInput" id="searchInput">
        <button id="searchBtn">🔍</button>
    </div>

    <div class="postList">
        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                <h2 class="title">제목1</h2>
                <div class="content">내용1</div>
                <div class="info">
                    <div class="textInfo">
                        <span>n시간 전</span>
                        <span class="division">|</span>
                        <span>익명</span>
                    </div>
                    <div class="cntInfo">
                        <div class="like item"><span class="imoticon">👍🏿</span><span class="cnt">5</span></div>
                        <div class="comment item"><span class="imoticon">◘</span><span class="cnt">2</span></div>
                    </div>
                </div>
            </a>
        </div>

        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                <h2 class="title">제목2</h2>
                <div class="content">내용2</div>
                <div class="info">
                    <div class="textInfo">
                        <span>n시간 전</span>
                        <span class="division">|</span>
                        <span>익명</span>
                    </div>
                    <div class="cntInfo">
                        <div class="like item"><span class="imoticon">👍🏿</span><span class="cnt">8</span></div>
                        <div class="comment item"><span class="imoticon">◘</span><span class="cnt">0</span></div>
                    </div>
                </div>
            </a>
        </div>

        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                <h2 class="title">제목3</h2>
                <div class="content">내용3</div>
                <div class="info">
                    <div class="textInfo">
                        <span>n시간 전</span>
                        <span class="division">|</span>
                        <span>익명</span>
                    </div>
                    <div class="cntInfo">
                        <div class="like item"><span class="imoticon">👍🏿</span><span class="cnt">2</span></div>
                        <div class="comment item"><span class="imoticon">◘</span><span class="cnt">5</span></div>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

