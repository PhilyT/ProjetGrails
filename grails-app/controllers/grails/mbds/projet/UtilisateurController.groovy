package grails.mbds.projet

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UtilisateurController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def index(Integer max) {
        println "lal"
        println springSecurityService.getCurrentUser()
        params.max = Math.min(max ?: 10, 100)
        respond Utilisateur.list(params), model:[utilisateurCount: Utilisateur.count()]
    }


    @Secured(['permitAll'])
    def show(Utilisateur utilisateur) {

        if(utilisateur.getId()==springSecurityService.getCurrentUserId()) {
            println(springSecurityService.getCurrentUserId())
            respond utilisateur
        }
    }
    def showPostPage(){
        def currentLoggedInUser = springSecurityService.getCurrentUser();
        //[currentLoggedInUser:currentLoggedInUser]
        render currentLoggedInUser
    }
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def create() {
        respond new Utilisateur(params)
    }

    @Transactional
    def save(Utilisateur utilisateur) {
        if (utilisateur == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (utilisateur.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond utilisateur.errors, view:'create'
            return
        }

        utilisateur.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateur.id])
                redirect utilisateur
            }
            '*' { respond utilisateur, [status: CREATED] }
        }
    }
    @Secured(['permitAll'])
    def edit(Utilisateur utilisateur) {
        respond utilisateur
    }

    @Transactional
    @Secured(['permitAll'])
    def update(Utilisateur utilisateur) {
        if (utilisateur == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (utilisateur.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond utilisateur.errors, view:'edit'
            return
        }

        utilisateur.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateur.id])
                redirect utilisateur
            }
            '*'{ respond utilisateur, [status: OK] }
        }
    }

    @Transactional
    @Secured(['ROLE_ADMIN'])
    def delete(Utilisateur utilisateur) {

        if (utilisateur == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        utilisateur.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), utilisateur.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'utilisateur.label', default: 'Utilisateur'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
