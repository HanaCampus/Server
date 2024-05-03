<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 5/2/24
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script>
    let info = {
        init: function () {
        }
    };

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
    <label for="newNickname">새로운 닉네임:</label>
    <input type="text" id="newNickname" required value="${user.nickname}"/>
    <input type="hidden" id="usersInfoUserId" value="${sessionScope.id}" >
    <button onclick="onClickChangeNickname()">닉네임 변경</button>
</div>

