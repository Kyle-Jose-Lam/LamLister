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
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="View Ad" />
    </jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <div class="col-md-6">
        <h2>${ads.title}</h2>
        <p>${ads.description}</p>
    </div>
</div>
</body>
</html>
