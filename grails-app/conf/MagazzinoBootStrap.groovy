import it.algos.algosmag.Unita

class MagazzinoBootStrap {

    //--metodo invocato direttamente da Grails
    def init = { servletContext ->

        //--creazione dei records base della tavola Unità di Misura
        //--li crea SOLO se non esistono già
        Unita.findOrCreateBySiglaAndNome('ML', 'metri lineari').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('KG', 'chilogrammi').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('CAD', 'cadauno').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('H', 'ore').save(failOnError: true)
    }// fine della closure

    //--metodo invocato direttamente da Grails
    def destroy = {
    }// fine della closure

}// fine della classe di tipo BootStrap
