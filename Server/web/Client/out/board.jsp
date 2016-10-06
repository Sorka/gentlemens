<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>nicht thenowboston hahaha</title>

    <%@include file="components/headdata.html"%>
</head>
<body>

<jsp:include page="/Client/out/components/navbar.jsp">
    <jsp:param name="pageName" value="board"/>
</jsp:include>

<div class="container-fluid">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
        <!--<button class="btn btn-primary pull-right" onclick="addSection();">
            <span class="glyphicon glyphicon-plus"></span>
        </button>-->
    </div>

    <jsp:include page="/Client/out/components/contentLoader.jsp">
        <jsp:param name="pageName" value="board"/>
    </jsp:include>

</div>

<jsp:include page="/Client/out/components/footdata.jsp">
    <jsp:param name="pageName" value="board"/>
</jsp:include>

<jsp:include page="/Client/out/components/editorJsLoader.jsp">
    <jsp:param name="pageName" value="board"/>
</jsp:include>

</body>
</html>
