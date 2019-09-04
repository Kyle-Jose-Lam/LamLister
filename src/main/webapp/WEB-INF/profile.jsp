<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" href="css/profile.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
        <div class="col l6 s12 m7">
            <h1>Welcome, ${sessionScope.user.username}!</h1>
            <div class="card horizontal">
                <div class="card-image">
                    <img src="${user.photo}" alt="profile photo" style="width:300px;height:300px;border-radius: 50%">
                </div>
                <div class="card-stacked">
                    <div class="#0277bd light-blue darken-3 card-content">
                        <p>Name: ${user.full_name}</p>
                        <p>Email: ${user.email}</p>
                        <p>Address: ${user.address}</p>
                    </div>
                    <div class="card-action #01579b light-blue darken-4">
                        <p class="updateBtn"><a href="/updateProfile">Update Information</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div class="container">
    <c:forEach var="ad" items="${myads}">
        <div class="row">
            <div class="col l6">
                <div class="card blue-grey darken-1">
                    <div class="card-content white-text">
                        <span class="card-title"><h4>${ad.title}</h4></span>
                        <h6>${ad.description}</h6>
                        <div class="card-action">
            <form method="get" action="/ads/updateAd">
                <button class="btn #29b6f6 light-blue lighten-1" type="submit" name="adId" value="${ad.id}">Edit</button>
            </form>
            <form method="post" action="/ads/delete">
                <button class="btn #29b6f6 light-blue lighten-1" type="submit" name="button2" value="${ad.id}">Delete</button>
            </form>
                        </div>
                    </div>
                    </div>
        </div>
    </c:forEach>
</div>
        <jsp:include page="/WEB-INF/partials/footer.jsp" />
</body>
</html>
