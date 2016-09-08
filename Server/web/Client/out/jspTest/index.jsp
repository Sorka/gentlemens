<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %><%--
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

    int editorNr = 0;

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>thenewboston</title>
    
    <jsp:include page="components/headdata.jsp"/>

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
        <div class="row">
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
            <div class="col-md-4"><h3>Platzhalter</h3>
                <p1>Text</p1>
            </div>
        </div>
    </div>

</div>

</body>
</html>
