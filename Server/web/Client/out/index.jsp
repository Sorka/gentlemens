<%@ page import="cms.ContentLoader" %>
<%@ page import="hibernate.Rank" %>
<%@ page import="hibernate.User" %>
<%@ page import="org.json.simple.JSONArray" %>
<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

    JSONArray content = (JSONArray) new ContentLoader("index").load().get("content");

    int size  = content.size();

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>thenewboston</title>
    
    <%@include file="components/headdata.html"%>

    <style>
        /*.jumbotron{
            background-color: #57575f;
            color: #ffffff;
        }*/
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
    </style>
</head>
<body>

<jsp:include page="/Client/out/components/navbar.jsp" />

<div id="main-content" class="container">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
        <button class="btn btn-primary pull-right" onclick="addSection();">
            <span class="glyphicon glyphicon-plus"></span>
        </button>
    </div>

    <jsp:include page="/Client/out/components/contentLoader.jsp">
        <jsp:param name="pageName" value="index"/>
    </jsp:include>

</div>

    <jsp:include page="/Client/out/components/footdata.jsp"/>

    <jsp:include page="/Client/out/components/editorJsLoader.jsp">
        <jsp:param name="pageName" value="index"/>
    </jsp:include>

</body>
</html>
