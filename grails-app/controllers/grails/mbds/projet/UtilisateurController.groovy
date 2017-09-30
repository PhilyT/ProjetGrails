package grails.mbds.projet

import grails.plugin.springsecurity.annotation.Secured
import grails.util.GrailsUtil

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UtilisateurController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def index(Integer max) {

        println springSecurityService.getCurrentUser()
        params.max = Math.min(max ?: 10, 100)
        respond Utilisateur.list(params), model:[utilisateurCount: Utilisateur.count()]



    }


    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def show(Utilisateur utilisateur) {

        if(!springSecurityService.getAuthentication().getAuthorities()[0].toString().equals("ROLE_UTILISATEUR") || utilisateur.getId()==springSecurityService.getCurrentUserId()) {

            respond utilisateur
        }
        else{
            redirect(action: "notFound")
        }
    }
    def showPostPage(){
        def currentLoggedInUser = springSecurityService.getCurrentUser();

        render currentLoggedInUser
    }
    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new Utilisateur(params)
    }

    @Transactional
    def save(Utilisateur utilisateur) {
        utilisateur.password = springSecurityService.encodePassword(params.password, utilisateur.username)
        if (!utilisateur.save(flush: true)) {
            render view: 'create', model: [utilisateurInstance: utilisateur]
            return
        }

        flash.message = "The user was created"
        redirect action: "show", id: utilisateur.id
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def edit(Utilisateur utilisateur) {

        if(springSecurityService.getAuthentication().getAuthorities()[0].toString().equals("ROLE_ADMIN") )
            respond utilisateur
        else if(springSecurityService.getAuthentication().getAuthorities()[0].toString().equals("ROLE_MODERATEUR")){
                    if(utilisateur.getAuthorities()[0].authority.equals("ROLE_UTILISATEUR")){

                        respond utilisateur
                    }
                    else if(utilisateur.getId()==springSecurityService.getCurrentUserId()){
                        respond utilisateur
                    }

                    else
                        redirect(action: "notFound")

        }
        else if(springSecurityService.getAuthentication().getAuthorities()[0].authority.equals("ROLE_UTILISATEUR")){
                if(utilisateur.getId()==springSecurityService.getCurrentUserId()){
                    respond utilisateur
                }
            else
                    redirect(action: "notFound")
        }


    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])

    def update(Utilisateur utilisateur) {

        if (params.password) {
            params.password = springSecurityService.encodePassword(params.password, utilisateur.username)
        }
        if (!utilisateur.save(flush: true)) {
            render view: 'edit', model: [utilisateurInstance: utilisateur]
            return
        }
        if (springSecurityService.loggedIn && springSecurityService.principal.username == utilisateur.username) {
            springSecurityService.reauthenticate utilisateur.username
        }

        flash.message = "The user was updated"
        redirect (action:"show", id:utilisateur.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Utilisateur utilisateur) {

        if (utilisateur == null) {

            flash.message = "the user not exist"
            redirect (action:"notFound")
            return
        }
        else {
            for(Role role :utilisateur.getAuthorities()){
                springSecurityService.deleteRole role

            }

            utilisateur.delete flush:true
            flash.message = "The user was deleted"
            redirect (action:"index")

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
