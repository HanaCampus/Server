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


<script>
    let post = {
        init: function () {
            // 전송 버튼 event handler
            $('#writeBtn').click(() => {
                // 제목이나 내용 안 쓰면 쓰라고 alert문 띄워주는 유효성 체크하기
                if(window.confirm('댓글 등록하시겠습니까?')) {
                    this.send();
                }
            });
        },
        send: function () {
            $('#writeCommentForm').attr({
                'method': 'post',
                'action': '<c:url value="/posts/writecomment?postId=${postId}"/>'
            });
            $('#writeCommentForm').submit();
        }
    };
    $(function () {
        post.init();
    });

    /* Dropdown을 토글하는 함수 */
    function toggleDropdownPost() {
        let dropdownPostContent = document.getElementById("myDropdownPost");
        dropdownPostContent.classList.toggle("show");
    }
    function toggleDropdownComment(commentId) {
        let dropdownCommentContent = document.getElementById("myDropdownComment" + commentId);
        dropdownCommentContent.classList.toggle("show");
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

    document.addEventListener('DOMContentLoaded', function() {
        var likeButtons = document.querySelectorAll('.likeEmoticon');

        likeButtons.forEach(function(likeButton) {
            likeButton.addEventListener('click', function(event) {
                event.stopPropagation();
                var postId = this.getAttribute('data-post-id');
                var isLiked = this.classList.contains('liked');
                if(isLiked){
                    $.ajax({
                        type: 'DELETE',
                        url: "<c:url value="/likes/post"/>?id="+postId,
                        success: function (response) {
                            let newCount = response;

                            likeButton.innerHTML = '<img src="<c:url value="/img/likeNone.svg"/>" alt="like"/>';
                            likeButton.classList.remove('liked');
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                }else{
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

    //COMMENT 좋아요
    document.addEventListener('DOMContentLoaded', function() {
        var likeButtons = document.querySelectorAll('.likePostEmoticon');
        console.log("??", likeButtons);
        likeButtons.forEach(function(likeButton) {
            likeButton.addEventListener('click', function(event) {
                event.stopPropagation();
                var commentId = this.getAttribute('data-comment-id');
                var isLiked = this.classList.contains('liked');
                if(isLiked){
                    $.ajax({
                        type: 'DELETE',
                        url: "<c:url value="/likes/comment"/>?id="+commentId,
                        success: function (response) {
                            let newCount = response;

                            likeButton.innerHTML = '<img src="<c:url value="/img/likeNone.svg"/>" alt="like"/>';
                            likeButton.classList.remove('liked');
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                }else{
                    $.ajax({
                        type: 'POST',
                        url: '<c:url value="/likes/comment"/>?id='+commentId,
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


<div class="post">
    <div class="header">
        <div class="back"><a class="backBtn" href="<c:url value="/boards"/>?id=1&pageNo=1">⇦</a></div>
        <h3 class="title">자유 게시판</h3>
        <div class="back"></div>
    </div>

    <div class="breadcrumbs">
        <a href="<c:url value="/"/>">게시판 목록</a>
        <span class="dot">></span>
        <a href="<c:url value="/boards"/>?id=${boardId}&pageNo=1">${boardName}</a>
        <span class="dot">></span>
        <a href="<c:url value="/posts"/>?id=${postId}">게시글 상세</a>
    </div>

    <div class="postInfo">
        <div class="userAndMenuBox">
            <div class="user big">
                <c:if test="${post.anonymous == false}">
                    <div class="userThumbnail">
                        ${post.userDto.nickname.charAt(0)}
                    </div>
                    ${post.userDto.nickname}
                </c:if>
                <c:if test="${post.anonymous == true}">
                    <div class="userThumbnail">
                        <img src="<c:url value="/img/anonymous.png"/>"/>
                    </div>
                    익명
                </c:if>
            </div>

            <c:if test="${id==post.userDto.userId}">
                <div class="dropdown">
                    <img onclick="toggleDropdownPost()" class="menuBtn dropbtn" src="<c:url value="/img/menu.svg"/>"/>
                    <div id="myDropdownPost" class="dropdown-content">
                        <a href="<c:url value="/posts/updatepost?postId=${postId}"/>">수정하기</a>
                        <a href="<c:url value="/posts/deletePost?postId=${postId}&boardId=${post.boardId}"/>">삭제하기</a>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="time">${post.createDate}</div>
        <div class="title">${post.title}</div>
        <div class="content">${post.content}</div>
        <div class="cntBox">
            <div class="BoxItem">
                <div class="like item">
                    <!-- 좋아요 버튼 -->
                    <c:choose>
                        <c:when test="${sessionScope.id == null}">
                            <!-- 로그인되지 않은 경우 -->
                            <button class="likeEmoticon" onclick="pleaseLogin()">
                                <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                            </button>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인된 경우 -->
                            <c:choose>
                                <c:when test="${post.isLiked == null}">
                                    <!-- 좋아요를 하지 않은 경우 -->
                                    <button class="likeEmoticon likeButton" data-post-id="${post.postId}">
                                        <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 좋아요를 이미 한 경우 -->
                                    <button class="likeEmoticon likeButton liked" data-post-id="${post.postId}">
                                        <img src="<c:url value='/img/like.svg'/>" alt="like"/>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                    <!-- 좋아요 수 -->
                    <span class="cnt">${post.likes}</span>
                </div>
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
                            <c:if test="${c.anonymous == false}">
                                <div class="userThumbnail">
                                    ${c.userDto.nickname.charAt(0)}
                                </div>
                                ${c.userDto.nickname}
                            </c:if>
                            <c:if test="${c.anonymous == true}">
                                <div class="userThumbnail">
                                    <img src="<c:url value="/img/anonymous.png"/>"/>
                                </div>
                                익명
                            </c:if>
                        </div>
                        <div class="rightBox">
                            <div class="cntItem">
                                    <!-- 좋아요 버튼 -->
                                    <c:choose>
                                        <c:when test="${sessionScope.id == null}">
                                            <!-- 로그인되지 않은 경우 -->
                                            <button class="likePostEmoticon" onclick="pleaseLogin()">
                                                <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- 로그인된 경우 -->
                                            <c:choose>
                                                <c:when test="${c.isLiked == null}">
                                                    <!-- 좋아요를 하지 않은 경우 -->
                                                    <button class="likePostEmoticon likeButton" data-comment-id="${c.commentId}">
                                                        <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <!-- 좋아요를 이미 한 경우 -->
                                                    <button class="likePostEmoticon likeButton liked" data-comment-id="${c.commentId}">
                                                        <img src="<c:url value='/img/like.svg'/>" alt="like"/>
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    <!-- 좋아요 수 -->
                                    <span class="cnt">${c.likes}</span>

                            </div>
                            <c:if test="${id==c.userDto.userId}">
                                <div class="dropdown">
                                    <img onclick="toggleDropdownComment(${c.commentId})" class="menuBtn dropbtn" src="<c:url value="/img/menu.svg"/>"/>
                                    <div id="myDropdownComment${c.commentId}" class="dropdown-content">
                                        <a href="<c:url value="/posts/deleteComment?commentId=${c.commentId}&postId=${postId}"/>">삭제하기</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="content" id="contentText">${c.content}</div>
                    <div class="time">${c.createDate}</div>
                </div>
            </c:forEach>
        </div>

        <form id="writeCommentForm">
            <div class="write">
                <c:choose>
                    <c:when test="${sessionScope.id == null}">
                        <textarea type="text" name="content" id="writeTextArea" placeholder="로그인 먼저 해주세요!" disabled></textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea type="text" name="content" id="writeTextArea"></textarea>
                    </c:otherwise>
                </c:choose>

                <div class="regist">
                    <div class="anonymous">
                        <input
                                type="checkbox"
                                id="anonymousCheckBox"
                                name="anonymous"/>
                        <label for="anonymousCheckBox">익명</label>
                    </div>
                    <button id="writeBtn" type="button">➤</button>
                </div>
            </div>
        </form>
    </div>
</div>

