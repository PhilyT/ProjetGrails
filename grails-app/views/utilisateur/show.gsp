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
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        </div>
        <div id="show-utilisateur" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="utilisateur" />
            <g:form resource="${this.utilisateur}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.utilisateur}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
