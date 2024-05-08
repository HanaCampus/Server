<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/css/pagination.css" />" />

<!-- pagination start -->
<div class="paginationContainer">
    <ul class="pagination">
        <c:choose>
            <c:when test="${cpage.getPrePage() != 0}">
                <li class="pageItem">
                    <a href="<c:url value="${target}/${paginationPath}?id=${boardId}&pageNo=${cpage.getPrePage()}" />" class="pageLink"><</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled pageItem">
                    <a href="#" class="pageLink"><</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage()}" var="page">
            <c:choose>
                <c:when test="${cpage.getPageNum() == page}">
                    <li class="active pageItem">
                        <a href="<c:url value="${target}/${paginationPath}?id=${boardId}&pageNo=${page}" />" class="pageLink">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="pageItem">
                        <a href="<c:url value="${target}/${paginationPath}?id=${boardId}&pageNo=${page}" />" class="pageLink">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${cpage.getNextPage() != 0}">
                <li class="pageItem">
                    <a href="<c:url value="${target}/${paginationPath}?id=${boardId}&pageNo=${cpage.getNextPage()}" />" class="pageLink">></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled pageItem">
                    <a href="#" class="pageLink">></a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->