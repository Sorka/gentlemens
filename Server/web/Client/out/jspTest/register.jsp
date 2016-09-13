<%@ page import="hibernate.User" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 25.08.2016
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>thenewboston</title>

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
    <% if(!loggedIn) { %>
    <div class="jumbotron">
        <form class="form-horizontal" action='/register' method="POST">
            <fieldset>
                <div id="legend">
                    <legend class="" style="color: white; font-size: 30px">Register</legend>
                </div>
                <div class="control-group">
                    <!-- Username -->
                    <label class="control-label"  for="username">Benutzername</label>
                    <div class="controls">
                        <input type="text" id="usernameReg" name="username" placeholder="" class="input-xlarge" style="color: #000000">
                        <p class="help-block">Benutzername kann jeden Buchstaben und jede Zahl ohne leerzeichen enthalten.</p>
                    </div>
                </div>

                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="email">E-mail</label>
                    <div class="controls">
                        <input type="text" id="email" name="email" placeholder="" class="input-xlarge" style="color: #000000">
                        <p class="help-block">Deine Emailadresse</p>
                    </div>
                </div>

                <div class="control-group">
                    <!-- Password-->
                    <label class="control-label" for="password">Passwort</label>
                    <div class="controls">
                        <input type="password" id="passwordReg" name="password" placeholder="" class="input-xlarge" style="color: #000000">
                        <p class="help-block">Passwort muss mindestens vier Zeichen lang sein</p>
                    </div>
                </div>

                <div class="control-group">
                    <!-- Password -->
                    <label class="control-label"  for="password_confirm">Password (Bestärigen)</label>
                    <div class="controls">
                        <input type="password" id="password_confirm" name="password_confirm" placeholder="" class="input-xlarge" style="color: #000000">
                        <p class="help-block">Passwort wiederholen</p>
                    </div>
                </div>
                <div class="control-group">
                    <!-- Button -->
                    <div class="controls">
                        <button class="btn btn-success">Registrieren</button>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <% } else { %>
    <h1>Du bist bereits eingeloggt, es ist keine Registrierung mehr nötig ;)</h1>
    <% } %>
</div>

<jsp:include page="components/footdata.jsp"/>

</body>
