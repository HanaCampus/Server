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
                if(window.confirm('댓글을 등록하시겠습니까?')) {
                    this.send();
                }
            });
        },
        send: function () {
            $('#writeCommentForm').attr({
                'method': 'post',
                'action': '<c:url value="/posts/writecomment"/>'
                <%--'action': '<c:url value="/posts?id="/>'+${postId}--%>
            });
            $('#writeCommentForm').submit();
        }
    };

    $(function () {
        post.init();
    });


    /* Dropdown을 토글하는 함수 */
    function toggleDropdownPost() {
        let dropdownContent1 = document.getElementById("myDropdownPost");
        dropdownContent1.classList.toggle("show");
    }
    function toggleDropdownComment() {
        let dropdownContent2 = document.getElementById("myDropdownComment");
        dropdownContent2.classList.toggle("show");
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
    <div class="header" style="font-weight: bold;">
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

            <c:if test="${id==post.userDto.userId}">
                <div class="dropdown">
                    <button onclick="toggleDropdownPost()" class="menuBtn dropbtn" style="color:black">¦</button>
                    <div id="myDropdownPost" class="dropdown-content">
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
                            <c:if test="${id==c.userDto.userId}">
                                <div class="dropdown">
                                    <button onclick="toggleDropdownComment()" class="menuBtn dropbtn" style="color:black">¦</button>
                                    <div id="myDropdownComment" class="dropdown-content">
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

