<!DOCTYPE html>
<html>
<head>
    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <meta name="layout" content="admin"/>
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
        <meta name="layout" content="main"/>
    </sec:ifAnyGranted>
    <g:set var="entityName" value="${message(code: 'lieu.label', default: 'Lieu')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
    <asset:javascript src="googlemapapi.js"></asset:javascript>
    <asset:stylesheet href="googlemapapi.css"></asset:stylesheet>
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLm7WBXLggQd_tLaSQnd7fotkW6f-iBLo&callback=initMapPoi">
    </script>
    <script>
        window.onload = function () {
            var lat = parseFloat(${lieu.posX});
            var lng = parseFloat(${lieu.posY});
            var contentInfoPoi = '<p>${lieu.nom}</p><p>${lieu.ville}</p><p>${lieu.codePostal}</p>';
            var title = "${lieu.nom}";
            updateMapPoi(lat, lng, contentInfoPoi, title);
        }
    </script>
</head>
<body>
<a href="#show-lieu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAnyGranted>
    </ul>
</div>
<div id="show-lieu" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:display bean="lieu" />
    <div id="map"></div>
    <g:form resource="${this.lieu}" method="DELETE">
        <fieldset class="buttons">
            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><g:link class="edit" action="edit" resource="${this.lieu}"><g:message code="default.button.edit.label" default="Edit" /></g:link></sec:ifAnyGranted>
            <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
        </fieldset>
    </g:form>
</div>
</body>
</html>
