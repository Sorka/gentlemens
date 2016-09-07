<%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Über uns </title>
    
    <%@include file="components/headdata.html"%>

    <style>
        .jumbotron{
            background-color: #57575f;
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
    </style>
</head>
<body>

<jsp:include page="components/navbar.jsp" />

<div class="container">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
    </div>
    <div class="jumbotron">
        <p>Wir sind der Gentlemens Club, wir spielen hygie̱nisch, also sauber und vornehmend. Wir sind resistent gegen wipes und scheuen keine Kosten für ein schicken Anzug! </p>
        <p>Ist ein Gentlemen nicht hügenisch so wird der Gentlemen erinnert warum es wichtig ist sich gut anzuziehen. Das erfolgt (meistens) ohne Körperliche Gewalt</p>
    </div>
    <div class="jumbotron">
        <p>Wir sind Erfolgsorientiert. Versagen ist keine Option </p>
        <p>Versagen wir doch, so drehen wir es so zurecht das es doch ein Erfolg war</p>
    </div>
    <div class="jumbotron">
        <p>Ein Gentlemen kümmert sich stets um das wohlergehen einer Lady </p>
        <p>Auch wenn das heißt sich die Finger schmutzig zu machen</p>
    </div>
</div>

</body>
</html>
