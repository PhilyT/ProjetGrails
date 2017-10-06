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
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="create-image" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
    <g:uploadForm  resource="${this.image}" method="POST">
        <fieldset class="form">
            <div class='fieldcontain required'>
                <label for='productPic'>Image
                    <span class='required-indicator'>*</span>
                </label>
                <g:field type="file" name="productPic" required="true"/>
            </div>
            <div class='fieldcontain'>
                <label for='poi'>Poi</label>
                <g:select name="poi"
                          from="${Poi.all}"
                          value="${image.poi}"
                          optionKey="id"
                          optionValue="nom"
                          noSelection="['':'']"/>
            </div>
            <div class='fieldcontain'>
                <label for='groupe'>Groupe</label>
                <g:select name="groupe"
                          from="${Groupe.all}"
                          value="${image.groupe}"
                          optionKey="id"
                          optionValue="nom"
                          noSelection="['':'']"/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:uploadForm >
</div>
</body>
</html>
