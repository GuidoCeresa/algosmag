













<%@ page import="it.algos.algosmag.Unita" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'unita.label', default: 'Unita')}" />
    <title><g:message code="unita.show.label" args="[entityName]" default="Mostra"/></title>
</head>
<body>
<a href="#show-unita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="list" action="list"><g:message code="unita.list.label" args="[entityName]" default="Elenco"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="unita.new.label" args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>
<div id="show-unita" class="content scaffold-show" role="main">
    <h1><g:message code="unita.show.label" args="[entityName]" default="Mostra"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list unita">
        
        <g:if test="${unitaInstance?.sigla}">
            <li class="fieldcontain">
                <span id="sigla-label" class="property-label"><g:message code="unita.sigla.label" default="Sigla" /></span>
                
                <span class="property-value" aria-labelledby="sigla-label"><g:fieldValue bean="${unitaInstance}" field="sigla"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${unitaInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="unita.nome.label" default="Nome" /></span>
                
                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${unitaInstance}" field="nome"/></span>
                
            </li>
        </g:if>
        
    </ol>
    <g:form>
        <g:if test="${usaSpostamento}">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${unitaInstance?.id}"/>
                <g:link class="create" action="moveFirst">Primo record</g:link>
                <g:link class="edit" action="movePrec" id="${unitaInstance?.id}">Precedente</g:link>
                <g:link class="edit" action="moveSucc" id="${unitaInstance?.id}">Successivo</g:link>
                <g:link class="create" action="moveLast">Ultimo record</g:link>
            </fieldset>
        </g:if>
    </g:form>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${unitaInstance?.id}" />
            <g:link class="edit" action="edit" id="${unitaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
