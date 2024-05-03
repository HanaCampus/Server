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
</script>

<div class="freeBoard">
    <div class="header">
        <button class="back" onclick="history.back()">⇦</button>
        <h3 class="title">자유게시판</h3>
        <button class="back hidden"></button>
    </div>

    <div class="breadcrumbs">
        <a href="<c:url value="/"/>">게시판 목록</a>
        <span class="dot">></span>
        <a href="<c:url value="/boards"/>?id=1">자유게시판</a>

    </div>

    <div class="search">
        <input type="text" name="searchInput" id="searchInput">
        <button id="searchBtn">🔍</button>
    </div>

    <div class="postListContainer">
        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                <div class="title">제목</div>
                <div class="content">내용</div>
                <div class="info">
                    <div class="infoBox1">
                        <span>n시간 전</span>
                        |
                        <span>익명</span>
                    </div>
                    <div class="infoBox2">
                        <div class="like">제목</div>
                        <div class="comment">제목</div>
                    </div>
                </div>
            </a>
        </div>

        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                - 게시글2
            </a>
        </div>

        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=1">
                - 게시글3
            </a>
        </div>
    </div>
</div>

