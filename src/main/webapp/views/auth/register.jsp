<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/30/24
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script>
    let resister = {
        init: function () {

        }
    };
    const onClickSubmit = () => {
        const gender = $('input[name="gender"]:checked').val();
        const nickname = $('#nickname').val();
        if (!isValidateNickname(nickname)){
            alert("닉네임 규칙에 맞게 입력해주세요");
            return;
        }
        const formData = {
            email: $('#registerEmail').val(),
            gender: gender,
            nickname: nickname
        };

        $.ajax({
            type: 'POST',
            url: "<c:url value="/auth/registerimpl"/>",
            data: formData,
            success: function(response) {
                if(response=="1"){
                    alert("로그인 되었습니다.");
                    location.href = "<c:url value="/"/>"
                }
                if(response=="3"){
                    alert("닉네임이 중복되었습니다.");
                }
            },
            error: function (_, _, error) {
                //TODO: 로그인 실패 로직
                <%--location.href = "<c:url value="/"/>"--%>
            }
        });
    };

    $(function () {
        resister.init();
    });

</script>

<div class="resisterPage">
    <h1>resister</h1>
<%--    TODO: 약관동의--%>
    <div>약관동의</div>
    <div>${email}</div>
    <input type="radio" id="male" name="gender" value="male">
    <label for="male">Male</label><br>
    <input type="radio" id="female" name="gender" value="female">
    <label for="female">Female</label><br>
    <%--    TODO: 닉네임 유효성--%>
    <button onClick="onClickCheckValidateNickname()">닉네임 검사</button>
    <label for="nickname">Nickname:</label><br>
    <input type="text" id="nickname" name="nickname"><br><br>

    <input type="hidden" id="registerEmail" value="${email}">
    <button onClick ="onClickSubmit()">회원가입</button>

</div>

