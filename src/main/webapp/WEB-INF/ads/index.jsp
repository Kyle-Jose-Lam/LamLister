<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>


</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Here Are all the ads!</h1>
    <div>
        <form action="/" method="post">
            <input type="text" class="form-control" id="search" name="adsSearch" onkeyup="myFunction()"
                   aria-label="Text input with dropdown button" placeholder="Search your Ad..">
        </form>
    </div>

    <div id="ads">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <c:forEach var="cat" items="${cats}">
                    <c:if test="${ad.id==cat.id}">
                        <p>${cat.title}</p>
                    </c:if>
                </c:forEach>
                <form method="post" action="ads">
                    <button type="submit" name="button" value="${ad.id}">View Ad</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    function myFunction() {
        var input, filter, name;
        var filteredSearch = [];
        var html = "";
        input = document.getElementById("search");
        filter = input.value.toUpperCase();
        <c:forEach var="ad" items="${ads}">
        name = '${ad.title}';
        if (name.toUpperCase().indexOf(filter) > -1) {
            filteredSearch.push(["${ad.title}", "${ad.description}"]);

            html += "<div id=\"ads\">\n"+
                "<div class=\"col-md-6\">\n" +
                "            <h2>${ad.title}</h2>\n" +
                "            <p>${ad.description}</p>\n" +
                "     <form method=\"post\" action=\"ads\">\n" +
                "                <button type=\"submit\" name=\"button\" value=\"${ad.id}\">View Ad</button>\n" +
                "            </form>\n" +
                "        </div>\n"+
                "   </div>\n"
        }
        console.log(filteredSearch);
        </c:forEach>

        document.getElementById("ads").innerHTML = (html);
    }
</script>


</body>
</html>
