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

    /* 사용자 정보 및 메뉴 상자 스타일 */
    .userAndMenuBox {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
    }

    /* 검색 및 선택 드롭다운 스타일 */
    .search select {
        padding: 5px 10px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }

    #searchBtn {
        margin-left: 10px;
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #searchBtn:hover {
        background-color: #45a049; /* 호버 효과 */
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
        <div class="back"><a class="backBtn" href="<c:url value="/admins/"/>"><img src="/img/back.svg"/></a></div>
        <h3 class="title">게시글 신고 내역</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs postHome">
        <div>
            <a href="<c:url value="/admins/"/>">신고 목록</a>
            <span class="dot">></span>
            <a href="<c:url value="/admins/reportedposts"/>">게시글 신고 내역</a>
            <span class="dot">></span>
            <a href="<c:url value="/admins/postInfo"/>?id=${post.postDto.postId}">신고 상세</a>
        </div>
    </div>

    <div class="postInfo">
        <div class="userAndMenuBox">
            <div class="user big">
                <div class="userThumbnail">
                        ${post.writerDto.nickname.charAt(0)}
                </div>
                ${post.writerDto.nickname}
            </div>
            <form id="searchForm">
                <div class="search">
                    <select name="search_select" id="search_select">
                        <option value="all" selected>유저 정지</option>
                        <option value="7">7일</option>
                        <option value="30">30일</option>
                        <option value="365">365일</option>
                        <button id="searchBtn" type="button">확인</button>
                    </select>
                </div>

            </form>

        </div>
        <div class="time">${post.createDate}</div>
        <div class="title">${post.postDto.title}</div>
        <div class="content">${post.postDto.content}</div>
    </div>

    <div class="reports">
            <div class="report"><span class="cnt">${category[0].getName()} : ${post.cntCategory1}</span></div>
            <div class="report"><span class="cnt">${category[1].getName()} : ${post.cntCategory2}</span></div>
            <div class="report"><span class="cnt">${category[2].getName()} : ${post.cntCategory3}</span></div>
            <div class="report"><span class="cnt">${category[3].getName()} : ${post.cntCategory4}</span></div>
            <div class="report"><span class="cnt">${category[4].getName()} : ${post.cntCategory5}</span></div>
            <div class="report"><span class="cnt">${category[5].getName()} : ${post.cntCategory6}</span></div>
            <div class="report"><span class="cnt">${category[6].getName()} : ${post.cntCategory7}</span></div>
    </div>
</div>

