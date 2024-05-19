<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/28/24
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script>
    $(function () {
        $.ajax({
            type: 'GET',
            url: '<c:url value="/boards/list"/>',
            success: function (response) {
                response.forEach(function (board) {
                    let imgSrc = '<c:url value="/img/' + board.img + '"/>';
                    let boardHtml = '<div class="css-65egb5">' +
                        '<a class="css-hthzsn" href="/boards?id=' + board.boardId + '&pageNo=1">' +
                        // '<div class="boardContainer">'+
                            '<div>' +
                                '<h2 class="css-kdssxn">' + board.name + '</h2>' +
                                '<p class="css-ftwqip">' + board.content+ '</p>' +
                            '</div>' +
                            '<img src="' + imgSrc + '" alt="게시판 이미지" loading="lazy" height="100px" decoding="async" data-nimg="1" class="css-1grjlwr" />' +
                        // '</div>'+
                        '</a>' +
                        '</div>';

                    // 생성된 HTML을 center 아래에 추가
                    $('.center').append(boardHtml);
                });
            }
        });
    });
</script>

<div class="center">
</div>