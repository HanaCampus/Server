<%--
  Created by IntelliJ IDEA.
  User: es
  Date: 5/3/24
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/boards/free.css" />" />

<script>
    let center = {
        init: function () {

        }
    };

    $(function () {
        center.init();
    });
</script>

<div class="free-board">
    <div class="header">
        <button class="back">⇦</button>
        <h3 class="title">자유게시판</h3>
        <button class="back hidden"></button>
    </div>
</div>

