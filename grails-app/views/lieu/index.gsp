<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lieu.label', default: 'Lieu')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-lieu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAnyGranted>
            </ul>
        </div>
        <div id="list-lieu" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${lieuList}" />

            <div class="pagination">
                <g:paginate total="${lieuCount ?: 0}" />
            </div>
        </div>
    </body>
</html>