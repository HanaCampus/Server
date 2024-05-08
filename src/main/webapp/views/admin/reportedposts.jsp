<%@ page import="static org.eclipse.tags.shaded.org.apache.regexp.RETest.test" %><%--
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
        <div class="back"><a class="backBtn" href="<c:url value="/admin/"/>">⇦</a></div>
        <h3 class="title">"게시글 신고 내역"</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/admin/"/>">신고 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/admin/reportedposts"/>">게시글 신고 내역</a>
        </div>

    </div>

    <div class="postList">
        <c:forEach var="p" items="${posts}">
            <div class="postItem">
                <a href="<c:url value="/posts"/>?id=${p.postDto.postId}">
                    <h2 class="title">${p.postDto.title}</h2>
                    <div class="content">${p.postDto.content}</div>
                    <div class="info">
                        <div class="textInfo">
                            <span>${p.createDate}</span>
                            <span class="division">|</span>
                            <span>${p.writerDto.nickname}</span>
                        </div>
                        <div class="cntInfo">
                            <div class="like item"><span class="imoticon">👍🏿</span><span class="cnt">${p.postDto.likes}</span></div>
                            <div class="comment item"><span class="imoticon">◘</span><span class="cnt">${p.postDto.commentCount}</span></div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
</div>

