class VersioneBootStrap {

    // utilizzo di un service con la businessLogic per l'elaborazione dei dati
    // il service viene iniettato automaticamente
    def versioneService

    //--metodo invocato direttamente da Grails
    //--tutte le aggiunte, modifiche, patch e nuove croci vengono inserite con una versione
    //--l'ordine di inserimento è FONDAMENTALE
    def init = { servletContext ->
        //--prima installazione del programma
        if (versioneService && versioneService.installaVersione(1)) {
            versioneService.newVersione('Applicazione', 'Installazione iniziale')
        }// fine del blocco if
    }// fine della closure

    def destroy = {
    }// fine della closure

}// fine della classe di tipo BootStrap
