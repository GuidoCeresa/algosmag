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

import org.grails.plugins.csv.CSVMapReader

class ImportService {

    def importaDaFile(String pathFile) {
        URLConnection connection
        InputStream input
        InputStreamReader stream

        connection = new URL('file:///' + pathFile).openConnection()
        input = connection.getInputStream();
        stream = new InputStreamReader(input, 'UTF8');

        //assumes the first line of the file has the field names
        new CSVMapReader(stream).each { map ->
            creaRecord((Map) map)
        } // fine del ciclo each
    } // fine del metodo

    def creaRecord(Map mappa) {
        ArrayList fields
        String nomeCampo
        Articolo articolo

        articolo = new Articolo(mappa)
        checkCategoria(articolo, mappa)
        def art = articolo.save(flush: true)
        def stop
//        fields = new DefaultGrailsDomainClass(Articolo.class).persistentProperties*.name
//        if (fields) {
//            articolo = new Articolo()
//            fields?.each {
//                nomeCampo = it
//                if (mappa[nomeCampo]) {
//                    if (!nomeCampo.equals('categoria')) {
//                        articolo."${nomeCampo}" = mappa[nomeCampo]
//                    }// fine del blocco if
//                }// fine del blocco if
//            } // fine del ciclo each
//        }// fine del blocco if
    } // fine del metodo

    def checkCategoria(Articolo articolo, Map mappa) {
        Categoria cat
        String nomeCat

        if (mappa.categoria) {
            nomeCat = mappa.categoria
        }// fine del blocco if

        if (nomeCat) {
            cat = Categoria.findOrCreateByNome(nomeCat).save(flush: true)
        }// fine del blocco if

        if (cat) {
            articolo.categoria = cat
        }// fine del blocco if

//        fields = new DefaultGrailsDomainClass(Articolo.class).persistentProperties*.name
//        if (fields) {
//            articolo = new Articolo()
//            fields?.each {
//                nomeCampo = it
//                if (mappa[nomeCampo]) {
//                    if (!nomeCampo.equals('categoria')) {
//                        articolo."${nomeCampo}" = mappa[nomeCampo]
//                    }// fine del blocco if
//                }// fine del blocco if
//            } // fine del ciclo each
//        }// fine del blocco if
    } // fine del metodo

} // fine della service classe
