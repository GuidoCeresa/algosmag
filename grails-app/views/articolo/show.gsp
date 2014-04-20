













<%@ page import="it.algos.algosmag.Articolo" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'articolo.label', default: 'Articolo')}" />
    <title><g:message code="articolo.show.label" args="[entityName]" default="Mostra"/></title>
</head>
<body>
<a href="#show-articolo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="list" action="list"><g:message code="articolo.list.label" args="[entityName]" default="Elenco"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="articolo.new.label" args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>
<div id="show-articolo" class="content scaffold-show" role="main">
    <h1><g:message code="articolo.show.label" args="[entityName]" default="Mostra"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list articolo">
        
        <g:if test="${articoloInstance?.categoria}">
            <li class="fieldcontain">
                <span id="categoria-label" class="property-label"><g:message code="articolo.categoria.label" default="Categoria" /></span>
                
                <span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoria" action="show" id="${articoloInstance?.categoria?.id}">${articoloInstance?.categoria?.encodeAsHTML()}</g:link></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.codice}">
            <li class="fieldcontain">
                <span id="codice-label" class="property-label"><g:message code="articolo.codice.label" default="Codice" /></span>
                
                <span class="property-value" aria-labelledby="codice-label"><g:fieldValue bean="${articoloInstance}" field="codice"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="articolo.nome.label" default="Nome" /></span>
                
                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${articoloInstance}" field="nome"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.descrizione}">
            <li class="fieldcontain">
                <span id="descrizione-label" class="property-label"><g:message code="articolo.descrizione.label" default="Descrizione" /></span>
                
                <span class="property-value" aria-labelledby="descrizione-label"><g:fieldValue bean="${articoloInstance}" field="descrizione"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.prezzoAcquisto}">
            <li class="fieldcontain">
                <span id="prezzoAcquisto-label" class="property-label"><g:message code="articolo.prezzoAcquisto.label" default="Prezzo Acquisto" /></span>
                
                <span class="property-value" aria-labelledby="prezzoAcquisto-label"><g:fieldValue bean="${articoloInstance}" field="prezzoAcquisto"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.prezzoVendita}">
            <li class="fieldcontain">
                <span id="prezzoVendita-label" class="property-label"><g:message code="articolo.prezzoVendita.label" default="Prezzo Vendita" /></span>
                
                <span class="property-value" aria-labelledby="prezzoVendita-label"><g:fieldValue bean="${articoloInstance}" field="prezzoVendita"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.unitaDiMisura}">
            <li class="fieldcontain">
                <span id="unitaDiMisura-label" class="property-label"><g:message code="articolo.unitaDiMisura.label" default="Unita Di Misura" /></span>
                
                <span class="property-value" aria-labelledby="unitaDiMisura-label"><g:link controller="unita" action="show" id="${articoloInstance?.unitaDiMisura?.id}">${articoloInstance?.unitaDiMisura?.encodeAsHTML()}</g:link></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.quantita}">
            <li class="fieldcontain">
                <span id="quantita-label" class="property-label"><g:message code="articolo.quantita.label" default="Quantita" /></span>
                
                <span class="property-value" aria-labelledby="quantita-label"><g:fieldValue bean="${articoloInstance}" field="quantita"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.scortaMinima}">
            <li class="fieldcontain">
                <span id="scortaMinima-label" class="property-label"><g:message code="articolo.scortaMinima.label" default="Scorta Minima" /></span>
                
                <span class="property-value" aria-labelledby="scortaMinima-label"><g:fieldValue bean="${articoloInstance}" field="scortaMinima"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.sottoscorta}">
            <li class="fieldcontain">
                <span id="sottoscorta-label" class="property-label"><g:message code="articolo.sottoscorta.label" default="Sottoscorta" /></span>
                
                <span class="property-value" aria-labelledby="sottoscorta-label"><g:formatBoolean boolean="${articoloInstance?.sottoscorta}" /></span>
                
            </li>
        </g:if>
        
        <g:if test="${articoloInstance?.note}">
            <li class="fieldcontain">
                <span id="note-label" class="property-label"><g:message code="articolo.note.label" default="Note" /></span>
                
                <span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${articoloInstance}" field="note"/></span>
                
            </li>
        </g:if>
        
    </ol>
    <g:form>
        <g:if test="${usaSpostamento}">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${articoloInstance?.id}"/>
                <g:link class="create" action="moveFirst">Primo record</g:link>
                <g:link class="edit" action="movePrec" id="${articoloInstance?.id}">Precedente</g:link>
                <g:link class="edit" action="moveSucc" id="${articoloInstance?.id}">Successivo</g:link>
                <g:link class="create" action="moveLast">Ultimo record</g:link>
            </fieldset>
        </g:if>
    </g:form>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${articoloInstance?.id}" />
            <g:link class="edit" action="edit" id="${articoloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
