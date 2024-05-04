<%--
  Created by IntelliJ IDEA.
  User: yun
  Date: 4/28/24
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<div>
<%--    <div class="css-1hgree4">--%>
<%--        <a data-theme="primary" class="css-3hax7m" href="/all-articles">게시판</a>--%>
<%--        <a data-theme="secondary" class="css-1rdqar8" href="/hot-articles">게시판</a>--%>
<%--    </div>--%>
    <div class="css-65egb5">
        <a class="css-hthzsn" href="<c:url value="/boards"/>?id=1">
            <div>
                <h2 class="css-kdssxn">자유 게시판</h2>
                <p class="css-ftwqip">자유롭게 글을 작성</p>
            </div>
            <img
                    alt="게시판 이미지"
                    loading="lazy"
                    width="100"
                    height="100"
                    decoding="async"
                    data-nimg="1"
                    class="css-1grjlwr"/>
        </a>
    </div>
</div>