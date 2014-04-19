import it.algos.algosmag.Unita

class MagazzinoBootStrap {

    //--metodo invocato direttamente da Grails
    def init = { servletContext ->

        //--creazione dei records base della tavola Unità di Misura
        //--li crea SOLO se non esistono già
        Unita.findOrCreateBySiglaAndNome('m', 'metri lineari').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('kg', 'chilogrammi').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('cad', 'cadauno').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('l', 'litri').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('h', 'ore').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('forfait', 'a corpo').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('conf', 'confezione').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('cartone', 'cartone').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('scatola', 'scatola').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('latta', 'latta').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('sacco', 'sacco').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('blister', 'blister').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('pezzo', 'pezzo').save(failOnError: true)
        Unita.findOrCreateBySiglaAndNome('pallet', 'pallet').save(failOnError: true)
    }// fine della closure

    //--metodo invocato direttamente da Grails
    def destroy = {
    }// fine della closure

}// fine della classe di tipo BootStrap
