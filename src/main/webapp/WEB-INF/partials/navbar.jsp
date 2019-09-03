<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="" rel="stylesheet" type="text/css">
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
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
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
