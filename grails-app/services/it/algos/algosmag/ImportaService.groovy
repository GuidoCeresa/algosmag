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

class ImportaService {

    //assumes the first line of the file has the field names
    def importaDaFile(String pathFile) {
        URLConnection connection
        InputStream input
        InputStreamReader stream

        connection = new URL('file:///' + pathFile).openConnection()
        input = connection.getInputStream()
        stream = new InputStreamReader(input, 'UTF8')
        new CSVMapReader(stream).each { map ->
            creaArticoli((Map) map)
        } // fine del ciclo each
        stream.close()
        input.close()
    } // fine del metodo

    def creaArticoli(Map mappa) {
        Articolo articolo
        String prezzoAcquistoTxt
        int prezzoAcquisto
        String prezzoVenditaTxt
        int prezzoVendita
        String quantitaTxt
        int quantita
        String scortaMinimaTxt
        int scortaMinima

        articolo = new Articolo()
        articolo.categoria = findCategoria(mappa)
        if (mappa.codice) {
            articolo.codice = mappa.codice
        }// fine del blocco if
        if (mappa.nome) {
            articolo.nome = mappa.nome
        }// fine del blocco if
        if (mappa.descrizione) {
            articolo.descrizione = mappa.descrizione
        }// fine del blocco if
        if (mappa.prezzoAcquisto) {
            prezzoAcquistoTxt = mappa.prezzoAcquisto
            prezzoAcquisto = Integer.decode(prezzoAcquistoTxt)
            articolo.prezzoAcquisto = prezzoAcquisto
        }// fine del blocco if
        if (mappa.prezzoVendita) {
            prezzoVenditaTxt = mappa.prezzoVendita
            prezzoVendita = Integer.decode(prezzoVenditaTxt)
            articolo.prezzoVendita = prezzoVendita
        }// fine del blocco if
        articolo.unitaDiMisura = findUnita(mappa)
        if (mappa.quantita) {
            quantitaTxt = mappa.quantita
            quantita = Integer.decode(quantitaTxt)
            articolo.quantita = quantita
        }// fine del blocco if
        if (mappa.scortaMinima) {
            scortaMinimaTxt = mappa.scortaMinima
            scortaMinima = Integer.decode(scortaMinimaTxt)
            articolo.scortaMinima = scortaMinima
        }// fine del blocco if
        if (mappa.sottoscorta) {
            if (mappa.sottoscorta.equals('true')) {
                articolo.sottoscorta = true
            } else {
                articolo.sottoscorta = false
            }// fine del blocco if-else
        }// fine del blocco if
        if (mappa.note) {
            articolo.note = mappa.note
        }// fine del blocco if
        def regisyto = articolo.save(flush: true)
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

    def Categoria findCategoria(Map mappa) {
        Categoria categoria = null
        String nomeCat

        if (mappa.categoria) {
            nomeCat = mappa.categoria
        }// fine del blocco if

        if (nomeCat) {
            categoria = Categoria.findOrCreateByNome(nomeCat)
            categoria.save(flush: true)
        }// fine del blocco if

        return categoria
    } // fine del metodo

    def Unita findUnita(Map mappa) {
        Unita unita = null
        String siglaUni

        if (mappa.unitaDiMisura) {
            siglaUni = mappa.unitaDiMisura
        }// fine del blocco if

        if (siglaUni) {
            unita = Unita.findOrCreateBySigla(siglaUni)
            unita.save(flush: true)
        }// fine del blocco if

        return unita
    } // fine del metodo


} // fine della service classe
