<%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/posts/post.css" />" />
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


<div class="post">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/boards"/>?id=1">⇦</a></div>
        <h3 class="title">자유 게시판</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs">
        <a href="<c:url value="/"/>">게시판 목록</a>
        <span class="dot">></span>
        <a href="<c:url value="/boards"/>?id=1">자유 게시판</a>
        <span class="dot">></span>
        <a href="<c:url value="/posts"/>?id=1">게시글 상세</a>
    </div>

    <div class="postInfo">
        <div class="user"><img src="#"/>익명</div>
        <div class="time">날짜 | 시간</div>
        <div class="title">제목</div>
        <div class="content">내용</div>
        <div class="cntBox">
            <div class="BoxItem">
                <div class="item"><span class="imoticon">❤️</span><span class="cnt">8</span></div>
                <div class="item"><span class="imoticon">🔖</span><span class="cnt">2</span></div>
            </div>

            <div class="BoxItem">
                <div class="item"><span class="imoticon">🔖</span><span class="cnt">5</span></div>
            </div>
        </div>
    </div>

    <div class="commentContainer">
        <div class="comments">
            <div class="comment">
                <div class="childContent user"><img src="#"/>익명1</div>
                <div class="childContent content">내용1</div>
                <div class="childContent">날짜 | 시간</div>
            </div>

            <div class="comment">
                <div class="childContent user"><img src="#"/>익명2</div>
                <div class="childContent content">내용2</div>
                <div class="childContent">날짜 | 시간</div>
            </div>
        </div>

        <div class="write">
            <textarea type="text" name="writeTextArea" id="writeTextArea"></textarea>
            <div class="regist">
                <div class="anonymous">
                    <input
                            type="checkbox"
                            id="anonymousCheckBox"
                            name="anonymousCheckBox"
                            value="isAnonymous" />
                    <label for="anonymousCheckBox">익명</label>
                </div>
                <button id="writeBtn">➤</button>
            </div>
        </div>
    </div>
</div>

