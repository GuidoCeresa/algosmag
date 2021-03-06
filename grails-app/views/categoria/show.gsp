













<%@ page import="it.algos.algosmag.Categoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
    <title><g:message code="categoria.show.label" args="[entityName]" default="Mostra"/></title>
</head>
<body>
<a href="#show-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a></li>
        <li><g:link class="list" action="list"><g:message code="categoria.list.label" args="[entityName]" default="Elenco"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="categoria.new.label" args="[entityName]" default="Nuovo"/></g:link></li>
    </ul>
</div>
<div id="show-categoria" class="content scaffold-show" role="main">
    <h1><g:message code="categoria.show.label" args="[entityName]" default="Mostra"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list categoria">
        
        <g:if test="${categoriaInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="categoria.nome.label" default="Nome" /></span>
                
                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${categoriaInstance}" field="nome"/></span>
                
            </li>
        </g:if>
        
        <g:if test="${categoriaInstance?.descrizione}">
            <li class="fieldcontain">
                <span id="descrizione-label" class="property-label"><g:message code="categoria.descrizione.label" default="Descrizione" /></span>
                
                <span class="property-value" aria-labelledby="descrizione-label"><g:fieldValue bean="${categoriaInstance}" field="descrizione"/></span>
                
            </li>
        </g:if>
        
    </ol>
    <g:form>
        <g:if test="${usaSpostamento}">
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${categoriaInstance?.id}"/>
                <g:link class="create" action="moveFirst">Primo record</g:link>
                <g:link class="edit" action="movePrec" id="${categoriaInstance?.id}">Precedente</g:link>
                <g:link class="edit" action="moveSucc" id="${categoriaInstance?.id}">Successivo</g:link>
                <g:link class="create" action="moveLast">Ultimo record</g:link>
            </fieldset>
        </g:if>
    </g:form>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${categoriaInstance?.id}" />
            <g:link class="edit" action="edit" id="${categoriaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
