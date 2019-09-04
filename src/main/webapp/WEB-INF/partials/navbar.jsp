<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
    <div class="#29b6f6 light-blue lighten-1 nav-wrapper">
        <a class="navbar-brand" href="/">BlacList</a>
        <ul class="right hide-on-med-and-down">
            <li><a href="/ads">View Ads</a></li>
            <c:if test ="${sessionScope.user == null}">
                <li><a href="/login">Login</a></li>
                <li><a href="/register">Register</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <li><a href="/ads/create">Post Ad</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/logout">Logout</a></li>
                </c:if>
        </ul>
    </div>
</nav>