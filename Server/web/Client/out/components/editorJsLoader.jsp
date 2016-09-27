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

    String pageName = request.getParameter("pageName");

    if(loggedIn) {
        JSONArray content = (JSONArray) new ContentLoader(pageName).load().get("content");

        size = content.size();
    }
%>

<% if(loggedIn && isAdmin) {%>
<script type="text/javascript" src="/Client/js/editorUtils.js"></script>
<script type="text/javascript">

    var pageName = <%= "'" + pageName + "';"%>

    <%= "initEditors(" +  size + ");" %>
</script>
<%--
<script>

    var pageName = <%= "'" + pageName + "';"%>

    var numberOfEditors = <%= size + ";" %>

    var editors = [];

    <% for (int i = 0; i < size; i++) { %>


    var editor = new wysihtml5.Editor('<%= "editor" + i%>', {
        toolbar: '<%= "toolbar" + i%>',
        parserRules: wysihtml5ParserRules
    });

    editors.push(editor);

    <% } %>

    /**
     * puts content of all editable divs into a single json object and returns
     * this object as a string
     */
    function getContentAsJsonString() {

        var sections = [];

        for(var i = 0; i < numberOfEditors; i++) {

            var item = {};

            item["section"] = editors[i].getValue(true);

            sections.push(item);
        }

        var jsonObj = {};
        jsonObj["content"] = sections;

        return JSON.stringify(jsonObj);
    }

</script>
--%>
<% } %>