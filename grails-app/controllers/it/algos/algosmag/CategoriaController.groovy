/* Created by Algos s.r.l. */
/* Date: mag 2013 */
/* Il plugin Algos ha creato o sovrascritto il templates che ha creato questo file. */
/* L'header del templates serve per controllare le successive release */
/* (tramite il flag di controllo aggiunto) */
/* Tipicamente VERRA sovrascritto (il template, non il file) ad ogni nuova release */
/* del plugin per rimanere aggiornato. */
/* Se vuoi che le prossime release del plugin NON sovrascrivano il template che */
/* genera questo file, perdendo tutte le modifiche precedentemente effettuate, */
/* regola a false il flag di controllo flagOverwrite© del template stesso. */
/* (non quello del singolo file) */
/* flagOverwrite = true */

package it.algos.algosmag

import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClass
import org.springframework.dao.DataIntegrityViolationException

class CategoriaController {

    static allowedMethods = [save: 'POST', update: 'POST', delete: 'POST']

    // utilizzo di un service con la businessLogic per l'elaborazione dei dati
    // il service viene iniettato automaticamente
    def exportService
    def logoService
    def eventoService


    def index() {
        redirect(action: 'list', params: params)
    } // fine del metodo


    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def lista
        def campoSort

        //--selezione delle colonne (campi) visibili nella lista
        //--solo nome e di default il titolo viene uguale
        //--mappa con [campo:'nomeDelCampo', titolo:'titoloVisibile', sort:'ordinamento']
        def campiLista = [
        ]// fine della definizione

        //--regolazione dei campo di ordinamento
        //--regolazione dei parametri di ordinamento
        if (!params.sort) {
            if (campoSort) {
                params.sort = campoSort
            }// fine del blocco if
        }// fine del blocco if-else
        if (params.order) {
            if (params.order == 'asc') {
                params.order = 'desc'
            } else {
                params.order = 'asc'
            }// fine del blocco if-else
        } else {
            params.order = 'asc'
        }// fine del blocco if-else

        //--metodo di esportazione dei dati
        export(params)

        //--selezione dei records da mostrare
        lista = Categoria.findAll(params)

        //--presentazione della view (list), secondo il modello
        render(view: 'list', model: [categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count(), campiLista: campiLista], params: params)
    } // fine del metodo

    //--metodo di esportazione dei dati
    //--funziona SOLO se il flag -usaExport- è true (iniettato e regolato in ExportBootStrap)
    //--se non si regola la variabile -titleReport- non mette nessun titolo al report
    //--se non si regola la variabile -records- esporta tutti i records
    //--se non si regola la variabile -fields- esporta tutti i campi
    def export = {
        String titleReport = new Date()
        def records = null
        List fields = null
        Map parameters

        if (exportService && servletContext.usaExport) {
            if (params?.format && params.format != 'html') {
                if (!records) {
                    records = Categoria.list(params)
                }// fine del blocco if
                if (!fields) {
                    fields = new DefaultGrailsDomainClass(Categoria.class).persistentProperties*.name
                }// fine del blocco if
                parameters = [title: titleReport]
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                response.setHeader("Content-disposition", "attachment; filename=Categoria.${params.extension}")
                exportService.export((String) params.format, response.outputStream, records, fields, [:], [:], parameters)
            }// fine del blocco if
        }// fine del blocco if
    } // fine del metodo

    def create() {
        [categoriaInstance: new Categoria(params)]
    } // fine del metodo

    def save() {
        def categoriaInstance = new Categoria(params)

        if (!categoriaInstance.save(flush: true)) {
            render(view: 'create', model: [categoriaInstance: categoriaInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        //--log della registrazione
        if (logoService && eventoService) {
            logoService.setInfo(request, eventoService.getNuovo(), 'Gac')
        }// fine del blocco if

        flash.message = message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])
        redirect(action: 'show', id: categoriaInstance.id)
    } // fine del metodo

    def show(Long id) {
        def categoriaInstance = Categoria.get(id)

        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [categoriaInstance: categoriaInstance]
    } // fine del metodo

    def edit(Long id) {
        def categoriaInstance = Categoria.get(id)

        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [categoriaInstance: categoriaInstance]
    } // fine del metodo

    def update(Long id, Long version) {
        def categoriaInstance = Categoria.get(id)

        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        if (version != null) {
            if (categoriaInstance.version > version) {
                categoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'categoria.label', default: 'Categoria')] as Object[],
                        "Another user has updated this Categoria while you were editing")
                render(view: 'edit', model: [categoriaInstance: categoriaInstance])
                return
            }// fine del blocco if e fine anticipata del metodo
        }// fine del blocco if

        categoriaInstance.properties = params

        if (!categoriaInstance.save(flush: true)) {
            render(view: 'edit', model: [categoriaInstance: categoriaInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        flash.message = message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])
        redirect(action: 'show', id: categoriaInstance.id)
    } // fine del metodo

    def delete(Long id) {
        def categoriaInstance = Categoria.get(id)
        if (!categoriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        try {
            categoriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'list')
        }// fine del blocco try
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), id])
            redirect(action: 'show', id: id)
        }// fine del blocco catch
    } // fine del metodo

} // fine della controller classe
