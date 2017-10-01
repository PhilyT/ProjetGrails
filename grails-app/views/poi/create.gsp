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
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-poi" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.poi}" method="POST">
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='nom'>Nom
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="nom" value="${poi.nom}" required="true"/>
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
                        <label for='lieu'>lieu</label>
                        <g:select name="lieu"
                                  from="${Lieu.all}"
                                  value="${poi.lieu}"
                                  optionKey="id"
                                  optionValue="nom"
                                    />
                    </div>

                    <div class='fieldcontain'>
                        <label for='groupes'>Groupes</label>
                        <g:select name="groupes"
                                  from="${Groupe.all}"
                                  value="${poi.groupes}"
                                  optionKey="id"
                                  optionValue="nom"
                                  multiple="" />
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
