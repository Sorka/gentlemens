<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 30.08.2016
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Fehler beim Seitenaufruf</title>

    <%@include file="components/headdata.html" %>
</head>
<body>

<jsp:include page="/Client/out/components/navbar.jsp"/>

<div class="container">
    <div class="page-header">
        <h1>Fehler 404 - Die Seite konnte nicht gefunden werden</h1>
    </div>
    <div class="row">
        <div class="col-lg-4 col-lg-offset-2 col-md-4 col-md-offset-2 col-sm-12 col-xs-12">
            <img class="img img-responsive img-rounded center-block" src="/Client/img/logo-quadratic.svg" width="400"
                 height="400">
        </div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <h4>
                Uups, da haben sie sich wohl verirrt. Diese Seite existiert leider nicht.<br>
                Aber da wir Gentlemen sind, weisen wir ihnen den Weg:
            </h4>
            <p>
            <h5>
                Sind sie auch ein echter Gentlemen klicken sie <a href="/">hier</a> um zur Startseite zu gelangen.
            </h5>
            <p>
            <h5>
                Ansonsten verlassen sie unsere Seite bitte <a href="about:blank">hier</a> ;)
            </h5>
        </div>
    </div>
</div>

<jsp:include page="components/footdata.jsp"/>

</body>
</html>
