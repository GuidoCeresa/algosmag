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

import javax.swing.*

class ArticoloController {

    static allowedMethods = [save: 'POST', update: 'POST', delete: 'POST']

    // utilizzo di un service con la businessLogic per l'elaborazione dei dati
    // il service viene iniettato automaticamente
    def exportService
    def logoService
    def eventoService
    ImportService importService  = new ImportService()

    def index() {
        redirect(action: 'list', params: params)
    } // fine del metodo


    def list(Integer max) {
        params.max = Math.min(max ?: 100, 100)
        ArrayList menuExtra
        ArrayList campiLista
        def lista
        def campoSort

        //--selezione dei menu extra
        //--solo azione e di default controller=questo; classe e titolo vengono uguali
        //--mappa con [cont:'controller', action:'metodo', icon:'iconaImmagine', title:'titoloVisibile']
        menuExtra = ['importa']
        // fine della definizione

        //--selezione delle colonne (campi) visibili nella lista
        //--solo nome e di default il titolo viene uguale
        //--mappa con [campo:'nomeDelCampo', titolo:'titoloVisibile', sort:'ordinamento']
        campiLista = [
                'categoria',
                'codice',
                'nome',
                [campo: 'prezzoAcquisto', titolo: 'Acquisto'],
                [campo: 'prezzoVendita', titolo: 'Vendita'],
                [campo: 'unitaDiMisura', titolo: 'UdM'],
                'quantita',
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

        //--metodo di esportazione dei dati (eventuale)
        export(params)

        //--selezione dei records da mostrare
        //--per una lista filtrata (parziale), modificare i parametri
        //--oppure modificare il findAllByInteroGreaterThan()...
        lista = Articolo.findAll(params)

        //--presentazione della view (list), secondo il modello
        //--menuExtra e campiLista possono essere nulli o vuoti
        //--se campiLista è vuoto, mostra tutti i campi (primi 8)
        render(view: 'list', model: [
                articoloInstanceList: lista,
                articoloInstanceTotal: lista.size(),
                menuExtra: menuExtra,
                campiLista: campiLista],
                params: params)
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
                    records = Articolo.list(params)
                }// fine del blocco if
                if (!fields) {
                    fields = new DefaultGrailsDomainClass(Articolo.class).persistentProperties*.name
                }// fine del blocco if
                parameters = [title: titleReport]
                response.contentType = grailsApplication.config.grails.mime.types[params.format]
                response.setHeader("Content-disposition", "attachment; filename=Articolo.${params.extension}")
                exportService.export((String) params.format, response.outputStream, records, fields, [:], [:], parameters)
            }// fine del blocco if
        }// fine del blocco if
    } // fine del metodo

    def importa() {
        String pathFile = '/Users/Gac/Desktop/Articolo.csv'
        importService.importaDaFile(pathFile)

        //custom title, warning icon
        JOptionPane.showMessageDialog( null,
                "Importa solo file in formato CSV",
                "Inane warning",
                JOptionPane.WARNING_MESSAGE);

        redirect(action: 'list', params: params)

//        render '<input type="file" id="payload" name="payload"/>'
    } // fine del metodo

    def create() {
        [articoloInstance: new Articolo(params)]
    } // fine del metodo

    def save() {
        def articoloInstance = new Articolo(params)

        if (!articoloInstance.save(flush: true)) {
            render(view: 'create', model: [articoloInstance: articoloInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        //--log della registrazione
        if (logoService && eventoService) {
            logoService.setInfo(request, eventoService.getNuovo(), 'Gac')
        }// fine del blocco if

        flash.message = message(code: 'default.created.message', args: [message(code: 'articolo.label', default: 'Articolo'), articoloInstance.id])
        redirect(action: 'show', id: articoloInstance.id)
    } // fine del metodo

    def show(Long id) {
        def articoloInstance = Articolo.get(id)

        if (!articoloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [articoloInstance: articoloInstance]
    } // fine del metodo

    def edit(Long id) {
        def articoloInstance = Articolo.get(id)

        if (!articoloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        [articoloInstance: articoloInstance]
    } // fine del metodo

    def update(Long id, Long version) {
        def articoloInstance = Articolo.get(id)

        if (!articoloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        if (version != null) {
            if (articoloInstance.version > version) {
                articoloInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'articolo.label', default: 'Articolo')] as Object[],
                        "Another user has updated this Articolo while you were editing")
                render(view: 'edit', model: [articoloInstance: articoloInstance])
                return
            }// fine del blocco if e fine anticipata del metodo
        }// fine del blocco if

        articoloInstance.properties = params

        if (!articoloInstance.save(flush: true)) {
            render(view: 'edit', model: [articoloInstance: articoloInstance])
            return
        }// fine del blocco if e fine anticipata del metodo

        flash.message = message(code: 'default.updated.message', args: [message(code: 'articolo.label', default: 'Articolo'), articoloInstance.id])
        redirect(action: 'show', id: articoloInstance.id)
    } // fine del metodo

    def delete(Long id) {
        def articoloInstance = Articolo.get(id)
        if (!articoloInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'list')
            return
        }// fine del blocco if e fine anticipata del metodo

        try {
            articoloInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'list')
        }// fine del blocco try
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'articolo.label', default: 'Articolo'), id])
            redirect(action: 'show', id: id)
        }// fine del blocco catch
    } // fine del metodo

} // fine della controller classe
