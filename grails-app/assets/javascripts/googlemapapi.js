var localisations = [];
var localisation;
var map;
var centerLat=0;
var centerLng =0;

function addLocalisation(lat,lng, nom, description, images) {
    localisations.push({pos:{lat:parseFloat(lat), lng:parseFloat(lng)}, nom:nom, description:description, images:images});
    centerLat+=parseFloat(lat);
    centerLng+=parseFloat(lng);
}

function initMapGroupe() {


    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8
    });

}

function initMapPoi() {

    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11
    });


}

function updateMapPoi(lat, lng, contentInfoPoi, title){
    localisation = {lat:lat,lng:lng};
    var marker = new google.maps.Marker({
        position: localisation,
        map: map,
        title:title
    });
    map.setCenter(localisation);
    var infowindow =new google.maps.InfoWindow({content:contentInfoPoi});
    marker.addListener('mouseover', function(){
        clickListener(marker, infowindow);
    });
    marker.addListener('mouseout', function() {
        infowindow.close();
    });
}

function updateMapGroupe(){
    for(var i =0; i<localisations.length; i++){
        callbackmarker(i);
    }
}

function callbackmarker(i){
    var marker = new google.maps.Marker({
        position: localisations[i].pos,
        map: map,
        title:localisations[i].nom

    });
    var contentInfo = '<h1>'+ localisations[i].nom+'</h1><p>'+localisations[i].description+'</p><p>';
    for(var j=0; j<localisations[i].images.length; j++){
        contentInfo += '<img src="http://localhost/projects/images/'+localisations[i].images[j].nom+'" alt="'+ localisations[i].images[j].nom +'" width="40" height="60"/>'
    }
    contentInfo += '</p>';
    var infowindow =new google.maps.InfoWindow({content:contentInfo});
    marker.addListener('mouseover', function(){
        clickListener(marker, infowindow);
    });
    marker.addListener('mouseout', function() {
        infowindow.close();
    });
}

function clickListener(marker, infowindow){
    infowindow.open(map, marker);
}