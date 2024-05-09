<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/30/24
  Time: 11:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<style>
    .resisterPage{
        min-height: calc(100vh - 90px);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        .section{
            margin-bottom: 40px;
        }
        h1{
            font-size: 28px;
            line-height: 44px;
            letter-spacing: -0.04em;
            font-weight: 700;
            white-space: pre-wrap;
            margin-bottom: 10px;
        }
        label {
            font-size: 18px;
            line-height: 2rem;
            padding: 0.2em 0.4em;
        }

        [type="radio"], span {
            vertical-align: middle;
        }

        [type="radio"] {
            appearance: none;
            background: #ffffff;
            border: max(2px, 0.1em) solid gray;
            border-radius: 50%;
            width: 1.25em;
            height: 1.25em;
            transition: border 0.5s ease-in-out;
        }

        [type="radio"]:checked {
            border: 0.4em solid tomato;
        }

        [type="radio"]:focus-visible {
            outline-offset: max(2px, 0.1em);
            outline: max(2px, 0.1em) dotted tomato;
        }

        [type="radio"]:hover {
            box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
            cursor: pointer;
        }

        [type="radio"]:hover + span {
            cursor: pointer;
        }

        [type="text"]{
            width: 100%;
            padding: 0px 16px;
            border-radius: 8px;
            border: 1px solid rgb(46, 50, 59);
            font-family: Manrope, Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Noto Sans KR", sans-serif;
            height: 52px;
            font-size: 18px;
            line-height: 26px;
            letter-spacing: -0.03em;
            font-weight: 400;
        }
        .nextButton {
            height: 56px;
            border-radius: 12px;
            width: 100%;
            background: #d2ffdd;
            margin-bottom: 20px;
            &:disabled{
                background: #5b647c;
            }
            &:focus{
                cursor: pointer;
            }
        }
    }

</style>

<script>
    let resister = {
        init: function () {
        }
    };
    const onChangeNickname=()=>{
        var nickname = $('#nickname').val()
        $('.nextButton').prop('disabled', !!!nickname);
    }
    const onClickSubmit = () => {
        const gender = $('input[name="gender"]:checked').val();
        const nickname = $('#nickname').val();
        if (!isValidateNickname(nickname)) {
            alert("닉네임은 1~20자 사이로 입력해주세요. 특수 기호는 사용할 수 없습니다.");
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
            success: function (response) {
                if (response == "1") {
                    alert("가입되었습니다.");
                    location.href = "<c:url value="/"/>"
                }
                if (response == "3") {
                    alert("닉네임이 중복되었습니다.");
                }
            },
            error: function (_, _, error) {
            }
        });

    };


    $(function () {
        resister.init();
    });

</script>


<div class="resisterPage">
    <div>
        <div class="section">
            <h1>성별을 입력해주세요</h1>
            <input type="radio" id="male" name="gender" value="male" checked>
            <label for="male">Male</label><br>
            <input type="radio" id="female" name="gender" value="female">
            <label for="female">Female</label><br>
        </div>
        <div class="section">
            <h1>닉네임을 입력해주세요</h1>
            <input type="text" id="nickname" name="nickname" onkeyup="onChangeNickname()"  ><br><br>
            <input type="hidden" id="registerEmail" value="${email}">
        </div>
    </div>
    <div>
        <button class="nextButton" disabled onClick="onClickSubmit()">확인</button>
    </div>

</div>

