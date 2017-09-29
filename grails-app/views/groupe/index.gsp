<!DOCTYPE html>
<html>
    <head>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <meta name="layout" content="admin"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
            <meta name="layout" content="main"/>
        </sec:ifAnyGranted>
        <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAnyGranted>
            </ul>
        </div>
        <div id="list-groupe" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="nom" title="Nom" />
                    <th>Images</th>
                    <th>Pois</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="groupe" in="${groupeList}" status="i" >
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><a href="${createLink(controller:'groupe',action:'show',id:groupe.id)}">${fieldValue(bean: groupe, field: "nom")}</a></td>
                        <td><g:each var="image" in="${groupe.images}">
                                <a href="${createLink(controller:'image',action:'show',id:image.id)}"><img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/></a>
                            </g:each>
                        </td>
                        <td><u><g:each var="poi" in="${groupe.pois}">
                            <li><a href="${createLink(controller:'poi',action:'show',id:poi.id)}">${poi.nom}</a></li>
                        </g:each>
                        </u></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${groupeCount ?: 0}" />
            </div>
        </div>
    </body>
</html>