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
        }
    };
    $(function () {
        writepost.init();
    });
</script>

<div class="header">
    <div class="back"><a class="backBtn" href="<c:url value="/boards"/>?id=1">⇦</a></div>
    <h3 class="title">글쓰기</h3>
    <div class="back"></div>
</div>

<div class="formContainer">
    <input type="text" name="writeTitle" id="writeTitle" placeholder="제목" />
    <div class="write">
        <textarea name="writeTextArea" id="writeTextArea" placeholder="내용을 입력하세요"></textarea>
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


<script type="text/javascript">
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
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']

    });
    //이미지 파일 전송
    function sendFile(file, editor){
        var data = new FormData();
        data.append("file", file);
        console.log(file);
        $.ajax({
            data : data,
            type : "POST",
            url : "uploadImage",
            contentType : false,
            processData : false,
            success : function(data){
                console.log(data);
                console.log(editor);
                $(editor).summernote("insertImage",data.url);
            }
        });
    }



</script>