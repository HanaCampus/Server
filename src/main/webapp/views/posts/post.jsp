<%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/posts/free.css" />" />
<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>

<script>
    let post = {
        init: function () {

        }
    };

    $(function () {
        post.init();
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
        <a href="<c:url value="/boards"/>?id=1">자유 게시판</a>
        <span class="dot">></span>
        <a href="<c:url value="/posts"/>?id=1">게시글 상세</a>
    </div>

    <div class="parentContent">
        <div class="childContent user"><img src="#"/>익명</div>
        <div class="childContent">날짜 | 시간</div>
        <div class="childContent title">제목</div>
        <div class="childContent content">내용</div>
        <div class="childContent bottom">
            <div>❤️</div>
            <div>🔖</div>
        </div>
    </div>

    <div class="parentComment">
        <div class="childContent user"><img src="#"/>익명1</div>
        <div class="childContent content">내용1</div>
        <div class="childContent">날짜 | 시간</div>
    </div>
    <div class="parentComment">
        <div class="childContent user"><img src="#"/>익명2</div>
        <div class="childContent content">내용2</div>
        <div class="childContent">날짜 | 시간</div>
    </div>

    <div class="write">
        <input type="text" name="writeInput" id="writeInput">
        <button id="writeBtn">📩</button>
    </div>
</div>

