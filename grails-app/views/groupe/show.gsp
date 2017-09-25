<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="googlemapapi.js"></asset:javascript>
        <asset:stylesheet href="googlemapapi.css"></asset:stylesheet>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLm7WBXLggQd_tLaSQnd7fotkW6f-iBLo&callback=initMapGroupe">
        </script>
        <script>
            window.onload = function () {
                $.get("${createLink(controller:'groupe',action:'lieux')}", {id:${groupe.id}},function(data, status){
                    if(status=="success"){
                        for(var i=0;i<data.length;i++){
                            var poi = data[i];
                            addLocalisation(poi.lieu.posX,poi.lieu.posY, poi.nom, poi.description);
                        }
                        map.setCenter({lat:centerLat/localisations.length, lng:centerLng/localisations.length});
                        updateMapGroupe();
                    }else{
                        console.log(status);
                    }
                });
            }

        </script>
    </head>
    <body>
        <a href="#show-groupe" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-groupe" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="groupe" />
            <div id="map"></div>
            <g:form resource="${this.groupe}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.groupe}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>

</html>
