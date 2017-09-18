package grails.mbds.projet

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LieuController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lieu.list(params), model:[lieuCount: Lieu.count()]
    }

    def show(Lieu lieu) {
        respond lieu
    }

    def create() {
        respond new Lieu(params)
    }

    @Transactional
    def save(Lieu lieu) {
        if (lieu == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (lieu.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond lieu.errors, view:'create'
            return
        }

        lieu.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lieu.label', default: 'Lieu'), lieu.id])
                redirect lieu
            }
            '*' { respond lieu, [status: CREATED] }
        }
    }

    def edit(Lieu lieu) {
        respond lieu
    }

    @Transactional
    def update(Lieu lieu) {
        if (lieu == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (lieu.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond lieu.errors, view:'edit'
            return
        }

        lieu.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'lieu.label', default: 'Lieu'), lieu.id])
                redirect lieu
            }
            '*'{ respond lieu, [status: OK] }
        }
    }

    @Transactional
    def delete(Lieu lieu) {

        if (lieu == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        lieu.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'lieu.label', default: 'Lieu'), lieu.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lieu.label', default: 'Lieu'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
