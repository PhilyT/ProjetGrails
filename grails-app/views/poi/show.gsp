<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'poi.label', default: 'Poi')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="googlemapapi.js"></asset:javascript>
        <asset:stylesheet href="googlemapapi.css"></asset:stylesheet>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLm7WBXLggQd_tLaSQnd7fotkW6f-iBLo&callback=initMapPoi">
        </script>
        <script>
            window.onload = function () {
                var lat = parseFloat(${poi.lieu.posX});
                var lng = parseFloat(${poi.lieu.posY});
                var contentInfoPoi = '<h1>${poi.nom}</h1><p>${poi.description}</p>';
                var title = "${poi.nom}";
                updateMapPoi(lat, lng, contentInfoPoi, title);
            }

        </script>
    </head>
    <body>
        <a href="#show-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-poi" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="poi" />
            <div id="map"></div>
            <g:form resource="${this.poi}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.poi}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
