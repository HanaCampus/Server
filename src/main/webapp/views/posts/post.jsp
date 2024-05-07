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


</style>

<script>
    let post = {
        init: function () {

        }
    };

    $(function () {
        post.init();
    });


    // 수정하기 버튼을 클릭하면 해당 내용을 textarea에 출력
    function editComment() {
        let originalContent = document.getElementById("contentText").innerHTML; // 초기 내용 변수
        document.getElementById("writeTextArea").value = originalContent;
    }

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
            <div class="comment">
                <div class="innerBox">
                    <div class="user"><img src="#"/>익명1</div>
                    <div class="rightBox">
                        <div class="cntItem"><span class="imoticon">❤️</span><span class="cnt">8</span></div>
                        <div class="dropdown">
                            <button onclick="toggleDropdown()" class="menuBtn dropbtn">¦</button>
                            <div id="myDropdown" class="dropdown-content">
                                <a href="#" onclick="editComment()">수정하기</a>
                                <a href="#">삭제하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content" id="contentText" >내용1</div>
                <div class="time">날짜 | 시간</div>
            </div>
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
                            name="anonymous"/>
                    <label for="anonymousCheckBox">익명</label>
                </div>
                <button id="writeBtn">➤</button>
            </div>
        </div>
    </div>
</div>

