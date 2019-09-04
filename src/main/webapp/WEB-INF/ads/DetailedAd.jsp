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

        <jsp:param name="title" value="Detailed Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="col l12">
<div class="card horizontal">
<%--    <div class="card-image">--%>
<%--        <img src="${ads.photo}" alt="profile photo" style="width:300px;height:300px;border-radius: 50%">--%>
<%--    </div>--%>
    <div class="card blue-grey darken-1">
        <div class="card-content white-text">
            <span class="card-title"><h4>${ads.title}</h4></span>
            <p>${ads.description}</p>
        </div>
    </div>
    <div>
        <img src="${ads.photo}" alt="" style="height:550px;width:1000px;">
    </div>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
