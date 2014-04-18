













<%@ page import="it.algos.algosmag.Articolo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'articolo.label', default: 'Articolo')}"/>
    <title><g:message code="articolo.list.label" args="[entityName]" default="Elenco"/></title>
    <r:require module="filterpane"/>
</head>

<body>
<a href="#list-articolo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/home')}"><g:message code="default.home.label"
                                                                           default="Home"/></a>
        </li>
        <li><g:link class="create" action="create"><g:message code="articolo.new.label"
                                                              args="[entityName]" default="Nuovo"/></g:link></li>
        <g:if test="${menuExtra}">
            <algos:menuExtra menuExtra="${menuExtra}"></algos:menuExtra>
        </g:if>
    </ul>
</div>

<div id="list-articolo" class="content scaffold-list" role="main">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${flash.error}">
        <div class="errors" role="status">${flash.error}</div>
    </g:if>
    <g:if test="${flash.messages}">
        <g:each in="${flash.messages}" status="i" var="singoloMessaggio">
            <div class="message" role="status">${singoloMessaggio}</div>
        </g:each>
    </g:if>
    <g:if test="${flash.errors}">
        <g:each in="${flash.errors}" status="i" var="singoloErrore">
            <div class="errors" role="status">${singoloErrore}</div>
        </g:each>
    </g:if>

    <g:if test="${usaFilter}">
        <filterpane:isNotFiltered><h1>${titoloLista}</h1></filterpane:isNotFiltered>
        <filterpane:isFiltered><h1>${titoloListaFiltrata}</h1></filterpane:isFiltered>
    </g:if>
    <g:else>
        <g:if test="${titoloLista}">
            <h1>${titoloLista}</h1>
        </g:if>
        <g:else>
            <h1><g:message code="articolo.list.label" args="[entityName]" default="Elenco"/></h1>
        </g:else>
    </g:else>


    <table>
        <thead>
        <g:if test="${campiLista}">
            <algos:titoliLista campiLista="${campiLista}"></algos:titoliLista>
        </g:if>
        <g:else>
            <tr>
                
                <th><g:message code="articolo.categoria.label" default="Categoria"/></th>
                
                <g:sortableColumn property="codice"
                                  title="${message(code: 'articolo.codice.label', default: 'Codice')}"/>
                
                <g:sortableColumn property="nome"
                                  title="${message(code: 'articolo.nome.label', default: 'Nome')}"/>
                
                <g:sortableColumn property="descrizione"
                                  title="${message(code: 'articolo.descrizione.label', default: 'Descrizione')}"/>
                
                <g:sortableColumn property="prezzoAcquisto"
                                  title="${message(code: 'articolo.prezzoAcquisto.label', default: 'Prezzo Acquisto')}"/>
                
                <g:sortableColumn property="prezzoVendita"
                                  title="${message(code: 'articolo.prezzoVendita.label', default: 'Prezzo Vendita')}"/>
                
                <th><g:message code="articolo.unitaDiMisura.label" default="Unita Di Misura"/></th>
                
                <g:sortableColumn property="quantita"
                                  title="${message(code: 'articolo.quantita.label', default: 'Quantita')}"/>
                
                <g:sortableColumn property="scortaMinima"
                                  title="${message(code: 'articolo.scortaMinima.label', default: 'Scorta Minima')}"/>
                
                <g:sortableColumn property="sottoscorta"
                                  title="${message(code: 'articolo.sottoscorta.label', default: 'Sottoscorta')}"/>
                
                <g:sortableColumn property="note"
                                  title="${message(code: 'articolo.note.label', default: 'Note')}"/>
                
            </tr>
        </g:else>
        </thead>

        <tbody>
        <g:if test="${campiLista}">
            <g:each in="${articoloInstanceList}" status="i" var="articoloInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <algos:rigaLista campiLista="${campiLista}" rec="${articoloInstance}"></algos:rigaLista>
                </tr>
            </g:each>
        </g:if>
         <g:else>
            <g:each in="${articoloInstanceList}" status="i" var="articoloInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "categoria")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "codice")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "nome")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "descrizione")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "prezzoAcquisto")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "prezzoVendita")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "unitaDiMisura")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "quantita")}</g:link></td>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "scortaMinima")}</g:link></td>
                    
                    <g:if test="${articoloInstance.sottoscorta!=null}">
                        <td><g:checkBox name="sottoscorta" value="${articoloInstance.sottoscorta}"/></td>
                    </g:if>
                    
                    <td><g:link action="show"
                                id="${articoloInstance.id}">${fieldValue(bean: articoloInstance, field: "note")}</g:link></td>
                    
                </tr>
            </g:each>
        </g:else>
        </tbody>
    </table>

    <div class="pagination">
        <g:if test="${usaFilter}">
            <filterpane:paginate total="${articoloInstanceCount}" domainBean="Articolo"/>
            <filterpane:filterButton text="Seleziona un filtro" appliedText="Cambia il filtro"/>
            <filterpane:isNotFiltered>Mostrati tutti i ${articoloInstanceCount} records</filterpane:isNotFiltered>
            <filterpane:isFiltered>Mostrati ${articoloInstanceCount} records su ${articoloInstanceTotal}</filterpane:isFiltered>
        </g:if>
        <g:else>
            <g:paginate total="${articoloInstanceTotal}"/>
        </g:else>
    </div>
    <filterpane:filterPane domain="Articolo"/>

    <g:if test="${usaExport}">
        <div class="buttons">
            <export:formats/>
        </div>
    </g:if>
</div>
</body>
</html>
