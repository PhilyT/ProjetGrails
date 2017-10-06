<%@ page import="grails.mbds.projet.Poi" %>
<%@ page import="grails.mbds.projet.Groupe" %>
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
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-image" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.image}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.image}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.image}" method="PUT">
                <g:hiddenField name="version" value="${this.image?.version}" />
                <fieldset class="form">
                    <div class='fieldcontain'>
                        <image src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="240" height="400"/>
                    </div>
                    <div class='fieldcontain'>
                        <label for='poi'>Poi</label>
                        <g:if test="${!image.poi}">
                        <g:select name="poi"
                                  from="${Poi.all}"
                                  value="${image.poi}"
                                  optionKey="id"
                                  optionValue="nom"
                                  noSelection="['':'']"/>
                        </g:if>
                        <g:if test="${image.poi}">
                            <g:select name="poi"
                                      from="${Poi.all}"
                                      value="${image.poi}"
                                      optionKey="id"
                                      optionValue="nom"/>
                        </g:if>
                    </div>
                    <div class='fieldcontain'>
                        <label for='groupe'>Groupe</label>
                        <g:if test="${!image.groupe}">
                        <g:select name="groupe"
                                  from="${Groupe.all}"
                                  value="${image.groupe}"
                                  optionKey="id"
                                  optionValue="nom"
                                  noSelection="['':'']"/>
                        </g:if>
                        <g:if test="${image.groupe}">
                            <g:select name="groupe"
                                      from="${Groupe.all}"
                                      value="${image.groupe}"
                                      optionKey="id"
                                      optionValue="nom"/>
                        </g:if>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
