













<%@ page import="it.algos.algosmag.Unita" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'unita.label', default: 'Unita')}"/>
    <title><g:message code="unita.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-unita" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="unita.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>

<div id="list-unita" class="content scaffold-list" role="main">
    <h1><g:message code="unita.list.label" args="[entityName]" default="Elenco"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <g:if test="${campiLista}">
            <algos:titoliLista campiLista="${campiLista}"></algos:titoliLista>
        </g:if>
        <g:else>
            <tr>
                
                <g:sortableColumn property="sigla"
                                  title="${message(code: 'unita.sigla.label', default: 'Sigla')}"/>
                
                <g:sortableColumn property="nome"
                                  title="${message(code: 'unita.nome.label', default: 'Nome')}"/>
                
            </tr>
        </g:else>
        </thead>
        <tbody>
        <g:if test="${campiLista}">
            <g:each in="${unitaInstanceList}" status="i" var="unitaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="${campiLista}" rec="${unitaInstance}"></algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <g:each in="${unitaInstanceList}" status="i" var="unitaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${unitaInstance.id}">${fieldValue(bean: unitaInstance, field: "sigla")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${unitaInstance.id}">${fieldValue(bean: unitaInstance, field: "nome")}</g:link></td>
                    
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>
    <g:if test="${application.usaExport}">
        <div class="buttons">
            <export:formats/>
        </div>
    </g:if>
    <div class="pagination">
        <g:paginate total="${unitaInstanceTotal}"/>
    </div>
</div>
</body>
</html>
