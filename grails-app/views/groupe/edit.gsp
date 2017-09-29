<%@ page import="grails.mbds.projet.Poi" %>
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
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-groupe" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.groupe}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.groupe}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.groupe}" method="PUT">
                <g:hiddenField name="version" value="${this.groupe?.version}" />
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='nom'>Nom
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="nom" value="${groupe.nom}" required="true"/>
                    </div>
                    <div class='fieldcontain'>
                        <label>Images</label>
                        <g:each var="image" in="${groupe.images}">
                            <image src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/>
                        </g:each>
                        <a href="/image/create?groupe.id=${groupe.id}">Ajouter une image</a>
                    </div>
                    <div class='fieldcontain'>
                        <label for='pois'>Pois</label>
                        <g:select name="pois"
                                  from="${Poi.all}"
                                  value="${groupe.pois}"
                                  optionKey="id"
                                  optionValue="nom"
                                  multiple="" />
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
