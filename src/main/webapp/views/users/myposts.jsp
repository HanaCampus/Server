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
        init: function () {
        }
    };
    $(function () {
        mypage.init();
    });
</script>

<div class="myposts">
    <div class="myposts">
        <div class="breadcrumbs">
            <a href="<c:url value="/users/mypage"/>">프로필</a>
            <span class="dot">></span>
            <a href="<c:url value="/users/myposts"/>">내가 작성한 게시글1</a>
        </div>
        <div class="postList">
            <c:forEach var="p" items="${posts}">
                <div class="postItem">
                    <a href="<c:url value="/posts"/>?id=${p.postId}">
                        <h2 class="title">${p.title}</h2>
                        <div class="content">${p.title}</div>
                        <div class="info">
                            <div class="textInfo">
                                <span>${p.createDate}</span>
                                <span class="division">|</span>
                                <span>${user.nickname}</span>
<%--                                <span>${p.isAnonymous == true ? '익명' : user.nickname}</span>--%>
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
</div>
