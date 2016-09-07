<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 30.08.2016
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fehler beim Seitenaufruf</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>

    <jsp:include page="components/navbar.jsp" />
    
    <div class="container">
        <div class="page-header">
            <h1>Fehler 404 - Die Seite konnte nicht gefunden werden</h1>
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <img class="img img-responsive" src="../../img/logo.svg" width="500" height="500">
                <p>
                    Die angeforderte Seite konnte leider nicht gefunden. <br>
                </p>
            </div>
        </div>
    </div>

</body>
</html>
