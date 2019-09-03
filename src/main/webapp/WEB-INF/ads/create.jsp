<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <c:if test="${sessionScope.error != null}">
                <p style="color:red;font-weight:bold">${sessionScope.error}</p>
            </c:if>
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${sessionScope.failed.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${sessionScope.failed.description}</textarea>
            </div>
            <div class="form-group">
                <label for="cat"></label>
                <select class="dropdown-content" name="category" id="cat">
                    <option onclick="" name="">Appliances</option>
                    <option onclick="" name="">Automotive</option>
                    <option onclick="" name="">Clothes</option>
                    <option onclick="" name="">Electronics</option>
                    <option onclick="" name="">Furniture</option>
                    <option onclick="" name="">General</option>
                    <option onclick="" name="">Jewelry</option>
                    <option onclick="" name="">Tools</option>
                    <option onclick="" name="">Toys</option>
                </select>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
