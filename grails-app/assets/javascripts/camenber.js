
google.charts.load('current', {'packages':['corechart']});


function drawChart(data) {
console.log(data);

    var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['UTILISATEUR', parseInt(data[0])],
        ['POIS',      parseInt(data[4])],
        ['GROUPES',  parseInt(data[1])],
        ['Lieux', parseInt(data[2])],
        ['Images',    parseInt(data[3])]
    ]);

    var options = {
        title: 'Dashboard'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
}
