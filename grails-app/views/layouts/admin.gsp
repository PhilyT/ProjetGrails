<!doctype html>

<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>ADMIN PAGE</title>
    %{--<meta charset="utf-8">--}%
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="admin.css"/>
    <g:layoutHead/>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">Bonjour</div>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <g:set var="iduser"><sec:loggedInUserInfo field='id'/></g:set>
                <li><g:link controller="utilisateur" action="show" id="${iduser}"><sec:username/></g:link></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><g:link controller="logout">Deconnexion</g:link></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content">
        <div class="col-sm-4 sidenav" id="sid">

            <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action active">
                    ACTION
                </button>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">

                    <button type="button" class="list-group-item list-group-item-action">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </button>

                </g:each>
            </div>


        </div>
        <div class="col-sm-8 text-left">
            <g:layoutBody/>
        </div>

    </div>
</div>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

</body>
</html>
