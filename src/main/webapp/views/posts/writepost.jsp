<%--
  Created by IntelliJ IDEA.
  User: goeun
  Date: 2024-05-06
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/posts/write.css" />" />
<link rel="stylesheet" href="<c:url value="/css/posts/post.css" />" />
<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>


<script>
    let writepost = {
        init: function () {
        }
    };
    $(function () {
        writepost.init();
    });
</script>

<div class="formContainer">
    <input type="text" name="writeTitle" id="writeTitle" placeholder="제목" />
    <div class="write">
        <textarea type="text" name="writeTextArea" id="writeTextArea" placeholder="내용을 입력하세요"></textarea>
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
