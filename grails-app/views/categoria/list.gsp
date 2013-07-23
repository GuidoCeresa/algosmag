













<%@ page import="it.algos.algosmag.Categoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}"/>
    <title><g:message code="categoria.list.label" args="[entityName]" default="Elenco"/></title>
</head>

<body>
<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="create" action="create"><g:message code="categoria.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>

<div id="list-categoria" class="content scaffold-list" role="main">
    <h1><g:message code="categoria.list.label" args="[entityName]" default="Elenco"/></h1>
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
                
                <g:sortableColumn property="nome"
                                  title="${message(code: 'categoria.nome.label', default: 'Nome')}"/>
                
                <g:sortableColumn property="descrizione"
                                  title="${message(code: 'categoria.descrizione.label', default: 'Descrizione')}"/>
                
            </tr>
        </g:else>
        </thead>
        <tbody>
        <g:if test="${campiLista}">
            <g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="${campiLista}" rec="${categoriaInstance}"></algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nome")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "descrizione")}</g:link></td>
                    
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
        <g:paginate total="${categoriaInstanceTotal}"/>
    </div>
</div>
</body>
</html>
