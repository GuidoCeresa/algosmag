/* Created by Algos s.r.l. */
/* Date: mag 2013 */
/* Il plugin Algos ha inserito (solo la prima volta) questo header per controllare */
/* le successive release (tramite il flag di controllo aggiunto) */
/* Tipicamente VERRA sovrascritto ad ogni nuova release del plugin */
/* per rimanere aggiornato */
/* Se vuoi che le prossime release del plugin NON sovrascrivano questo file, */
/* perdendo tutte le modifiche precedentemente effettuate, */
/* regola a false il flag di controllo flagOverwrite© */
/* flagOverwrite = true */

package it.algos.algosmag



import org.junit.*
import grails.test.mixin.*

@TestFor(ArticoloController)
@Mock(Articolo)
class ArticoloControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/articolo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.articoloInstanceList.size() == 0
        assert model.articoloInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.articoloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.articoloInstance != null
        assert view == '/articolo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/articolo/show/1'
        assert controller.flash.message != null
        assert Articolo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/articolo/list'

        populateValidParams(params)
        def articolo = new Articolo(params)

        assert articolo.save() != null

        params.id = articolo.id

        def model = controller.show()

        assert model.articoloInstance == articolo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/articolo/list'

        populateValidParams(params)
        def articolo = new Articolo(params)

        assert articolo.save() != null

        params.id = articolo.id

        def model = controller.edit()

        assert model.articoloInstance == articolo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/articolo/list'

        response.reset()

        populateValidParams(params)
        def articolo = new Articolo(params)

        assert articolo.save() != null

        // test invalid parameters in update
        params.id = articolo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/articolo/edit"
        assert model.articoloInstance != null

        articolo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/articolo/show/$articolo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        articolo.clearErrors()

        populateValidParams(params)
        params.id = articolo.id
        params.version = -1
        controller.update()

        assert view == "/articolo/edit"
        assert model.articoloInstance != null
        assert model.articoloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/articolo/list'

        response.reset()

        populateValidParams(params)
        def articolo = new Articolo(params)

        assert articolo.save() != null
        assert Articolo.count() == 1

        params.id = articolo.id

        controller.delete()

        assert Articolo.count() == 0
        assert Articolo.get(articolo.id) == null
        assert response.redirectedUrl == '/articolo/list'
    }
}
