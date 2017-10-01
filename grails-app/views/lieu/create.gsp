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
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="googlemapapi.js"></asset:javascript>
        <asset:stylesheet href="googlemapapi.css"></asset:stylesheet>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLm7WBXLggQd_tLaSQnd7fotkW6f-iBLo&callback=initMapPoi">
        </script>
        <script>
            window.onload = function () {
                map.setCenter({lat:43.7101728,lng:7.261953199999994});
                map.setZoom(8);
                map.addListener('click', function(e) {
                    placeMarkerAndPanTo(e.latLng, map);
                });
            }
        </script>
    </head>
    <body>
        <a href="#create-lieu" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-lieu" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.lieu}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.lieu}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.lieu}" method="POST">
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='nom'>Nom
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="nom" value="${lieu.nom}" required="true"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='ville'>Ville
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="ville" value="${lieu.ville}" required="true"/>
                    </div>
                    <div class='fieldcontain required'>
                        <label for='codePostal'>Code Postal
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="codePostal" value="${lieu.codePostal}" required="true"/>
                    </div>
                    <div class='fieldcontain'>
                        <label for='posX'>Latitude
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="posX" value="${lieu.posX}"/>
                    </div>
                    <div class='fieldcontain'>
                        <label for='posY'>Longitude
                            <span class='required-indicator'>*</span>
                        </label>
                        <g:field type="text" name="posY" value="${lieu.posY}"/>
                    </div>
                </fieldset>
                <div id="map"></div>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
