<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <c:if test="${sessionScope.error != null}">
            <p style="color:red;font-weight:bold">${sessionScope.error}</p>
        </c:if>

        <c:if  test="">

            <form action="">
                <input type="text">
                <input type="text">
                <button></button>
            </form>


        </c:if>
        <c:if test="!=">

            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <form method="post" action="/da">
                <button class="btn #29b6f6 light-blue lighten-1" type="submit" name="button" value="${ad.id}">View Ad</button>
            </form>


        </c:if>


        <form action="/register" method="post" id="reg">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${sessionScope.failed.username}">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${sessionScope.failed.email}">
            </div>
            <div class="form-group">
                <label for="name">Full Name</label>
                <input id="name" name="name" class="form-control" type="text" value="${sessionScope.failed.full_name}">
            </div>
            <div class="form-group">
                <label for="address">Address(Street,City,State,Zipcode)</label>
                <input id="address" name="address" class="form-control" type="text" value="${sessionScope.failed.address}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>

            <div class="field">
                <div class="control">
                    <button class="btn #29b6f6 light-blue lighten-1" type="button" id="picker">Upload Profile Photo</button>
                    <input type="hidden" id="fileupload" name="file">
                </div>
                <div class="control" id="nameBox"></div>
                <div class="control" id="urlBox"></div>
            </div>
<br>
            <input type="submit" class="btn #29b6f6 light-blue lighten-1">
        </form>
    </div>
    <jsp:include page="/WEB-INF/partials/footer.jsp" />
    <script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<%--    FileStack interface--%>
    <script>
        // Set up the picker
        var client = filestack.init("ABhuFU86wTyutrWvOsxZJz");
        var options = {
            onUploadDone: updateForm,
            maxSize: 10 * 1024 * 1024,
            accept: 'image/*',
            uploadInBackground: false
        };
        var picker = client.picker(options);

        // Get references to the DOM elements

        var form = document.getElementById('reg');
        var fileInput = document.getElementById('fileupload');
        var btn = document.getElementById('picker');
        var nameBox = document.getElementById('nameBox');
        var urlBox = document.getElementById('urlBox');

        // Add our event listeners

        btn.addEventListener('click', function (e) {
            e.preventDefault();
            picker.open();
        });x
        form.addEventListener('submit', function (e) {
            e.preventDefault();
            fileInput.value
        });
        // Helper to overwrite the field input value

        function updateForm (result) {
            var fileData = result.filesUploaded[0];
            fileInput.value = fileData.url;

            // Some ugly DOM code to show some data.
            var name = document.createTextNode('Selected: ' + fileData.filename);
            var url = document.createElement('a');
            url.href = fileData.url;
            url.appendChild(document.createTextNode(fileData.url));
            nameBox.appendChild(name);
            urlBox.appendChild(document.createTextNode('Uploaded to: '));
            urlBox.appendChild(url);
        }
        console.log(fileInput.value);
    </script>
</body>
</html>
