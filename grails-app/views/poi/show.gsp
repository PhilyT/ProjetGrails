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
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:javascript src="googlemapapi.js"></asset:javascript>
        <asset:stylesheet href="googlemapapi.css"></asset:stylesheet>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBLm7WBXLggQd_tLaSQnd7fotkW6f-iBLo&callback=initMapPoi">
        </script>
        <script>
            window.onload = function () {
                $.get("${createLink(controller:'poi',action:'lieu')}", {id:${poi.id}},function(data, status){
                    if(status=="success"){
                        var lat = parseFloat(data.lieu.posX);
                        var lng = parseFloat(data.lieu.posY);
                        var images = data.images;
                        var contentInfoPoi = '<h1>'+data.nom+'</h1><p>'+data.description+'</p><p>';
                        for(var j=0; j<images.length; j++){
                            contentInfoPoi += '<img src="http://localhost/projects/images/'+images[j].nom+'" alt="'+images[j].nom +'" width="40" height="60"/>'
                        }
                        contentInfoPoi += '</p>';
                        var title = data.nom;
                        updateMapPoi(lat, lng, contentInfoPoi, title);
                    }else{
                        console.log(status);
                    }
                });
            }
        </script>
    </head>
    <body>
        <a href="#show-poi" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="show-poi" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>


            <ol class="property-list poi">
                <li class="fieldcontain">
                    <span id="nom-label" class="property-label">Nom</span>
                    <div class="property-value" aria-labelledby="nom-label">
                        <f:display bean="poi" property="nom" />
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="images-label" class="property-label">Images</span>
                    <div class="property-value" aria-labelledby="images-label">
                        <g:each var="image" in="${poi.images}">
                            <a href="${createLink(controller:'image',action:'show',id:image.id)}"><img src="http://localhost/projects/images/${image.nom}" alt="${image.nom}" width="60" height="80"/></a>
                        </g:each>
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="description-label" class="property-label">Description</span>
                    <div class="property-value" aria-labelledby="description-label">
                        <f:display bean="poi" property="description" />
                    </div>
                </li>

                <li class="fieldcontain">
                    <span id="utilisateur-label" class="property-label">Utilisateur</span>
                    <div class="property-value" aria-labelledby="utilisateur-label">
                        <f:display bean="poi" property="utilisateur.username" />
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="lieu-label" class="property-label">Lieu</span>
                    <div class="property-value" aria-labelledby="lieu-label">
                        <f:display bean="poi" property="lieu.nom" />
                    </div>
                </li>
                <li class="fieldcontain">
                    <span id="groupe-label" class="property-label">Groupe</span>
                    <div class="property-value" aria-labelledby="groupes-label">
                        <f:table collection="${poi.groupes}" properties="['nom']"/>
                    </div>
                </li>
            </ol>









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
