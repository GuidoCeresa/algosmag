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
        BigDecimal prezzoAcquisto
        String prezzoVenditaTxt
        BigDecimal prezzoVendita
        String quantitaTxt
        BigDecimal quantita
        String scortaMinimaTxt
        BigDecimal scortaMinima

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
            try { // prova ad eseguire il codice
                prezzoAcquisto = new BigDecimal(prezzoAcquistoTxt)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (prezzoAcquisto) {
                articolo.prezzoAcquisto = prezzoAcquisto
            }// fine del blocco if
        }// fine del blocco if
        if (mappa.prezzoVendita) {
            prezzoVenditaTxt = mappa.prezzoVendita
            try { // prova ad eseguire il codice
                prezzoVendita = new BigDecimal(prezzoVenditaTxt)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (prezzoVendita) {
                articolo.prezzoVendita = prezzoVendita
            }// fine del blocco if
        }// fine del blocco if
        articolo.unitaDiMisura = findUnita(mappa)
        if (mappa.quantita) {
            quantitaTxt = mappa.quantita
            try { // prova ad eseguire il codice
                quantita = new BigDecimal(quantitaTxt)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (quantita) {
                articolo.quantita = quantita
            }// fine del blocco if
        }// fine del blocco if
        if (mappa.scortaMinima) {
            scortaMinimaTxt = mappa.scortaMinima
            try { // prova ad eseguire il codice
                scortaMinima = new BigDecimal(scortaMinimaTxt)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (scortaMinima) {
                articolo.scortaMinima = scortaMinima
            }// fine del blocco if
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

        //patch
        if (!articolo.codice && articolo.nome && articolo.nome.size() > 2) {
            articolo.codice = articolo.nome.substring(0, 3)
        }// fine del blocco if

        try { // prova ad eseguire il codice
            def regisyto = articolo.save(flush: true)
        } catch (Exception unErrore) { // intercetta l'errore
            log.error unErrore
        }// fine del blocco try-catch
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
            try { // prova ad eseguire il codice
                categoria = Categoria.findByNome(nomeCat)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (!categoria) {
                new Categoria(nome: nomeCat).save(flush: true)
            }// fine del blocco if
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
            try { // prova ad eseguire il codice
                unita = Unita.findBySigla(siglaUni)
            } catch (Exception unErrore) { // intercetta l'errore
                log.error unErrore
            }// fine del blocco try-catch
            if (!unita) {
                new Unita(sigla: siglaUni).save(flush: true)
            }// fine del blocco if
        }// fine del blocco if

        return unita
    } // fine del metodo


} // fine della service classe
