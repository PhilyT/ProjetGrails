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
<body >

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">Back To Admin</div>
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

<div class="container text-center" >
    <div class="row content"  >
        <div class="col-sm-2 sidenav" id="sid">

            <div class="panel panel-primary">

                <div class="panel-heading">ACTION</div>
                <div class="panel-body">
                    <g:link controller="utilisateur" action="index">Utilisateurs</g:link>
                </div>
                <div class="panel-body">
                    <g:link controller="groupe" action="index">Groupes</g:link>
                </div>
                <div class="panel-body">
                    <g:link controller="poi" action="index">Pois</g:link>
                </div>
                <div class="panel-body">
                    <g:link controller="lieu" action="index">Lieux</g:link>
                </div>
                <div class="panel-body">
                    <g:link controller="image" action="index">Images</g:link>
                </div>
            </div>

        </div>
        <div class="col-sm-10 text-left" id="bodyadmin">
            <g:layoutBody/>
        </div>
    </div>
</div>

<div  id="footadmin"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>
<asset:javascript src="application.js"/>
</body>
</html>
