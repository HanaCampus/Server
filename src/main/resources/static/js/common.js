function isValidateNickname(nickname) {
    const nicknamePattern = /^[a-zA-Z가-힣0-9]+$/;

    if (nickname.length >= 20 || !nicknamePattern.test(nickname)) {
        return false;
    } else {
        // 유효성 통과
        return true;
    }
}


// 뒤로가기
function goBack() {
    window.history.back();
}