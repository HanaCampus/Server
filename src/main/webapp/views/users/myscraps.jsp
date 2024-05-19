<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 5/2/24
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let mypage = {
        init: function () {}
    };

    $(function () {
        mypage.init();
    });

    // 뒤로가기
    function goBack() {
        window.history.back();
    }

    function onClickPostDetail(postId) {
        location.href = "<c:url value="/posts"/>?id=" + postId;
    }

    // POST 좋아요
    document.addEventListener('DOMContentLoaded', function () {
        let likeButtons = document.querySelectorAll('.imoticon');

        likeButtons.forEach(function (likeButton) {
            likeButton.addEventListener('click', function (event) {
                event.stopPropagation();
                let postId = this.getAttribute('data-post-id');
                let isLiked = this.classList.contains('liked');
                if (isLiked) {
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

<div class="myscrap">
    <div class="header">
        <div class="back">
            <a class="backBtn" href="#" onclick="goBack()">
                <img src="/img/back.svg" alt="back">
            </a>
        </div>
        <h3 class="title">나의 스크랩</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs">
        <a href="<c:url value="/users/mypage"/>">프로필</a>
        <span class="dot">></span>
        <a href="<c:url value="/users/myscraps"/>">스크랩 게시물</a>
    </div>

    <div class="postList">
        <c:forEach var="p" items="${posts}">
            <div class="postItem">
                <div onclick="onClickPostDetail(${p.postId})">
                    <h2 class="title">${p.title}</h2>
                    <div class="content">${p.title}</div>
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
                            <%-- 좋아요 버튼 --%>
                            <div class="like item">
                                <c:choose>
                                    <c:when test="${sessionScope.id == null}">
                                        <button class="imoticon" onclick="pleaseLogin()">
                                            <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <%-- 좋아요를 하지 않은 경우 --%>
                                            <c:when test="${p.isLiked == null}">
                                                <button class="imoticon likeButton" data-post-id="${p.postId}">
                                                    <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                                </button>
                                            </c:when>
                                            <%-- 좋아요를 이미 한 경우 --%>
                                            <c:otherwise>
                                                <button class="imoticon likeButton liked" data-post-id="${p.postId}">
                                                    <img src="<c:url value='/img/like.svg'/>" alt="like"/>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                                    <%-- 좋아요 수 --%>
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
