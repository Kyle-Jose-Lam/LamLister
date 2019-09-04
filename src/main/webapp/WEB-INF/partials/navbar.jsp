<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<nav class="navbar navbar-default">--%>
<%--    <div class="container-fluid">--%>
<%--        <!-- Brand and toggle get grouped for better mobile display -->--%>
<%--        <div class="navbar-header">--%>
<%--            <a class="navbar-brand" href="/">Adlister</a>--%>
<%--        </div>--%>
<%--        <ul class="nav navbar-nav navbar-right">--%>
<%--            <li><a href="/ads">View Ads</a></li>--%>

<%--            <c:if test ="${sessionScope.user == null}">--%>
<%--                <li><a href="/login">Login</a></li>--%>
<%--                <li><a href="/register">Register</a></li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${sessionScope.user != null}">--%>
<%--                <li><a href="/ads/create">Post Ad</a></li>--%>
<%--                <li><a href="/profile">Profile</a></li>--%>
<%--                <li><a href="/logout">Logout</a></li>--%>
<%--            </c:if>--%>
<%--        </ul>--%>
<%--    </div><!-- /.navbar-collapse -->--%>
<%--    </div><!-- /.container-fluid -->--%>
<%--</nav>--%>
<%--<!-- Dropdown Structure -->--%>
<%--<ul id="dropdown1" class="dropdown-content">--%>
<%--    <li><a href="#!">one</a></li>--%>
<%--    <li><a href="#!">two</a></li>--%>
<%--    <li class="divider"></li>--%>
<%--    <li><a href="#!">three</a></li>--%>
<%--</ul>--%>
<nav>
    <div class="#29b6f6 light-blue lighten-1 nav-wrapper">
        <a class="navbar-brand" href="/"><span style="padding-left:15px">BlacList</span></a>
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