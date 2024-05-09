<%--
  Created by IntelliJ IDEA.
  User: goeun
  Date: 2024-05-06
  Time: 오후 6:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="<c:url value="/css/posts/write.css" />" />
<link rel="stylesheet" href="<c:url value="/css/posts/post.css" />" />
<link rel="stylesheet" href="<c:url value="/css/boards/board.css" />"/>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/css/summernote/summernote-lite.js"></script>
<script src="/css/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<script>
    let writepost = {
        init: function () {
            // summernote
            $('#summernote').summernote({
                height: 300,
                minHeight: null,
                maxHeight: null,
                focus: true,
                lang: "ko-KR",
                callbacks: {
                    onImageUpload : function(files){
                        for (var i = files.length - 1; i >= 0; i--) {
                            sendFile(files[i],this);
                        }
                    }
                },
                toolbar: [
                    // [groupName, [list of button]]

                    ['insert',['picture','link']]
                ],
                fontNames: ['Arial'],
                fontSizes: ['16']

            });
            $('#summernote').css('width', '600px');

            // 이미지 파일 전송
            function sendFile(file, editor){
                var data = new FormData();
                data.append("file", file);
                console.log(file);
                $.ajax({
                    data : data,
                    type : "POST",
                    url : "<c:url value="/post/uploadImage"/>",
                    contentType : false,
                    processData : false,
                    success : function(data){
                        console.log(data);
                        console.log(editor);
                        $(editor).summernote("insertImage",data.url);
                    }
                });
            }

            // 전송 버튼 event handler
            $('#writeBtn').click(() => {
                // 제목이나 내용 안 쓰면 쓰라고 alert문 띄워주는 유효성 체크하기
                let title = document.getElementById('writeTitle').value;
                let content = document.getElementById('summernote').value;

                if (title.trim() === '' || content.trim() === '') {
                    alert('제목과 내용을 모두 입력해주세요.');
                }
                else{
                    if(window.confirm('게시물 등록하시겠습니까?')) {
                        onClickWritePost();
                    }
                }
            });
        },
    };
    $(function () {
        writepost.init();
    });

    function onClickWritePost(){
        var formData = $('#writePostForm').serialize();
        $.ajax({
            type: 'POST',
            url: '<c:url value="/posts/writepost"/>',
            data: formData,
            success: function(response) {
                window.location.replace('/boards?id=${boardId}&pageNo=1');
            },
            error: function(xhr, status, error) {
                alert('게시글 추가에 실패했습니다.');
            }
        });
    }
</script>

<form id="writePostForm">
    <div class="header writeHeader">
        <div class="back"><a class="backBtn" href="#" onclick="goBack()"><img src="/img/back.svg" alt="back"></a></div>
        <h3 class="title">글쓰기</h3>
        <div class="back">
            <div class="regist">
                <%-- 익명 --%>
                <div class="anonymous">
                    <input
                            type="checkbox"
                            id="anonymousCheckBox"
                            name="anonymous"/>
                    <label for="anonymousCheckBox" style="color: white">익명</label>
                </div>
                <button id="writeBtn" type="button" style="color: white">➤</button>
            </div>
        </div>

    </div>

    <div class="formContainer">
        <%-- 제목 --%>
        <input type="text" name="title" id="writeTitle" placeholder="제목" />
        <%-- 내용 --%>
        <div class="write">
            <textarea name="content" id="summernote" placeholder="내용을 입력하세요"></textarea>
        </div>
    </div>

    <%--  board 정보  --%>
    <input type="hidden" name="boardId" id="boardId" value="${boardId}"/>
</form>
