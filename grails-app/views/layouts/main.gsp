
<!doctype html>

<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/#">
                <i class="fa grails-icon">
                    <asset:image src="grails-cupsonly-logo-white.svg"/>
                </i> Grails
            </a>
        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <sec:ifLoggedIn>
                    <g:set var="iduser"><sec:loggedInUserInfo field='id'/></g:set>
                    <li><a>Bonjour</a></li>
                    <li><g:link controller="utilisateur" action="show" id="${iduser}"><sec:username/></g:link></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <sec:ifAnyGranted roles='ROLE_MODERATEUR'>
                                <li class="controller">
                                    <g:link controller="utilisateur" action="index">Utilisateurs</g:link>
                                </li>
                            </sec:ifAnyGranted>
                            <li class="controller">
                                <g:link controller="groupe" action="index">Groupes</g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="groupe" action="index">Pois</g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="groupe" action="index">Lieux</g:link>
                            </li>
                            <li class="controller">
                                <g:link controller="groupe" action="index">Images</g:link>
                            </li>
                        </ul>
                    </li>
                    <li><g:link controller="logout">Deconnexion</g:link></li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li><g:link controller="login" action="auth">Connexion</g:link></li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </div>
</div>



<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
