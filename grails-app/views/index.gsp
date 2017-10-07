<!doctype html>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <sec:ifNotLoggedIn>

        <meta name="layout" content="main"/>

    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>

        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <meta name="layout" content="admin"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
            <meta name="layout" content="main"/>
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>

    <title>Welcome</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>


</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
    </div>



</div>


<div id="content" role="main">
    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles='ROLE_ADMIN'>
            <div id="piechart" style="width: 900px; height: 500px;"></div>
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>
    <section class="row colset-2-its">
        <h1>Projet Serveur Grails MBDS</h1>

        <p>
        <h3>Infos utiles :</h3>
        <ul>
            <li>Compte utilisateur login:"user" mot de passe:"0000"</li>
            <li>Compte moderateur login:"mod" mot de passe:"0000"</li>
            <li>Compte administrateur login:"admin" mot de passe:"0000"</li>
            <li>Chemin d'accès aux images : "C:/Program Files (x86)/EasyPHP-DevServer-14.1VC11/data/localweb/projects/images/"</li>
            <li>Dossier images à la racine du projet contient les images du groupe et des pois insérer par le bootstrap.</li>
        </ul>
        <h3> Utilisation de la google map api pou générer la map.</h3>
        <ul>
            <li>Script googlemapapi.js utilisé pour l'affichage des map dans les différents vues.</li>
            <li>Ajout de méthodes lieu et lieux dans les contôleur groupe et poi pour l'obtention des données nécessaire à l'affichage sous format json.</li>
            <li>Modification des coordonnées d'un lieu possible en cliquant sur la carte dans l'edition des lieux.</li>
        </ul>
    </p>

    </section>
</div>
<asset:javascript src="camenber.js"/>
</body>
</html>
