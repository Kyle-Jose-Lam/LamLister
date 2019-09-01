<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Your Ad" />
    </jsp:include>
    <title></title></head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<h1>Update Your Ad</h1>
<div class="container">

    <c:forEach var="ad" items="${myads}">
        <c:choose>
            <c:when test="${ad.name == sessionScope.username}">
                <div class="col-md-6">
                    <form action="/ads/update" method="post">
                            <div class="card-body" style="padding-left: 5px">
                                <h5 class="card-title" style="font-weight: bold; text-align: center; font-size: 1.5em;">${ad.title}</h5>
                                <span style="font-weight: bold">Description: </span><span style="font-style: italic">${ad.description}<br></span>
                            </div>

                        <input type="hidden" name="id" value="${ad.id}">
                        <input type="hidden" name="user_id" value="${ad.user_id}">

                        <div>
                            <label for="title">Title</label>
                            <input id="title" name="title" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea id="description" name="description" class="form-control" type="text"></textarea>
                        </div>

                        <input type="hidden" name="ad_id" value="${ad.id}">
                        <button id="update" type="submit" class="btn btn-block btn-primary">Edit</button>
                </form>
            </c:when>
        </c:choose>
    </c:forEach>
</div>
</body>
</html>
