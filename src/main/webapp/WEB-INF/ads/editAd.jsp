<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Ad" />
    </jsp:include>
    <title></title></head>
<body>
<div class="container">
    <div class="card-body">
        <h5 class="card-title text-center">Title: ${ad.title }</h5>
        <form class="form-signin" action="/ads/updateAd" method="post">
            <div class="form-label-group">
                <input id="title" name="editedTitle" class="form-control" type="text" value="${ad.title}">
            </div>
            <div class="form-label-group">
                <textarea rows="8" id="description" name="editedDescription" class="form-control" type="text">${ad.description}</textarea>
            </div>
            <%--        <input value="${ad.id}" name="editId" type="hidden">--%>
            <input type="hidden" name="adId" value="${ad.id}">
            <button value="${ad.id}" name="button" type="submit">Edit</button>
        </form>
    </div>

</div>


</body>
</html>