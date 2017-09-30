<!DOCTYPE html>
<html>
    <head>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <meta name="layout" content="admin"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
            <meta name="layout" content="main"/>
        </sec:ifAnyGranted>
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-poi" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table>
                <thead>
                <tr>
                    <g:sortableColumn property="nom" title="Nom" />
                   
                    <th>Images</th>
                    <th>Description</th>
                    <th>Utilisateur</th>
                    <th>Lieu</th>
                    <th>Groupes</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="poi" in="${poiList}" status="i" >
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><a href="${createLink(controller:'poi',action:'show',id:poi.id)}">${fieldValue(bean: poi, field: "nom")}</a></td>
                        <td><g:each var="image" in="${poi.images}">
                            <a href="${createLink(controller:'image',action:'show',id:image.id)}"><img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/></a>
                            </g:each>
                        </td>
                        <td> <a href="${createLink(controller:'poi',action:'show',id:poi.id)}">${fieldValue(bean: poi, field: "description")}</a> </td>
                        <td> <a href="${createLink(controller:'utilisateur',action:'show',id:poi.utilisateur.id)}">${poi.utilisateur.username}</a></td>
                        <td> <li><a href="${createLink(controller:'lieu',action:'show',id:poi.lieu.id)}">${poi.lieu.nom}</a></li></td>

                        <td><u><g:each var="groupe" in="${poi.groupes}">
                            <li><a href="${createLink(controller:'groupe',action:'show',id:groupe.id)}">${groupe.nom}</a></li>
                        </g:each>
                        </u></td>
                    </tr>
                </g:each>
                </tbody>
            </table>



            <div class="pagination">
                <g:paginate total="${poiCount ?: 0}" />
            </div>
        </div>
    </body>
</html>