var locations = [];
var map;

function addLocation(lat,lng) {
    locations.push({lat:parseFloat(lat), lng:parseFloat(lng)});
}

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        zoom: 6,
        center:{lat:54.525961,lng:15.255119}
    });
    updateMap();
}

function updateMap(){
    var centerLat=0;
    var centerLng =0;
    for(var i =0;i<locations.length;i++){
        console.log(locations[i]);
        var marker = new google.maps.Marker({
            position: locations[i],
            map: map
        });
        centerLat+=locations[i].lat;
        centerLng+=locations[i].lng;

    }
    console.log({lat:centerLat/locations.length, lng:centerLng/locations.length});
    map.setCenter({lat:centerLat/locations.length, lng:centerLng/locations.length});
}

