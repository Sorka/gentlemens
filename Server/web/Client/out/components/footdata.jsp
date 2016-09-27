<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 13.09.2016
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<% if(loggedIn)  { %>

    <script src="/Client/js/logout.js"></script>

    <% if(isAdmin)  { %>

    <!-- wysihtml core javascript with default toolbar functions -->
    <script src="/Client/wysihtml-0.5.5/dist/wysihtml-toolbar.min.js"></script>

    <!-- rules defining tags, attributes and classes that are allowed -->
    <script src="/Client/wysihtml-0.5.5/parser_rules/advanced_and_extended.js"></script>
    <script src="/Client/js/updater.js"></script>
    <% } %>
<% } else { %>
    <script src="/Client/js/login.js"></script>
<% } %>