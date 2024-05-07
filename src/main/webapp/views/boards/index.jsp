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
    let board = {
        init: function () {
            $('#searchBtn').click(() => {
                // 유효성 체크

                this.send();
            });
        },
        send: function () {
            $('#searchForm').attr({
                'method': 'post',
                'action': '<c:url value="/boards/search"/>?id=${boardId}&pageNo=1'
            });
            $('#searchForm').submit();
        }
    };

    $(function () {
        board.init();
    });

    function pleaseLogin() {
        alert("로그인 후, 이용해주세요!");
        location.reload();
    }
</script>

<div class="freeBoard">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/"/>">⇦</a></div>
        <h3 class="title">${boardId == 1 ? "자유 게시판" : "게시판 추가"}</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/"/>">게시판 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/boards"/>?id=${boardId}">${boardId == 1 ? "자유 게시판" : "게시판 추가"}</a>
        </div>

        <div class="button">
            <c:choose>
                <c:when test="${sessionScope.id == null}">
                    <a onclick="pleaseLogin()">글쓰기</a>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value="/posts/writepost"/>?boardId=${boardId}">글쓰기</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <form id="searchForm">
        <div class="search">
            <input type="text" name="searchKeyword" id="searchInput">
            <button id="searchBtn" type="button">🔍</button>
        </div>
    </form>

    <jsp:include page="../pagination.jsp"/>

    <div class="postList">
        <c:forEach var="p" items="${cpage.getList()}">
        <div class="postItem">
            <a href="<c:url value="/posts"/>?id=${p.postId}">
                <h2 class="title">${p.title}</h2>
                <div class="content">${p.content}</div>
                <div class="info">
                    <div class="textInfo">
                        <span>${p.createDate}</span>
                        <span class="division">|</span>
                        <c:if test="${p.anonymous == false}">
                            <span>${p.userDto.nickname}</span>
                        </c:if>
                        <c:if test="${p.anonymous == true}">
                            <span>익명</span>
                        </c:if>
                    </div>
                    <div class="cntInfo">
                        <div class="like item"><span class="imoticon">👍🏿</span><span class="cnt">${p.likes}</span></div>
                        <div class="comment item"><span class="imoticon">◘</span><span class="cnt">${p.commentCount}</span></div>
                    </div>
                </div>
            </a>
        </div>
        </c:forEach>
    </div>
</div>

