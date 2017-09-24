var localisations = [];
var localisation;
var infowindows = [];
var markers = [];
var contents =[];
var map;
var centerLat=0;
var centerLng =0;

function addLocalisation(lat,lng, nom, description) {
    localisations.push({pos:{lat:parseFloat(lat), lng:parseFloat(lng)}, nom:nom, description:description});
    centerLat+=parseFloat(lat);
    centerLng+=parseFloat(lng);
}

function initMapGroupe() {


    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8
    });

}

function initMapPoid() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center:localisation
    });
    var marker = new google.maps.Marker({
        position: localisation,
        map: map
    });
}

function updateMapGroupe(){
    for(var i =0; i<localisations.length; i++){
        var marker = new google.maps.Marker({
            position: localisations[i].pos,
            map: map,
            title:localisations[i].nom

        });
        markers.push(marker);
        var contentInfo = '<h1>'+ localisations[i].nom+'</h1><p>'+localisations[i].description+'</p>';
        var infowindow =new google.maps.InfoWindow({content:contentInfo});
        infowindows.push(infowindow);
    }

    for(var i =0; i<markers.length; i++){
        markers[i].addListener('click', clickListener(markers[i], infowindows[i]));
        // markers[i].addListener('mouseout', function() {
        //     infowindow.close();
        // });
    }
}

function clickListener(marker, infowindow){
    infowindow.open(map, marker);
}