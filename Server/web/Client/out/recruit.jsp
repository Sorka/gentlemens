<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

    int editorNr = 0;

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Gentlemens Club - Rekrutierung</title>

    <%@include file="/Client/out/components/headdata.html"%>

    <style>
        .jumbotron{
            background-color: #7c7c84;
            color: #ffffff;
        }
        /* Adds borders for tabs */
        .tab-content {
            border-left: 1px solid #ddd;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }
        .nav-tabs {
            margin-bottom: 0;
        }
        .jumbotrontwo{
            background-color: #57575f;
            color: #ffffff;
        }
    </style>
</head>
<body>

<jsp:include page="/Client/out/components/navbar.jsp" />

<div class="container">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
    </div>

    <jsp:include page="/Client/out/components/contentLoader.jsp">
        <jsp:param name="pageName" value="recruit"/>
    </jsp:include>

</div>

    <jsp:include page="/Client/out/components/footdata.jsp"/>

    <jsp:include page="/Client/out/components/editorJsLoader.jsp">
        <jsp:param name="pageName" value="recruit"/>
    </jsp:include>

</body>
</html>