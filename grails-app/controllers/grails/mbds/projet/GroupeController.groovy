package grails.mbds.projet

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model:[groupeCount: Groupe.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def lieux(Groupe groupe){
        def result = groupe.pois
        JSON.use("deep"){
            render result as JSON
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def show(Groupe groupe) {
        respond groupe
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def create() {
        respond new Groupe(params)
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def save(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'create'
            return
        }

        groupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*' { respond groupe, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def edit(Groupe groupe) {
        respond groupe
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def update(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'edit'
            return
        }

        groupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*'{ respond groupe, [status: OK] }
        }
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def delete(Groupe groupe) {

        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        groupe.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
