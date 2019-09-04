<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div>
<div class="container">
    <h1 id="blue-text">Local Ads</h1>
    <div>
    <form class="searchbar" action="/" method="post">
        <input type="text" class="form-control" id="search" name="adsSearch" onkeyup="myFunction()" aria-label="Text input with dropdown button" placeholder="Search your Ad..">
    </form>
    </div>
        <div class="container">
            <div class="row">
            <c:forEach var="ad" items="${ads}">
                <div class="col l6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title"><h4>${ad.title}</h4></span>
                            <h6>${ad.description}</h6>
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
        </div>
</div>
</div>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

<script>
    //category script
    function category(ad) {
        var selectCat = document.getElementById('catads').valueOf();
        <c:forEach var="cat" items="${cats}">
            if(selectCat === ${cat.title} && ad.id === ${cat.id}){
                return ad
            }
        </c:forEach>
    }

    //Original Script
    function myFunction() {
        var input, filter, name;
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
        var html = "";
        filteredSearch.forEach(function(){

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



    //Kyles Script
    <%--function myFunction() {--%>
    <%--    var listOfAds = [];--%>
    <%--    <c:forEach var="ad" items="${ads}">--%>
    <%--        listOfAds.push(category(${ad}));--%>
    <%--    </c:forEach>--%>

    <%--    var input, filter, name, i;--%>
    <%--    input = document.getElementById("search");--%>
    <%--    filter = input.value.toUpperCase();--%>
    <%--    // var filteredSearch = [];--%>
    <%--    var html = "";--%>
    <%--    listOfAds.forEach(function(){--%>
    <%--        name = '${ad.title}';--%>
    <%--        if (name.toUpperCase().indexOf(filter) > -1) {--%>
    <%--            &lt;%&ndash;filteredSearch.push(${ad.id});&ndash;%&gt;--%>
    <%--            html += "<div class=\"col-md-6\">\n" +--%>
    <%--                "            <h2>${ad.title}</h2>\n" +--%>
    <%--                "            <p>${ad.description}</p>\n" +--%>
    <%--                "     <form method=\"post\" action=\"/da\">\n" +--%>
    <%--                "                <button type=\"submit\" name=\"button\" value=\"${ad.id}\">View Ad</button>\n" +--%>
    <%--                "            </form>\n" +--%>
    <%--                "        </div>\n"--%>
    <%--        }--%>
    <%--        // console.log(filteredSearch);--%>
    <%--    });--%>
    <%--    document.getElementById("ads").innerHTML = (html)--%>
    <%--}--%>
</script>


</body>
</html>
