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

            <div >
                <div class="nav" role="navigation">
                    <ul>
                        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    </ul>
                </div>


                <div >
                    <h1>Utilisateurs</h1>
                    <div class="nav" role="navigation">
                        <ul>

                            <li><g:link class="list" action="index" controller="utilisateur">ListeUsers</g:link></li>
                            <li><g:link class="create"  controller="utilisateur" action="create">Add New User</g:link></li>
                        </ul>
                </div>
                </div>
                <div >
                    <h1>Groupes</h1>
                    <div class="nav" role="navigation">
                        <ul>

                            <li><g:link class="list" action="index">ListeGroupes</g:link></li>
                            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create"  controller="groupe"  action="create">Add NewGroupe</g:link></li></sec:ifAnyGranted>
                        </ul>
                    </div>
                </div>
                <div >
                    <h1>Pois</h1>
                    <div class="nav" role="navigation">
                        <ul>

                            <li><g:link class="list"  controller="poi" action="index">ListePois</g:link></li>
                            <li><g:link class="create" controller="poi" action="create">Add New Poi</g:link></li>
                        </ul>
                    </div>
                </div>
                <div >
                    <h1>Lieux</h1>
                    <div class="nav" role="navigation">
                        <ul>

                            <li><g:link class="list"   controller= "lieu" action="index">ListeLieux</g:link></li>
                            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create"  controller= "lieu" action="create">Add NewLieu</g:link></li></sec:ifAnyGranted>
                        </ul>
                    </div>

                </div>
                <div >
                    <h1>Images</h1>
                    <div class="nav" role="navigation">
                        <ul>

                            <li><g:link class="list" action="index" controller="image">ListeImages</g:link></li>
                            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create"  controller= "image" action="create"> Add New Image</g:link></li></sec:ifAnyGranted>
                        </ul>
                    </div>
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

</body>
</html>
