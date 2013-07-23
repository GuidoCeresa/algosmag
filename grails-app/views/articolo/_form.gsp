












<%@ page import="it.algos.algosmag.Articolo" %>



<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="articolo.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	










<g:select id="categoria" name="categoria.id" from="${it.algos.algosmag.Categoria.list()}" optionKey="id" required="" value="${articoloInstance?.categoria?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'codice', 'error')} required">
	<label for="codice">
		<g:message code="articolo.codice.label" default="Codice" />
		<span class="required-indicator">*</span>
	</label>
	










<g:textField name="codice" required="" value="${articoloInstance?.codice}"/>
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

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'prezzoAcquisto', 'error')} required">
	<label for="prezzoAcquisto">
		<g:message code="articolo.prezzoAcquisto.label" default="Prezzo Acquisto" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="prezzoAcquisto" type="number" value="${articoloInstance.prezzoAcquisto}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'prezzoVendita', 'error')} required">
	<label for="prezzoVendita">
		<g:message code="articolo.prezzoVendita.label" default="Prezzo Vendita" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="prezzoVendita" type="number" value="${articoloInstance.prezzoVendita}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'unitaDiMisura', 'error')} ">
	<label for="unitaDiMisura">
		<g:message code="articolo.unitaDiMisura.label" default="Unita Di Misura" />
		
	</label>
	










<g:select id="unitaDiMisura" name="unitaDiMisura.id" from="${it.algos.algosmag.Unita.list()}" optionKey="id" value="${articoloInstance?.unitaDiMisura?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'quantita', 'error')} required">
	<label for="quantita">
		<g:message code="articolo.quantita.label" default="Quantita" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="quantita" type="number" value="${articoloInstance.quantita}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: articoloInstance, field: 'scortaMinima', 'error')} required">
	<label for="scortaMinima">
		<g:message code="articolo.scortaMinima.label" default="Scorta Minima" />
		<span class="required-indicator">*</span>
	</label>
	










<g:field name="scortaMinima" type="number" value="${articoloInstance.scortaMinima}" required=""/>
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

