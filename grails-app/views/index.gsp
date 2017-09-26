<!doctype html>
<html>
<head>
<sec:ifNotLoggedIn>
    <sec:ifAnyGranted roles='ROLE_ADMIN'>
        <meta name="layout" content="admin"/>
    </sec:ifAnyGranted>
    <sec:ifAnyGranted roles='ROLE_MODERATEUR,ROLE_UTILISATEUR'>
        <meta name="layout" content="main"/>
    </sec:ifAnyGranted>
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
        <section class="row colset-2-its">
            <h1>Welcome to Grails</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

        </section>
    </div>

</body>
</html>
