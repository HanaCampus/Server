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

            $('#writePostBtn').click(() => {
                let boardId = $('#boardId').val();
                location.href = "<c:url value="/posts/writepost"/>?boardId=" + boardId + "&pageNo=1";
            })
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

    function onClickPostDetail(postId){
        location.href = "<c:url value="/posts"/>?id=" + postId;
    }

    // POST 좋아요
    document.addEventListener('DOMContentLoaded', function() {
        let likeButtons = document.querySelectorAll('.imoticon');

        likeButtons.forEach(function(likeButton) {
            likeButton.addEventListener('click', function(event) {
                event.stopPropagation();
                let postId = this.getAttribute('data-post-id');
                let isLiked = this.classList.contains('liked');
                if(isLiked) {
                    $.ajax({
                        type: 'DELETE',
                        url: "<c:url value="/likes/post"/>?id=" + postId,
                        success: function (response) {
                            let newCount = response;

                            likeButton.innerHTML = '<img src="<c:url value="/img/likeNone.svg"/>" alt="like"/>';
                            likeButton.classList.remove('liked');
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '<c:url value="/likes/post"/>?id=' + postId,
                        success: function (response) {
                            let newCount = response;
                            console.log(newCount,"?S?S");
                        // 좋아요 이미지 변경
                            likeButton.innerHTML = '<img src="<c:url value="/img/like.svg"/>" alt="like"/>';
                            likeButton.classList.add('liked'); // 좋아요 상태로 변경
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                }

            });
        });
    });


</script>

<div class="board">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/"/>">⇦</a></div>
        <h3 class="title">${boardName}</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs">
        <div>
            <a href="<c:url value="/"/>">게시판 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/boards"/>?id=${boardId}&pageNo=1">${boardName}</a>
        </div>
    </div>

    <form id="searchForm">
        <div class="search">
            <input type="text" name="searchKeyword" id="searchInput">
            <button id="searchBtn" type="button"><img src="<c:url value="/img/search.svg"/>"/></button>
        </div>
    </form>

    <jsp:include page="../pagination.jsp"/>

    <div class="postList">
        <c:forEach var="p" items="${cpage.getList()}">
            <div class="postItem">
                <div onclick="onClickPostDetail(${p.postId})">
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
                            <div class="like item">
                                <!-- 좋아요 버튼 -->
                                <c:choose>
                                    <!-- 로그인되지 않은 경우 -->
                                    <c:when test="${sessionScope.id == null}">
                                        <button class="imoticon" onclick="pleaseLogin()">
                                            <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                        </button>
                                    </c:when>
                                    <!-- 로그인된 경우 -->
                                    <c:otherwise>
                                        <c:choose>
                                            <!-- 좋아요를 하지 않은 경우 -->
                                            <c:when test="${p.isLiked == null}">
                                                <button class="imoticon likeButton" data-post-id="${p.postId}">
                                                    <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                                </button>
                                            </c:when>
                                            <!-- 좋아요를 이미 한 경우 -->
                                            <c:otherwise>
                                                <button class="imoticon likeButton liked" data-post-id="${p.postId}">
                                                    <img src="<c:url value='/img/like.svg'/>" alt="like"/>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                                <!-- 좋아요 수 -->
                                <span class="cnt">${p.likes}</span>
                            </div>
                            <div class="comment item">
                                <span class="imoticon"><img src="<c:url value="/img/comment.svg"/>"/></span>
                                <span class="cnt">${p.commentCount}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<c:if test="${sessionScope.id != null}">
    <img id="writePostBtn" src="<c:url value="/img/writePostBtn.svg"/> ">
</c:if>

<%-- sesson_id 정보 --%>
<input type="hidden" id="userId" value="${sessionScope.id}">

<%-- board_id 정보 --%>
<input type="hidden" id="boardId" value="${boardId}">
