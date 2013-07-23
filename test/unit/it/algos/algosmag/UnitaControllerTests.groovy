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

@TestFor(UnitaController)
@Mock(Unita)
class UnitaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/unita/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.unitaInstanceList.size() == 0
        assert model.unitaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.unitaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.unitaInstance != null
        assert view == '/unita/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/unita/show/1'
        assert controller.flash.message != null
        assert Unita.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/unita/list'

        populateValidParams(params)
        def unita = new Unita(params)

        assert unita.save() != null

        params.id = unita.id

        def model = controller.show()

        assert model.unitaInstance == unita
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/unita/list'

        populateValidParams(params)
        def unita = new Unita(params)

        assert unita.save() != null

        params.id = unita.id

        def model = controller.edit()

        assert model.unitaInstance == unita
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/unita/list'

        response.reset()

        populateValidParams(params)
        def unita = new Unita(params)

        assert unita.save() != null

        // test invalid parameters in update
        params.id = unita.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/unita/edit"
        assert model.unitaInstance != null

        unita.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/unita/show/$unita.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        unita.clearErrors()

        populateValidParams(params)
        params.id = unita.id
        params.version = -1
        controller.update()

        assert view == "/unita/edit"
        assert model.unitaInstance != null
        assert model.unitaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/unita/list'

        response.reset()

        populateValidParams(params)
        def unita = new Unita(params)

        assert unita.save() != null
        assert Unita.count() == 1

        params.id = unita.id

        controller.delete()

        assert Unita.count() == 0
        assert Unita.get(unita.id) == null
        assert response.redirectedUrl == '/unita/list'
    }
}
