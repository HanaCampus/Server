<%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/posts/post.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>
<link rel="stylesheet" href="<c:url value="/css/posts/dropdown.css" />"/>


<script>
    let post = {
        init: function () {
            // 전송 버튼 event handler
            $('#writeBtn').click(() => {
                let content = document.getElementById('writeTextArea').value;

                if (content.trim() === '') {
                    alert('내용을 입력해주세요.');
                    return;
                }

                sendComment();
            });
        },
        reportPost: function (reportCategoryId) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/reports/post"/>',
                data: {'id': ${postId}, 'reportCategoryId': reportCategoryId},
                success: function (data) {
                    if (data === "0") {
                        alert("해당 게시물의 신고가 이미 접수됐습니다.");
                        return;
                    }

                    alert("신고가 성공적으로 접수됐습니다.");
                }
            });
        },
        reportComment: function (commentId, reportCategoryId) {
            $.ajax({
                type: 'post',
                url: '<c:url value="/reports/comment"/>',
                data: {'id': commentId, 'reportCategoryId': reportCategoryId},
                success: function (data) {
                    if (data === "0") {
                        alert("해당 게시물의 신고가 이미 접수됐습니다.");
                        return;
                    }

                    alert("신고가 성공적으로 접수됐습니다.");
                }
            });
        }
    };

    $(function () {
        post.init();
    });

    // 댓글 작성
    function sendComment() {
        let formData = $('#writeCommentForm').serialize();
        $.ajax({
            type: 'POST',
            url: '<c:url value="/posts/writecomment?postId=${postId}"/>',
            data: formData,
            success: function (response) {
                window.location.replace('/posts?id=' +${postId});
            },
            error: function (xhr, status, error) {
                alert('댓글 추가에 실패했습니다.');
            }
        });
    }

    // 댓글 삭제
    function onClickDeleteComment(commentId) {
        $.ajax({
            type: 'DELETE',
            url: '<c:url value="/posts/deleteComment?"/>' + 'commentId=' + commentId + '&postId=${postId}',
            success: function (response) {
                window.location.replace('/posts?id=' +${postId});
            },
            error: function (xhr, status, error) {
                alert('댓글 삭제에 실패했습니다.');
            }
        });
    }

    // 게시글 삭제
    function onClickDeletePost() {
        $.ajax({
            type: 'DELETE',
            url: '<c:url value="/posts/deletePost?postId=${postId}&boardId=${post.boardId}"/>',
            success: function (response) {
                window.location.replace('<c:url value="/boards?id=${boardId}&pageNo=1"/>');
            },
            error: function (xhr, status, error) {
                alert('게시글 삭제에 실패했습니다.');
            }
        });
    }

    // 뒤로가기
    function goBack() {
        window.history.back();
    }

    /* Dropdown을 토글하는 함수 */
    function toggleDropdownMyPost() {
        let dropdownPostContent = document.getElementById("myDropdownPost");
        dropdownPostContent.classList.toggle("show");
    }

    function toggleDropdownOtherPost() {
        let dropdownPostContent = document.getElementById("otherDropdownPost");
        dropdownPostContent.classList.toggle("show");
    }

    function toggleDropdownMyComment(commentId) {
        let dropdownCommentContent = document.getElementById("myDropdownComment" + commentId);
        dropdownCommentContent.classList.toggle("show");
    }

    function toggleDropdownOtherComment(commentId) {
        let dropdownCommentContent = document.getElementById("otherDropdownComment" + commentId);
        dropdownCommentContent.classList.toggle("show");
    }

    function toggleReportDropdownPost() {
        let reportDropdownPost = document.getElementById("reportDropdownPost");
        reportDropdownPost.classList.toggle("show");
    }

    function toggleReportDropdownComment(commentId) {
        let reportDropdownComment = document.getElementById("reportDropdownComment" + commentId);
        reportDropdownComment.classList.toggle("show");
    }

    /* Dropdown이 열려 있을 때 다른 곳을 클릭하면 닫히도록 함 */
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            let dropdowns = document.getElementsByClassName("dropdown-content");
            let i;
            for (i = 0; i < dropdowns.length; i++) {
                let openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        let likeButtons = document.querySelectorAll('.likeEmoticon');

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

    // comment 좋아요
    document.addEventListener('DOMContentLoaded', function () {
        let likeButtons = document.querySelectorAll('.likePostEmoticon');
        likeButtons.forEach(function (likeButton) {
            likeButton.addEventListener('click', function (event) {
                event.stopPropagation();
                let commentId = this.getAttribute('data-comment-id');
                let isLiked = this.classList.contains('liked');
                if (isLiked) {
                    $.ajax({
                        type: 'DELETE',
                        url: "<c:url value="/likes/comment"/>?id=" + commentId,
                        success: function (response) {
                            let newCount = response;

                            likeButton.innerHTML = '<img src="<c:url value="/img/likeCommentNone.svg"/>" alt="like"/>';
                            likeButton.classList.remove('liked');
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                } else {
                    $.ajax({
                        type: 'POST',
                        url: '<c:url value="/likes/comment"/>?id=' + commentId,
                        success: function (response) {
                            let newCount = response;
                            // 좋아요 이미지 변경
                            likeButton.innerHTML = '<img src="<c:url value="/img/likeComment.svg"/>" alt="like"/>';
                            likeButton.classList.add('liked'); // 좋아요 상태로 변경
                            likeButton.nextElementSibling.textContent = newCount;
                        }
                    });
                }

            });
        });
    });

    // scrap 스크랩
    document.addEventListener('DOMContentLoaded', function () {
        let scrapBtn = document.querySelector('.scrapButton');
        scrapBtn.addEventListener('click', function (event) {
            let scrapId = this.getAttribute('data-scrap-id');
            let isScrap = this.classList.contains('isScrap');
            if (isScrap) {
                $.ajax({
                    type: 'DELETE',
                    url: "<c:url value="/scraps/post"/>?id=" + scrapId,
                    success: function (response) {
                        let newCount = response;
                        scrapBtn.innerHTML = '<img src="<c:url value="/img/scrapNone.svg"/>" alt="scrap"/>';
                        scrapBtn.classList.remove('isScrap');
                        scrapBtn.nextElementSibling.textContent = newCount;
                    }
                });
            } else {
                $.ajax({
                    type: 'POST',
                    url: '<c:url value="/scraps/post"/>?id=' + scrapId,
                    success: function (response) {
                        let newCount = response;
                        scrapBtn.innerHTML = '<img src="<c:url value="/img/scrap.svg"/>" alt="scrap"/>';
                        scrapBtn.classList.add('isScrap'); // 좋아요 상태로 변경
                        scrapBtn.nextElementSibling.textContent = newCount;
                    }
                });
            }
        });
    });
</script>

<div class="post">
    <div class="header">
        <div class="back">
            <a class="backBtn" href="#" onclick="goBack()">
                <img src="<c:url value='/img/back.svg'/>" alt="back"/>
            </a>
        </div>
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

            <c:if test="${sessionScope.id != null}">
                <c:choose>
                    <c:when test="${id==post.userDto.userId}">
                        <div class="dropdown">
                            <img onclick="toggleDropdownMyPost()" class="menuBtn dropbtn"
                                 src="<c:url value="/img/menu.svg"/>"/>
                            <div id="myDropdownPost" class="dropdown-content">
                                <a href="<c:url value="/posts/updatepost?postId=${postId}"/>">수정하기</a>
                                <button onclick="onClickDeletePost()">삭제하기</button>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <img onclick="toggleDropdownOtherPost()" class="menuBtn dropbtn"
                                 src="<c:url value="/img/menu.svg"/>"/>
                            <div id="otherDropdownPost" class="dropdown-content">
                                <a class="dropbtn" onclick="toggleReportDropdownPost()">신고하기⬇️</a>
                                <div id="reportDropdownPost" class="dropdown-content">
                                    <a onclick="post.reportPost(1)">게시판 및 성격 부적절함</a>
                                    <a onclick="post.reportPost(2)">욕설/비하</a>
                                    <a onclick="post.reportPost(3)">음란물/불건전 만남 및 대화</a>
                                    <a onclick="post.reportPost(4)">상업적 광고 및 판매</a>
                                    <a onclick="post.reportPost(5)">유출/사칭/사기</a>
                                    <a onclick="post.reportPost(6)">낚시/놀람/도배</a>
                                    <a onclick="post.reportPost(7)">정당/정치인 비하 및 운동</a>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
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
                        <!-- 로그인되지 않은 경우 -->
                        <c:when test="${sessionScope.id == null}">
                            <button class="likeEmoticon" onclick="pleaseLogin()">
                                <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                            </button>
                        </c:when>
                        <!-- 로그인된 경우 -->
                        <c:otherwise>
                            <c:choose>
                                <!-- 좋아요를 하지 않은 경우 -->
                                <c:when test="${post.isLiked == null}">
                                    <button class="likeEmoticon imoticon likeButton" data-post-id="${post.postId}">
                                        <img src="<c:url value='/img/likeNone.svg'/>" alt="like"/>
                                    </button>
                                </c:when>
                                <!-- 좋아요를 이미 한 경우 -->
                                <c:otherwise>
                                    <button class="likeEmoticon imoticon likeButton liked"
                                            data-post-id="${post.postId}">
                                        <img src="<c:url value='/img/like.svg'/>" alt="like"/>
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                    <!-- 좋아요 수 -->
                    <span class="cnt">${post.likes}</span>
                </div>

                <c:choose>
                    <%-- 로그인되지 않은 경우--%>
                    <c:when test="${sessionScope.id == null}">
                        <button class="scrapButton" onclick="pleaseLogin()">
                            <img src="<c:url value='/img/scrapNone.svg'/>" alt="scrap"/>
                        </button>
                    </c:when>
                    <%-- 로그인된 경우 --%>
                    <c:otherwise>
                        <c:choose>
                            <%-- 스크랩을 하지 않은 경우 --%>
                            <c:when test="${post.isScraped == null}">
                                <button class="scrapButton imoticon" data-scrap-id="${post.postId}">
                                    <img src="<c:url value='/img/scrapNone.svg'/>" alt="scrap"/>
                                </button>
                            </c:when>
                            <%-- 스크랩을 이미 한 경우 --%>
                            <c:otherwise>
                                <button class="scrapButton imoticon isScrap" data-scrap-id="${post.postId}">
                                    <img src="<c:url value='/img/scrap.svg'/>" alt="scrap"/>
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
                <span class="cnt">${post.scraps}</span>
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
                            <%-- 좋아요 버튼 --%>
                            <div class="cntItem">
                                <c:choose>
                                    <%-- 로그인되지 않은 경우 --%>
                                    <c:when test="${sessionScope.id == null}">
                                        <button class="likePostEmoticon" onclick="pleaseLogin()">
                                            <img src="<c:url value='/img/likeCommentNone.svg'/>" alt="like"/>
                                        </button>
                                    </c:when>
                                    <%-- 로그인된 경우 --%>
                                    <c:otherwise>
                                        <c:choose>
                                            <%-- 좋아요를 하지 않은 경우 --%>
                                            <c:when test="${c.isLiked == null}">
                                                <button class="likePostEmoticon likeButton"
                                                        data-comment-id="${c.commentId}">
                                                    <img src="<c:url value='/img/likeCommentNone.svg'/>" alt="like"/>
                                                </button>
                                            </c:when>
                                            <%-- 좋아요를 이미 한 경우 --%>
                                            <c:otherwise>
                                                <button class="likePostEmoticon likeButton liked"
                                                        data-comment-id="${c.commentId}">
                                                    <img src="<c:url value='/img/likeComment.svg'/>" alt="like"/>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                                <%-- 좋아요 수 --%>
                                <span class="cnt">${c.likes}</span>
                            </div>

                            <c:if test="${sessionScope.id != null}">
                                <c:choose>
                                    <c:when test="${id==c.userDto.userId}">
                                        <div class="dropdown">
                                            <img onclick="toggleDropdownMyComment(${c.commentId})"
                                                 class="menuBtn dropbtn"
                                                 src="<c:url value="/img/menu.svg"/>"/>
                                            <div id="myDropdownComment${c.commentId}" class="dropdown-content">
                                                <button onclick="onClickDeleteComment(${c.commentId})">삭제하기</button>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="dropdown">
                                            <img onclick="toggleDropdownOtherComment(${c.commentId})"
                                                 class="menuBtn dropbtn" src="<c:url value="/img/menu.svg"/>"/>
                                            <div id="otherDropdownComment${c.commentId}" class="dropdown-content">
                                                <a class="dropbtn"
                                                   onclick="toggleReportDropdownComment(${c.commentId})">신고하기⬇️</a>
                                                <div id="reportDropdownComment${c.commentId}" class="dropdown-content">
                                                    <a onclick="post.reportComment(${c.commentId}, 1)">게시판 및 성격 부적절함</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 2)">욕설/비하</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 3)">음란물/불건전 만남 및
                                                        대화</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 4)">상업적 광고 및 판매</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 5)">유출/사칭/사기</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 6)">낚시/놀람/도배</a>
                                                    <a onclick="post.reportComment(${c.commentId}, 7)">정당/정치인 비하 및
                                                        운동</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
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
                        <textarea type="text" name="content" id="writeTextArea" placeholder="로그인 먼저 해주세요!"
                                  disabled></textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea type="text" name="content" id="writeTextArea"></textarea>
                        <div class="regist">
                            <div class="anonymous">
                                <input type="checkbox"
                                       id="anonymousCheckBox"
                                       name="anonymous"/>
                                <label for="anonymousCheckBox">익명</label>
                            </div>
                            <button id="writeBtn" type="button">➤</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </form>
    </div>
</div>

