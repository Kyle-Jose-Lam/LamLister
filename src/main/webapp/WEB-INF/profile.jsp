<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<%--<c:url var="deleteLink" value="">--%>
<%--    <c:param name="command" value="DELETE"/>--%>
<%--    <c:param name="adId" value="${ad.id}"/>--%>
<%--</c:url>--%>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <c:forEach var="ad" items="${myads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form method="post" action="/profile">
                <button type="submit" name="button" value="${ad.id}">Edit</button>
            </form>
            <form method="post" action="">
                <button type="submit" name="button2" value="${ad.id}">Delete</button>
            </form>
        </div>
    </c:forEach>
</body>
</html>
