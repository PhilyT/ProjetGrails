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
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAnyGranted>
            </ul>
        </div>
        <div id="show-image" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list groupe">
                <li class="fieldcontain">
                    <div class="property-value">
                        <img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="240" height="400"/>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="groupe-label" class="property-label">Groupe</span>
                    <div class="property-value" aria-labelledby="groupe-label">
                        <g:if test="${image.groupe}">
                            <a href="${createLink(controller:'groupe',action:'show',id:image.groupe.id)}">${image.groupe.nom}</a>
                        </g:if>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="poi-label" class="property-label">Poi</span>
                    <div class="property-value" aria-labelledby="poi-label">
                        <g:if test="${image.poi}">
                            <a href="${createLink(controller:'poi',action:'show',id:image.poi.id)}">${image.poi.nom}</a>
                        </g:if>
                    </div>
                </li>
            </ol>
            <g:form resource="${this.image}" method="DELETE">
                <fieldset class="buttons">
                    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><g:link class="edit" action="edit" resource="${this.image}"><g:message code="default.button.edit.label" default="Edit" /></g:link></sec:ifAnyGranted>
                    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
