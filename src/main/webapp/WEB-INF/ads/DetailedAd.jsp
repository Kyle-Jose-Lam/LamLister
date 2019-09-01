<%--
  Created by IntelliJ IDEA.
  User: lam
  Date: 8/30/19
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-md-6">
    <h2>${ads.title}</h2>
    <p>${ads.description}</p>
    <form method="post" action="/ads/delete">
        <button type="submit" name="button" value="${ads.id}">Delete Ad</button>
    </form>
</div>
</body>
</html>
