<!DOCTYPE html>
<html>
    <head>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <meta name="layout" content="admin"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
            <meta name="layout" content="main"/>
        </sec:ifAnyGranted>
        <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-image" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th></th>
                    <th>Groupe</th>
                    <th>Poi</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="image" in="${imageList}" status="i" >
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><a href="${createLink(controller:'image',action:'show',id:image.id)}"><img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/></a></td>
                        <td><g:if test="${image.groupe}">
                            <a href="${createLink(controller:'groupe',action:'show',id:image.groupe.id)}">${image.groupe.nom}</a>
                        </g:if></td>
                        <td><g:if test="${image.poi}">
                            <a href="${createLink(controller:'poi',action:'show',id:image.poi.id)}">${image.poi.nom}</a>
                        </g:if></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${imageCount ?: 0}" />
            </div>
        </div>
    </body>
</html>