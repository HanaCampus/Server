<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 5/2/24
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .mypage{
        .nicknameContainer{
            display: flex;
            align-items: center;
            margin-bottom: 44px;
        }
        .userNicknameChar{
            border-radius: 100px;
            color: rgb(0, 0, 0);
            border: 0.6px solid rgb(255, 255, 255);
            background-color:#d0fefb;
            font-weight: 700;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            flex-direction: row;
            display: flex;
            font-family: Manrope, Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Noto Sans KR", sans-serif;
            width: 36px;
            height: 36px;
            flex-shrink: 0;
        }
        .userNickname{
            margin-left:10px;
            max-width: 260px;
            word-break: break-all;
            font-size: 28px;
            line-height: 44px;
            letter-spacing: -0.04em;
            font-weight: 700;
            font-family: Manrope, Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Noto Sans KR", sans-serif;
        }
        .containerTitle{
            margin-bottom: 10px;
            color: #A6D9B3;
            font-size: 14px;
            line-height: 24px;
            letter-spacing: -0.03em;
            font-weight: 700;
            /*padding: 0 25px;*/
        }
        .menuContainer{
            -webkit-box-pack: center;
            justify-content: center;
            flex-direction: column;
            gap: 8px;
            display: flex;
            width: auto;
            margin-left: -25px;
            margin-right: -25px;
            margin-bottom: 40px;
            button{
                color:#ffffff;
                font-size: 18px;
                width: inherit;
                height: 44px;
                background-color:transparent;
                /*background-color:#0B610B; */
                padding: 0px 20px;
                transition: background-color 200ms ease 0s;
                outline: 0px;
                line-height: 26px;
                letter-spacing: -0.03em;
                font-weight: 700;
                -webkit-box-align: center;
                align-items: center;
                flex-direction: row;
                gap: 10px;
                display: flex;
                &:hover{
                 background-color: #04B404;
                }
            }
            button:hover {
                cursor: pointer;
            }
        }
    }
</style>
<script>
    let mypage = {
        init: function () {
        }
    };
    const onClickMyScrap = ()=>{
        location.href = "<c:url value="/users/myscraps"/>";
    }
    const onClickMyPosts = ()=>{
        location.href = "<c:url value="/users/myposts"/>";
    }

    const onClickChangeNicknamePage = ()=>{
        location.href = "<c:url value="/users/info"/>";
    }

    const onClickLogout = ()=>{
        alert("로그아웃되었습니다.")
        location.href = "<c:url value="/logout"/>";
    }
    const onClickSignout = () => {
        if (confirm("탈퇴하겠습니까?")) {
            $.ajax({
                type:'POST',
                url:"<c:url value="/users/sign-out"/>",
                success: function(response){
                    if(response=="1"){
                        alert("탈퇴되었습니다.");
                        location.href = "<c:url value="/"/>";
                        return;
                    }
                }
            })
        } else {
        }
    }

    $(function () {
        mypage.init();
    });

</script>
<div class="mypage">
    <div class="nicknameContainer">
        <div class="userNicknameChar">${user.nickname.charAt(0)}</div>
        <div class="userNickname">${user.nickname}</div>
    </div>
    <h3 class="containerTitle">정보</h3>
    <div class="menuContainer">
        <button onclick="onClickMyScrap()">
            <div>🏷️</div>
            <span>나의 스크랩</span>
        </button>
        <button onclick="onClickMyPosts()">
            <div>📃</div>
            <span>내가 작성한 글</span>
        </button>
    </div>

    <h3 class="containerTitle">내 정보</h3>
    <div class="menuContainer">
        <button onclick="onClickChangeNicknamePage()">
            <div>🧸</div>
            <span>닉네임 변경페이지</span>
        </button>
    </div>

    <h3 class="containerTitle">정보</h3>
    <div class="menuContainer">
        <button onclick="onClickLogout()">
            <div>🎈</div>
            <span>로그아웃</span>
        </button>
        <button onclick="onClickSignout()">
            <div>🧹</div>
            <span>탈퇴하기</span>
        </button>
    </div>



</div>
