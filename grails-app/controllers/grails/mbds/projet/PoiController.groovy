package grails.mbds.projet

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoiController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR','ROLE_UTILISATEUR'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Poi.list(params), model:[poisCount: Poi.count()]
    }
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR','ROLE_UTILISATEUR'])
    def show(Poi pois) {
        respond pois
    }
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def create() {

        respond new Poi(params)
    }
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def lieu(Poi poi){
        JSON.use("deep"){
            render poi as JSON
        }
    }
    @Transactional
    def save(Poi pois) {
        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (pois.hasErrors()) {
            render view: 'create', model: [poisInstance: pois]
            return
        }
        pois.save flush:true
        flash.message = "POI was created"
        redirect (action: "index")


    }
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def edit(Poi pois) {
        respond pois
    }

    @Transactional
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
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
    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def delete(Poi pois) {

        if (pois == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        pois.groupes.each {it.removeFromPois(pois)}
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
