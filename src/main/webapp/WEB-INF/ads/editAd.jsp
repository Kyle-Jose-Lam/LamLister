<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Your Ad" />
    </jsp:include>
    <title></title></head>
<body>
<div class="container form">
    <h1>Update Profile Information</h1>
    <hr>
    <form action="/ads/update" method="POST">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control use" type="text" value="${ad.title}">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="password" class="form-control use" type="text" placeholder="New Description" value="${ad.description}">
        </div>
    </form>
</div>
</body>
</html>