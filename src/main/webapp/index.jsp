<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div id="top">

<%--        <div id="midtop"></div>--%>
<%--        <div>--%>
<%--            <div class="col l8"></div>--%>
<%--        <div id="searchdiv" class="col l4">--%>
<%--        <form action="/" method="post">--%>
<%--            <input type="text" class="form-control" id="search" name="adsSearch" onkeyup="myFunction()" aria-label="Text input with dropdown button" placeholder="Search your Ad..">--%>
<%--        </form>--%>
<%--        </div>--%>
<%--    </div>--%>
    </div>

    <footer class="page-footer">
        <div class="container">
            <div class="row">
                <div class="grey-text text-lighten-4 col l3">
                    <p>Appliances</p>
                    <p>Automotive</p>
                    <p>Clothes</p>
                </div>
                <div class="grey-text text-lighten-4 col l3">
                    <p>Electronics</p>
                    <p>Furniture</p>
                    <p>General</p>
                </div>
                <div class="grey-text text-lighten-4 col l3">
                    <p>Jewelry</p>
                    <p>Tools</p>
                    <p>Toys</p>
                </div>
                <div class="col l3">
                    <h5 class="white-text"></h5>
                    <ul>
                        <a href="http://www.twitter.com"><img class="logo" src="img/instagram2.png"></a>
                        <a href="http://www.twitter.com"><img class="logo" src="img/twitter2.png"></a>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                © 2019 Copyright
                <a class="grey-text text-lighten-4 right" href="#!">Contact Us</a>
            </div>
        </div>
    </footer>
</body>
</html>
