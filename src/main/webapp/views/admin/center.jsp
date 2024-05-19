<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/28/24
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<div>
    <div class="css-65egb5">
        <a class="css-hthzsn" href="<c:url value="/admins/reportedposts"/>">
            <div>
                <h2 class="css-kdssxn">게시글 신고 내역</h2>
            </div>
            <img src="<c:url value="/img/board1.png"/>"
                 alt="게시글 신고 내역 이미지"
                 loading="lazy"
                 width="80px"
                 decoding="async"
                 data-nimg="1"
                 class="css-1grjlwr"/>
        </a>
        <a class="css-hthzsn" href="<c:url value="/admins/reportedcomments"/>">
            <div>
                <h2 class="css-kdssxn">댓글 신고 내역</h2>
            </div>
            <img src="<c:url value="/img/ByeolSong.png"/>"
                 alt="댓글 신고 내역 이미지"
                 loading="lazy"
                 width="80px"
                 decoding="async"
                 data-nimg="1"
                 class="css-1grjlwr"/>
        </a>
        <a class="css-hthzsn" href="<c:url value="#"/>">
            <div>
                <h2 class="css-kdssxn">공지사항 관리</h2>
            </div>
            <img src="<c:url value="/img/ByeolTogether.png"/>"
                 alt="공지사항 관리 이미지"
                 loading="lazy"
                 width="150px"
                 decoding="async"
                 data-nimg="1"
                 class="css-1grjlwr"/>
        </a>
    </div>
</div>