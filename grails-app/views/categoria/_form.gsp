












<%@ page import="it.algos.algosmag.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="categoria.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	










<g:textField name="nome" required="" value="${categoriaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'descrizione', 'error')} ">
	<label for="descrizione">
		<g:message code="categoria.descrizione.label" default="Descrizione" />
		
	</label>
	










<g:textArea name="descrizione" cols="40" rows="5" value="${categoriaInstance?.descrizione}"/>
</div>

