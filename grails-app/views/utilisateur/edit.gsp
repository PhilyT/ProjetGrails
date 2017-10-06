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
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-utilisateur" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-utilisateur" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.utilisateur}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.utilisateur}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.utilisateur}" method="PUT">
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MODERATEUR,ROLE_UTILISATEUR'>
                <g:hiddenField name="version" value="${this.utilisateur?.version}" />
                <fieldset class="form">
                    <f:all bean="utilisateur"/>
                </fieldset>
                </sec:ifAnyGranted>

                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <div class="form-group">
                        <label for="exampleSelect2">ROLE</label>
                        <select multiple class="form-control" id="roleselect">
                            <option>ROLE_ADMIN</option>
                            <option>ROLE_MODERATEUR</option>
                            <option>ROLE_UTILISATEUR</option>

                        </select>
                    </div>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles='ROLE_MODERATEUR'>
                    <div class="form-group">
                        <label for="exampleSelect2">ROLE</label>
                        <select multiple class="form-control" id="roleselect">

                            <option>ROLE_MODERATEUR</option>
                            <option>ROLE_UTILISATEUR</option>

                        </select>
                    </div>

                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_MODERATEUR,ROLE_UTILISATEUR'>

                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
                </sec:ifAnyGranted>

            </g:form>
        </div>
    </body>
</html>
