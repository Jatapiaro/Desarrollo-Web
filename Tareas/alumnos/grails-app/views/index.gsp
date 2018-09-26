<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Bienvenido a este sistema</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Controladores<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c}</g:link>
                    </li>
                </g:each>
            </ul>
        </li>
    </content>

    <div class="svg" role="presentation">
        <div class="grails-logo-container">
            <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
        </div>
    </div>

    <div id="content" role="main">
        <section class="row colset-2-its">
            <h1>Bienvenido!</h1>

            <p>
                Felicidades, has aprendido a usar Ruby pero de Java
                
            </p>

            <p>ICE AGE IS COMING!!!</p>

        </section>
    </div>

</body>
</html>
