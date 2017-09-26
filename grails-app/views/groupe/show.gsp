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
                            addLocalisation(poi.lieu.posX,poi.lieu.posY, poi.nom, poi.description, poi.images);
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
                <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li></sec:ifAnyGranted>
            </ul>
        </div>
        <div id="show-groupe" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list groupe">
                <li class="fieldcontain">
                    <span id="nom-label" class="property-label">Nom</span>
                    <div class="property-value" aria-labelledby="nom-label">
                        <f:display bean="groupe" property="nom" />
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="images-label" class="property-label">Images</span>
                    <div class="property-value" aria-labelledby="images-label">
                        <g:each var="image" in="${groupe.images}">
                            <a href="${createLink(controller:'image',action:'show',id:image.id)}"><img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/></a>
                        </g:each>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="pois-label" class="property-label">Pois</span>
                    <div class="property-value" aria-labelledby="pois-label">
                        <f:table collection="${groupe.pois}" properties="['nom', 'description']"/>
                    </div>
                </li>
            </ol>
            <div id="map"></div>
            <g:form resource="${this.groupe}" method="DELETE">
                <fieldset class="buttons">
                    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><g:link class="edit" action="edit" resource="${this.groupe}"><g:message code="default.button.edit.label" default="Edit" /></g:link></sec:ifAnyGranted>
                    <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MODERATEUR'><input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></sec:ifAnyGranted>
                </fieldset>
            </g:form>
        </div>
    </body>

</html>
