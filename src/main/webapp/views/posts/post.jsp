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
        <a href="<c:url value="/boards"/>?id=${boardId}">${boardId==1? "자유게시판" : "게시판 추가"}</a>
        <span class="dot">></span>
        <a href="<c:url value="/posts"/>?id=${postId}">게시글 상세</a>
    </div>

    <div class="postInfo">
        <div class="userAndMenuBox">
            <div class="user"><img src="#"/>
                <c:if test="${post.anonymous == false}">
                    ${post.userDto.nickname}
                </c:if>
                <c:if test="${post.anonymous == true}">
                    익명
                </c:if>
            </div>
            <button class="menuBtn">¦</button>
        </div>
        <div class="time">${post.createDate}</div>
        <div class="title">${post.title}</div>
        <div class="content">${post.content}</div>
        <div class="cntBox">
            <div class="BoxItem">
                <div class="item"><span class="imoticon">${c.isLiked==null ? "🩶️":"❤️"}️</span><span class="cnt">${post.likes}</span></div>
                <div class="item"><span class="imoticon">🔖</span><span class="cnt">${post.commentCount}</span></div>
            </div>

            <div class="BoxItem">
                <div class="item noneMarginItem"><span class="imoticon">🔖</span><span class="cnt">${post.scraps}</span></div>
            </div>
        </div>
    </div>

    <div class="commentContainer">
        <div class="commentList">
            <c:forEach var="c" items="${comments}">
                <div class="comment">
                    <div class="innerBox">
                        <div class="user">
                            <div class="userThumbnail">
<%--                                <img src="<c:url value="/img/anonymous.png"/>"/>--%>
                            </div>
                            <c:if test="${c.anonymous == false}">
                                ${c.userDto.nickname}
                            </c:if>
                            <c:if test="${c.anonymous == true}">
                                익명
                            </c:if>
                        </div>
                        <div class="rightBox">
                            <div class="cntItem"><span class="imoticon">${c.isLiked==null ? "🩶️":"❤️"}</span><span class="cnt">${c.likes}</span></div>
                            <button class="menuBtn">¦</button>
                        </div>
                    </div>
                    <div class="content">${c.content}</div>
                    <div class="time">${c.createDate}</div>
                </div>
            </c:forEach>

        </div>

        <div class="write">
            <c:choose>
                <c:when test="${sessionScope.id == null}">
                  <textarea type="text" name="writeTextArea" id="writeTextArea" placeholder="로그인 먼저 해주세요!" disabled></textarea>
                </c:when>
              <c:otherwise>
                <textarea type="text" name="writeTextArea" id="writeTextArea"></textarea>
              </c:otherwise>
            </c:choose>
          
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

