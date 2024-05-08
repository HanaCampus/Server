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
<link rel="stylesheet" href="<c:url value="/css/posts/dropdown.css" />"/>
<style>
    /* 신고 사유 목록 스타일 */
    .reports {
        margin-top: 20px; /* 상단 여백 */
    }

    .report {
        background-color: #F2F2F2; /* 배경색 */
        border: 1px solid #ddd; /* 테두리 */
        padding: 10px 15px; /* 내부 패딩 */
        border-radius: 5px; /* 모서리 둥글게 처리 */
        margin-bottom: 10px; /* 요소 간 간격 */
        font-size: 0.95rem; /* 폰트 크기 */
        color: #333; /* 적절한 텍스트 색상 */
    }

    /* 검색 및 선택 드롭다운 스타일 */
    .search select {
        padding: 5px 10px;
        border-radius: 4px;
        border: 1px solid #3f3f3f;
    }

    /* 폼 컨테이너 스타일 */
    #suspendForm {
        display: flex; /* Flexbox를 사용하여 내부 요소들을 가로로 배치 */
        align-items: center; /* 내부 요소들을 수직 중앙 정렬 */
        justify-content: end; /* 내부 요소들을 우측 정렬 */
        padding: 10px; /* 적당한 패딩으로 요소들 사이의 여백 제공 */
        margin: 10px; /* 폼 외부의 여백 */
    }

    /* select 드롭다운 박스 스타일 */
    #search_select {
        padding: 5px 10px; /* 드롭다운 내부의 패딩 */
        margin-right: 5px; /* 버튼과의 간격 */
        border: 1px solid #ccc; /* 경계선 스타일 */
        border-radius: 4px; /* 모서리를 둥글게 */
    }

    /* 버튼 스타일 */
    #suspendBtn {
        padding: 5px 15px; /* 버튼 내부 패딩 */
        border: 1px solid #ffffff; /* 경계선 스타일 */
        background-color: #E0E0E0;
        color: black; /* 텍스트 색상 */
        cursor: pointer; /* 커서 스타일 */
    }

</style>
<script>
    let post = {
        init: function () {}
    };

    $(function () {
        post.init();
    });

    /* Dropdown을 토글하는 함수 */
    function toggleDropdown() {
        var dropdownContent = document.getElementById("myDropdown");
        dropdownContent.classList.toggle("show");
    }

    /* Dropdown이 열려 있을 때 다른 곳을 클릭하면 닫히도록 함 */
    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>

<div class="post">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/admins/reportedcomments"/>"><img src="/img/back.svg"/></a></div>
        <h3 class="title">댓글 신고 내역</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/admins"/>">신고 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/admins/reportedcomments"/>">댓글 신고 내역</a>
            <span class="dot">></span>
            <a href="<c:url value="/admins/commentInfo"/>?id=${comment.commentDto.commentId}">신고 상세</a>
        </div>
    </div>

    <div class="postInfo">
        <div class="userAndMenuBox">
            <div class="user big">
                <div class="userThumbnail">
                        ${comment.writerDto.nickname.charAt(0)}
                </div>
                ${comment.writerDto.nickname}
            </div>
            <div class="time">${comment.createDate}</div>
        </div>

        <div class="content">${comment.commentDto.content}</div>
    </div>

    <div class="reports">
            <div class="report"><span class="cnt">${category[0].getName()} : ${comment.cntCategory1}</span></div>
            <div class="report"><span class="cnt">${category[1].getName()} : ${comment.cntCategory2}</span></div>
            <div class="report"><span class="cnt">${category[2].getName()} : ${comment.cntCategory3}</span></div>
            <div class="report"><span class="cnt">${category[3].getName()} : ${comment.cntCategory4}</span></div>
            <div class="report"><span class="cnt">${category[4].getName()} : ${comment.cntCategory5}</span></div>
            <div class="report"><span class="cnt">${category[5].getName()} : ${comment.cntCategory6}</span></div>
            <div class="report"><span class="cnt">${category[6].getName()} : ${comment.cntCategory7}</span></div>
    </div>

    <form id="suspendForm" action="/admins/updateSuspendDate" method="post">
        <div class="suspend">
            <select name="suspend_days" id="search_select">
                <option value="all" selected>유저 정지</option>
                <option value="7">7일</option>
                <option value="30">30일</option>
                <option value="365">365일</option>
                <option value="영구 정지">영구 정지</option>
            </select>
            <button id="suspendBtn" type="submit">확인</button>
            <input name="userId" value="${comment.writerDto.userId}" type="hidden" />
            <input name="commentId" value="${comment.commentDto.commentId}" type="hidden" />
        </div>
    </form>
</div>

