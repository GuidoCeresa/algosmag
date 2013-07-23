<%--Created by Algos s.r.l.--%>
<%--Date: mag 2013--%>
<%--Il plugin Algos ha inserito (solo la prima volta) questo header per controllare--%>
<%--le successive release (tramite il flag di controllo aggiunto)--%>
<%--Tipicamente VERRA sovrascritto ad ogni nuova release del plugin--%>
<%--per rimanere aggiornato--%>
<%--Se vuoi che le prossime release del plugin NON sovrascrivano questo file,--%>
<%--perdendo tutte le modifiche precedentemente effettuate,--%>
<%--regola a false il flag di controllo flagOverwrite©--%>
<%--flagOverwrite = true--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${grailsApplication.metadata.'app.name'}</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="status" role="complementary">
    <h1>Application Status</h1>
    <ul>
        <li>App version: <g:meta name="app.version"/></li>
        <li>Grails version: <g:meta name="app.grails.version"/></li>
        <li>Groovy version: ${GroovySystem.getVersion()}</li>
        <li>JVM version: ${System.getProperty('java.version')}</li>
        <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
    </ul>

    <h1>Plugins installati</h1>
    <ul>
        <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
            <li>${plugin.name} - ${plugin.version}</li>
        </g:each>
    </ul>
</div>

<div id="page-body" role="main">
    <h1>Benvenuto in Algos</h1>

    <div id="controller-list" role="navigation">
        <h2>Moduli disponibili:</h2>
        <g:if test="${application.mostraTuttiControlli}">
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.findAll { it.fullName != 'Dbdoc' }}">
                    <li class="controller"><g:link
                            controller="${c.logicalPropertyName}">${c.getName()}</g:link></li>
                </g:each>
            </ul>
        </g:if>
        <g:else>
            <li class="controller"><g:link controller="Unita">Unità di misura</g:link></li>
            <li class="controller"><g:link controller="Categoria">Categorie di articoli</g:link></li>
            <li class="controller"><g:link controller="Articolo">Articoli</g:link></li>
        </g:else>
    </div>
</div>
</body>
</html>
