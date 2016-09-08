<%--
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

    <jsp:include page="components/headdata.jsp"/>

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

<jsp:include page="components/navbar.jsp" />

<div class="container">
    <div class="page-header">
        <h1>Gentlemens Club</h1>
    </div>
    <div class="jumbotron">
        <% if(loggedIn && isAdmin) { %>
            <div class="container">
                <div class="row">
                    <div id="<% out.print() %>" class="edy-tb col-lg-12 btn-toolbar" role="toolbar" style="display: none;">
        <% } %>
        <p>Wir rekrutieren derzeit nur noch für PvP Spieler. Willst du auch ein Gentlemen sein, so kontaktier uns im Spiel. Melden könnt ihr euch bei</p>
        <p>Gildenleiter: Zepár-Arthas</p>
        <p>Offiziere: neri#2495, Dashâ#2515</p>
    </div>
    <h3>PvP - Spieler gegen Spieler</h3>
    <div class="jumbotron">
        <p>Unsere Gentlemen's messen sich gerne mit anderen. Als Team sind wir am stärksten und daher auch stets auf der Suche</p>
        <p>Gewertete Schlachtfelder - Es ist geplant Gewertete Schlachtfelder zu spielen. Derzeit aufgrund der hohen Raidzeit allerdings nur spontan. Das wird sich vermutlich ändern</p>
        <p>Arenen - Spieler die sich gerne in der Arena messen sind auch gesucht. Dabei solltet ihr wie für einen Gentlemen typisch Erfolgsorientiert sein</p>
        <p>Ungewertetes PvP - Ihr seid auch herzlich Willkommen für ungewertetes PvP, Schlachtfelder werden bei uns oft mit 5 Gentlemens angemeldet</p>
    </div>
    <h3>PvE - Spieler gegen Umgebung</h3>
    <div class="jumbotron">
        <p>Wir sind höchst Erfolgsorientiert im PvE. Die meisten von uns messen sich mit den härstesten Herrausforderungen</p>
        <p>Raid - Wir haben derzeit einen vollen Raid, jedoch ist unsere Ersatzbank derzeit quasi unbesetzt</p>
        <p>Dungeons - Dungeons werden regelmäßig gesäubert, dabei bilden wir sogut wie immer einen volle Gruppe aus Gentlemens! Im Vordergrund</p>
        <p>Weltereignisse - In der neuen Erweiterung werden Weltquest eine Rolle spielen. Auch diese werden in Gemeinschaft erledigt</p>
    </div>
</div>

</body>
</html>