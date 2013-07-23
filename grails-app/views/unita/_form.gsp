












<%@ page import="it.algos.algosmag.Unita" %>



<div class="fieldcontain ${hasErrors(bean: unitaInstance, field: 'sigla', 'error')} required">
	<label for="sigla">
		<g:message code="unita.sigla.label" default="Sigla" />
		<span class="required-indicator">*</span>
	</label>
	










<g:textField name="sigla" required="" value="${unitaInstance?.sigla}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitaInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="unita.nome.label" default="Nome" />
		
	</label>
	










<g:textField name="nome" value="${unitaInstance?.nome}"/>
</div>

