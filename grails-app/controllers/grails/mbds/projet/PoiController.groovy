package grails.mbds.projet

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poisCount: Poi.count()]
    }

    def show(Poi pois) {
        respond pois
    }

    def create() {
        respond new Poi(params)
    }

    @Transactional
    def save(Poi pois) {
        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pois.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pois.errors, view:'create'
            return
        }

        pois.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'poi.label', default: 'Poi'), pois.id])
                redirect pois
            }
            '*' { respond pois, [status: CREATED] }
        }
    }

    def edit(Poi pois) {
        respond pois
    }

    @Transactional
    def update(Poi pois) {
        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (pois.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond pois.errors, view:'edit'
            return
        }

        pois.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'poi.label', default: 'Poi'), pois.id])
                redirect pois
            }
            '*'{ respond pois, [status: OK] }
        }
    }

    @Transactional
    def delete(Poi pois) {

        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        pois.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'poi.label', default: 'Poi'), pois.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'poi.label', default: 'Poi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
