<!DOCTYPE html>
<html>
    <head>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <meta name="layout" content="admin"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
            <meta name="layout" content="main"/>
        </sec:ifAnyGranted>
        <g:set var="entityName" value="${message(code: 'utilisateur.label', default: 'Utilisateur')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-utilisateur" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${utilisateurList}" />

            <div class="pagination">
                <g:paginate total="${utilisateurCount ?: 0}" />
            </div>
            <div>
                <sec:ifLoggedIn>
                    Bienvenu !
                </sec:ifLoggedIn>
                <sec:ifLoggedIn>
                    Logged in as <sec:username/>
                </sec:ifLoggedIn>
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                   ...
                    is admin
                    ...

                </sec:ifAnyGranted>



            </div>
        </div>
    </body>
</html>