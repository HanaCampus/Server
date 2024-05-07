<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- pagination start -->
<div class="col text-center">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${cpage.getPrePage() != 0}">
                <li class="page-item">
                    <a href="<c:url value="${target}/boards?id=${boardId}&pageNo=${cpage.getPrePage()}" />" class="page-link">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled page-item">
                    <a href="#" class="page-link">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage()}" var="page">
            <c:choose>
                <c:when test="${cpage.getPageNum() == page}">
                    <li class="active page-item">
                        <a href="<c:url value="${target}/boards?id=${boardId}&pageNo=${page}" />" class="page-link">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a href="<c:url value="${target}/boards?id=${boardId}&pageNo=${page}" />" class="page-link">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${cpage.getNextPage() != 0}">
                <li class="page-item">
                    <a href="<c:url value="${target}/boards?id=${boardId}&pageNo=${cpage.getNextPage()}" />" class="page-link">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled page-item">
                    <a href="#" class="page-link">Next</a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->