<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container add">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <c:if test="${sessionScope.errorAd != null}">
                <p style="color:red;font-weight:bold">${sessionScope.errorAd}</p>
            </c:if>
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" value="${sessionScope.failedAd.title}">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text">${sessionScope.failedAd.description}</textarea>
            </div>
            <div class="form-group">
                <label for="cat"></label>
                <select class="dropdown-content" name="category" id="cat">
                    <option onclick="" name="">Appliances</option>
                    <option onclick="" name="">Automotive</option>
                    <option onclick="" name="">Clothes</option>
                    <option onclick="" name="">Electronics</option>
                    <option onclick="" name="">Furniture</option>
                    <option onclick="" name="">General</option>
                    <option onclick="" name="">Jewelry</option>
                    <option onclick="" name="">Tools</option>
                    <option onclick="" name="">Toys</option>
                </select>
            </div>
            <div class="field">
                <div class="control">
                    <button class="btn #29b6f6 light-blue lighten-1" type="button" id="picker">Upload Picture</button>
                    <input type="hidden" id="fileupload" name="file">
                </div>
                <br>
                <div class="control" id="nameBox"></div>
                <div class="control" id="urlBox"></div>
            </div>
            <input type="submit" class="btn #29b6f6 light-blue lighten-1">
        </form>
    </div>

<jsp:include page="/WEB-INF/partials/footer.jsp" />
<%--    FileStack interface--%>
<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
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

    var form = document.getElementById('add');
    var fileInput = document.getElementById('fileupload');
    var btn = document.getElementById('picker');
    var nameBox = document.getElementById('nameBox');
    var urlBox = document.getElementById('urlBox');

    // Add our event listeners

    btn.addEventListener('click', function (e) {
        e.preventDefault();
        picker.open();
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
