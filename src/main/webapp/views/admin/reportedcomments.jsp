<%@ page import="static org.eclipse.tags.shaded.org.apache.regexp.RETest.test" %><%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/boards/posts.css" />"/>

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

    function redirectToExpiredReports() {
        window.location.href = '<c:url value="/admins/reportedcomments/complete"/>';
    }

</script>
<style>
    .expiredReportsButton {
        display: flex; /* Flexbox를 사용하여 내부 요소들을 가로로 배치 */
        align-items: center; /* 내부 요소들을 수직 중앙 정렬 */
        justify-content: end; /* 내부 요소들을 우측 정렬 */
        padding: 10px 20px;
        background-color: #4CAF50; /* 밝은 녹색 배경 */
        color: white; /* 흰색 텍스트 */
        border: none; /* 테두리 없음 */
        border-radius: 4px; /* 둥근 모서리 */
        cursor: pointer; /* 포인터 커서 */
        font-size: 16px; /* 폰트 크기 */
        margin: 10px 0; /* 상하 여백 */
        transition: background-color 0.3s; /* 색상 변화 애니메이션 */
    }

    .expiredReportsButton:hover {
        background-color: #45a049; /* 호버 시 더 어두운 녹색 */
    }

    .comletedReportsButton {
        display: flex;
        justify-content: end;
    }

    .cntInfo {
        display: flex;
        justify-content: end;
    }
</style>


<div class="freeBoard">
    <div class="header">
        <div class="back">
            <a class="backBtn" href="<c:url value="/admins"/>">
                <img src="/img/back.svg"/>
            </a>
        </div>
        <h3 class="title">댓글 신고 내역</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/admins"/>">신고 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/admins/reportedcomments"/>">댓글 신고 내역</a>
        </div>
    </div>

    <div class="postList">
        <c:forEach var="c" items="${comments}">
            <div class="postItem">
                <a href="<c:url value="/admins/commentInfo"/>?id=${c.commentDto.commentId}">
                    <h2 class="title">${c.writerDto.nickname}</h2>
                    <div class="content">${c.commentDto.content}</div>
                    <div class="info">
                        <div class="textInfo">
                            <span>${c.createDate}</span>
                        </div>
                        <div class="cntInfo">
                            <div class="like item"><span class="cnt">전체 신고 건수 : ${c.total}</span></div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    <div class="comletedReportsButton">
        <button class="expiredReportsButton" onclick="redirectToExpiredReports()">만료된 신고 내역</button>
    </div>
</div>

