<%@ page import= "grails.mbds.projet.Groupe" %>
<%@ page import="grails.mbds.projet.Utilisateur" %>
<%@ page import="grails.mbds.projet.Lieu" %>

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
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-poi" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.poi}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.poi}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.poi}" method="PUT">
                <g:hiddenField name="version" value="${this.poi?.version}" />


                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='nom'>Nom
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="nom" value="${poi.nom}" required="true"/>
                    </div>
                    <div class='fieldcontain'>
                        <label>Images</label>
                        <g:each var="image" in="${poi.images}">
                            <image src="http://localhost/projects/images/${poi.nom}" alt="${poi.nom}" width="60" height="80"/>
                        </g:each>
                        <a href="/image/create?poi.id=${poi.id}">Ajouter une image</a>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='description'>Description
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="description" value="${poi.description}" required="true"/>
                    </div>
                    <div class='fieldcontain'>
                        <label for='utilisateur'>Utilisateur</label>
                        <g:select name="utilisateur"
                                  from="${Utilisateur.all}"
                                  value="${poi.utilisateur}"
                                  optionKey="id"
                                  optionValue="username"
                                   />
                    </div>
                    <div class='fieldcontain'>
                        <label for='lieu'>Lieu</label>
                        <g:select name="lieu"
                                  from="${Lieu.all}"
                                  value="${poi.lieu}"
                                  optionKey="id"
                                  optionValue="nom"
                                  />
                    </div>
                    
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
