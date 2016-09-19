<%@ page import="hibernate.User" %><%--
  Created by IntelliJ IDEA.
  User: Dennis
  Date: 02.09.2016
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Object idAttr = session.getAttribute("userId");

    boolean loggedIn = idAttr != null && User.isLoggedIn(idAttr, session.getId());

    User user = null;

    if(idAttr != null) {
        user = User.getUser(idAttr);
    }

%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index">
                <img class="pull-left" src="/Client/img/logo-transparent.svg" width="50" style="margin-top: -5px; margin-right: 5px;"/>
                Gentlemens Club
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/aboutus">&Uuml;ber uns</a></li>
                <li><a href="/recruit">Rekrutierung</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Spielrichtungen <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/pvp">PvP</a></li>
                        <li><a href="/pve">PvE</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <% if(!loggedIn) { %>
                    <li><a href="#" data-toggle="modal" data-target="#login-modal">Login</a></li>
                    <li><a href="/registration">Registrieren</a></li>
                <%  } else { %>
                    <li><a href="#" style="cursor: default;">Hallo <%= user.getUsername() %></a></li>
                    <li><a id="logout-btn" href="#">Logout</a></li>
                <% } %>
            </ul>
        </div><!-- /.navbar-collapse -->
        <% if(!loggedIn) { %>
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="loginmodal-container">
                    <div class="animation-overlay">
                        <img class="img-responsive animation-img" src="/Client/img/loading-animation.svg"/>
                    </div>
                    <h1>Login to Your Account</h1><br>
                    <form id="form" method="post" action="/login">
                        <input type="text" name="username" placeholder="Username">
                        <input type="password" name="password" placeholder="Password">
                        <input type="submit" name="login" class="login loginmodal-submit" value="Login">
                    </form>
                    <p id="errorText" style="color:red;"></p>
                    <div class="login-help">
                        <a href="/registration">Register</a> - <a href="#">Forgot Password</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div><!-- /.container-fluid -->
</nav>
