<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 08.09.2016
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<% if(loggedIn && isAdmin)  { %>
    <link rel="stylesheet" type="text/css" href="../../css/editor.css">

    <!-- wysihtml core javascript with default toolbar functions -->
    <script src="../../wysihtml-0.5.5/dist/wysihtml-toolbar.min.js"></script>

    <!-- rules defining tags, attributes and classes that are allowed -->
    <script src="../../wysihtml-0.5.5/parser_rules/advanced_and_extended.js"></script>
<% } %>
