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
    
    <%@include file="components/headdata.html"%>
    
</head>
<body>

    <jsp:include page="/Client/out/components/navbar.jsp" />
    
    <div class="container">
        <div class="page-header">
            <h1>Fehler 404 - Die Seite konnte nicht gefunden werden</h1>
        </div>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <img class="img img-responsive" src="/Client/img/logo.svg" width="500" height="500">
                <p>
                    Die angeforderte Seite konnte leider nicht gefunden. <br>
                </p>
            </div>
        </div>
    </div>

    <jsp:include page="components/footdata.jsp"/>

</body>
</html>
