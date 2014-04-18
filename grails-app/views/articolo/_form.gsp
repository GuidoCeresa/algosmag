












<%@ page import="it.algos.algosmag.Articolo" %>



<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="articolo.categoria.label" default="Categoria" />
		
	</label>
	










<g:select id="categoria" name="categoria.id" from="${it.algos.algosmag.Categoria.list()}" optionKey="id" value="${articoloInstance?.categoria?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'codice', 'error')} ">
	<label for="codice">
		<g:message code="articolo.codice.label" default="Codice" />
		
	</label>
	










<g:textField name="codice" value="${articoloInstance?.codice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="articolo.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	










<g:textField name="nome" required="" value="${articoloInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'descrizione', 'error')} ">
	<label for="descrizione">
		<g:message code="articolo.descrizione.label" default="Descrizione" />
		
	</label>
	










<g:textArea name="descrizione" cols="40" rows="5" value="${articoloInstance?.descrizione}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'prezzoAcquisto', 'error')} ">
	<label for="prezzoAcquisto">
		<g:message code="articolo.prezzoAcquisto.label" default="Prezzo Acquisto" />
		
	</label>
	










<g:field name="prezzoAcquisto" value="${fieldValue(bean: articoloInstance, field: 'prezzoAcquisto')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'prezzoVendita', 'error')} ">
	<label for="prezzoVendita">
		<g:message code="articolo.prezzoVendita.label" default="Prezzo Vendita" />
		
	</label>
	










<g:field name="prezzoVendita" value="${fieldValue(bean: articoloInstance, field: 'prezzoVendita')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'unitaDiMisura', 'error')} ">
	<label for="unitaDiMisura">
		<g:message code="articolo.unitaDiMisura.label" default="Unita Di Misura" />
		
	</label>
	










<g:select id="unitaDiMisura" name="unitaDiMisura.id" from="${it.algos.algosmag.Unita.list()}" optionKey="id" value="${articoloInstance?.unitaDiMisura?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'quantita', 'error')} ">
	<label for="quantita">
		<g:message code="articolo.quantita.label" default="Quantita" />
		
	</label>
	










<g:field name="quantita" value="${fieldValue(bean: articoloInstance, field: 'quantita')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'scortaMinima', 'error')} ">
	<label for="scortaMinima">
		<g:message code="articolo.scortaMinima.label" default="Scorta Minima" />
		
	</label>
	










<g:field name="scortaMinima" value="${fieldValue(bean: articoloInstance, field: 'scortaMinima')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'sottoscorta', 'error')} ">
	<label for="sottoscorta">
		<g:message code="articolo.sottoscorta.label" default="Sottoscorta" />
		
	</label>
	










<g:checkBox name="sottoscorta" value="${articoloInstance?.sottoscorta}" />
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="articolo.note.label" default="Note" />
		
	</label>
	










<g:textArea name="note" cols="40" rows="5" value="${articoloInstance?.note}"/>
</div>

