<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="cms.ContentLoader" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 08.09.2016
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

    int size = 0;

    if(loggedIn) {
        JSONArray content = (JSONArray) new ContentLoader(request.getParameter("pageName")).load().get("content");

        size = content.size();
    }
%>

<% if(loggedIn && isAdmin) {%>
<script>
    <% for (int i = 0; i < size; i++) { %>


    var editor = new wysihtml5.Editor('<%= "editor" + i%>', {
        toolbar: '<%= "toolbar" + i%>',
        parserRules: wysihtml5ParserRules
    });


    <% } %>
</script>
<% } %>