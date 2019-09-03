<jsp:useBean id="user" scope="request" type="com.codeup.adlister.models.User"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
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
        <input type="submit" class="btn extra btn-block" value="update">
    </form>
</div>
</body>
</html>