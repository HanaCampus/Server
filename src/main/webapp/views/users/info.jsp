<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 5/2/24
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<style>
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
    .nicknameContainer{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        min-height: calc(100vh - 90px - (14px + 52px)) ;
    }
</style>

<script>
    let initialNickname;
    let info = {
        init: function () {
            initialNickname= $('#newNickname').val();
        }
    };

    const onChangeNickname=()=>{
        var nickname = $('#newNickname').val();
        $('.nextButton').prop('disabled', initialNickname==nickname);
    }

    const onClickChangeNickname = ()=>{
        const newNickname = $("#newNickname").val();
        const userId = $("#usersInfoUserId").val();
        if (!isValidateNickname(newNickname)){
            alert("닉네임 규칙에 맞게 입력해주세요");
            return;
        }
        const formData = {
            nickname: newNickname,
            userId: userId,
        }

        $.ajax({
            type:'POST',
            url:"<c:url value='/users/edit-info'/>",
            data:formData,
            success: function(response){
                if(response=="1"){
                    alert("변경되었습니다.");
                    initialNickname= $('#newNickname').val();
                    $('.nextButton').prop('disabled',true);
                    return;
                }
                if(response=="0"){
                    alert("오류가 발생했습니다. 나중에 다시 시도해주세요");
                    return;
                }
            }
        })
    }

    $(function () {
        info.init();
    });

</script>
<div class="usersInfo">
    <div class="breadcrumbs">
        <a href="<c:url value="/users/mypage"/>">프로필</a>
        <span class="dot">></span>
        <a href="<c:url value="/users/info"/>">닉네임 수정</a>
    </div>
    <div class="nicknameContainer">
        <input type="text" id="newNickname" onkeyup="onChangeNickname()" required value="${user.nickname}"/>
        <input type="hidden" id="usersInfoUserId" value="${sessionScope.id}" >
        <button class="nextButton" disabled onclick="onClickChangeNickname()">닉네임 변경</button>
    </div>
</div>

