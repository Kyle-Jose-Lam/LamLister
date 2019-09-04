<jsp:useBean id="user" scope="request" type="com.codeup.adlister.models.User"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile" />
    </jsp:include>
    <title></title></head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container form">
    <h1>Update Profile Information</h1>
    <hr>
    <form action="/updateProfile" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control use" type="text" value="${user.username}">
        </div>
        <div class="form-group">
            <label for="email">email</label>
            <input id="email" name="email" class="form-control use" type="text" value="${user.email}">
        </div>
<%--        <input type="submit" class="btn extra btn-block" value="update">--%>
        <button class="btn waves-effect waves-light" type="submit" name="action" value="update">
            <i class="material-icons right">send</i>
        </button>
    </form>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>