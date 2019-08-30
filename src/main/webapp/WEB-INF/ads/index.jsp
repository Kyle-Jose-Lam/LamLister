<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Here Are all the ads!</h1>
    <form action="/" method="post">
        <input type="text" class="form-control" id="search" name="adsSearch" onkeyup="myFunction()" aria-label="Text input with dropdown button" placeholder="Search your Ad..">
    </form>

<div id="ads">
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form method="post" action="/da">
                <button type="submit" name="button" value="${ad.id}">View Ad</button>
            </form>
        </div>
    </c:forEach>
</div>
</div>
<script>
    function myFunction() {
        var input, filter, name, i;
        input = document.getElementById("search");
        filter = input.value.toUpperCase();
        var filteredSearch = [];
        <c:forEach var="ad" items="${ads}">
        name = '${ad.title}';

        if (name.toUpperCase().indexOf(filter) > -1) {
            filteredSearch.push(${ad.id});
        }
            console.log(filteredSearch);
        </c:forEach>
        var html = ";"
        filteredSearch.forEach(function(ad){

            html += "<div class=\"col-md-6\">\n" +
                "            <h2>${ad.title}</h2>\n" +
                "            <p>${ad.description}</p>\n" +
                "            <form method=\"post\" action=\"/da\">\n" +
                "                <button type=\"submit\" name=\"button\" value=\"${ad.id}\">View Ad</button>\n" +
                "            </form>\n" +
                "        </div>\n"
        });
            document.getElementById("ads").innerHTML = (html)
    }
</script>


</body>
</html>
