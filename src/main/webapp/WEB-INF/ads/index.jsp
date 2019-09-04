<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>

    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1 id="blue-text">Here Are all the ads!</h1>
    <div>
        <form action="/" method="post">
            <input type="text" class="form-control" id="search" name="adsSearch" onkeyup="myFunction()"
                   aria-label="Text input with dropdown button" placeholder="Search your Ad..">
        </form>
    </div>

        <div class="container">
            <c:forEach var="ad" items="${ads}">
            <div class="row">
                <div class="col l6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title"><h4>${ad.title}</h4></span>
                            <h6>${ad.description}</h6>
                          <c:forEach var="cat" items="${cats}">
                              <c:if test="${ad.id==cat.id}">
                                  <p>${cat.title}</p>
                              </c:if>
                          </c:forEach>
                            <div class="card-action">
                                <form method="post" action="/da">
                                    <button class="btn #29b6f6 light-blue lighten-1" type="submit" name="button" value="${ad.id}">
                                        <i class="material-icons right">View Ad</i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
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
