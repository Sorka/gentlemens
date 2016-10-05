<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="cms.ContentLoader" %>
<%@ page import="hibernate.User" %>
<%@ page import="hibernate.Rank" %>
<%@ page import="org.json.simple.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 08.09.2016
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());
    boolean isAdmin = loggedIn && User.getUser(idAttr).getRank().equals(Rank.ADMINISTRATOR);

    JSONArray content = (JSONArray) new ContentLoader(request.getParameter("pageName")).load().get("content");

    int size  = content.size();
%>

<% for(int i = 0; i < size; i++) { String data = (String) ((JSONObject) content.get(i)).get("section"); %>
<div id="<%= "section" + i%>" class="jumbotron">

    <div class="container">
        <div class="row">
            <% if(loggedIn && isAdmin) { %>
            <div id="<%= "editor" + i%>" class="col-lg-12 line-break" data-placeholder="Go on, start editing...">
                <%= data %>
            </div>
            <% } else { %>
            <div class="col-lg-12">
                <%= data %>
            </div>
            <% } %>
        </div>
        <% if(loggedIn && isAdmin) { %>
        <div class="row">
            <div id="<%= "toolbar" + i %>" class="edy-tb col-lg-12 btn-toolbar" role="toolbar" style="display: none;">
                <%@include file="editor-toolbar.html"%>
            </div>
        </div>
        <% } %>
    </div>
</div>
<% } %>
