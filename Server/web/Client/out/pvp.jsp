<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Gentlemens Club - PvP</title>

    <%@include file="/Client/out/components/headdata.html"%>
</head>
<body>

<jsp:include page="/Client/out/components/navbar.jsp">
    <jsp:param name="pageName" value="pvp"/>
</jsp:include>

<div class="container-fluid">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
    </div>

    <jsp:include page="/Client/out/components/contentLoader.jsp">
        <jsp:param name="pageName" value="pvp"/>
    </jsp:include>

</div>

    <jsp:include page="/Client/out/components/footdata.jsp"/>

    <jsp:include page="/Client/out/components/editorJsLoader.jsp">
        <jsp:param name="pageName" value="pvp"/>
    </jsp:include>

</body>
</html>
