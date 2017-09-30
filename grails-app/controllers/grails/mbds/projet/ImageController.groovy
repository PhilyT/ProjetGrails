package grails.mbds.projet

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest

import javax.servlet.http.HttpServletRequest

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest

@Transactional(readOnly = true)
class ImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    ImagePersistenceService imagePersistenceService

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Image.list(params), model:[imageCount: Image.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR', 'ROLE_UTILISATEUR'])
    def show(Image image) {
        respond image
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def create() {
        respond new Image(params)
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def save(Image image) {


        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'create'
            return
        }

        String baseImageName = java.util.UUID.randomUUID().toString()
        def downloadedFile = request.getFile( "productPic" )
        String fileUploaded = imagePersistenceService.uploadFile( downloadedFile, "${baseImageName}.jpg", "localhost/projects/images/" )
        if( fileUploaded ){
            image.nom = "${baseImageName}.jpg"
            image.save flush:true

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                    redirect image
                }
                '*' { respond image, [status: CREATED] }
            }
        }
        else{
            respond view:'create'
            return
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def edit(Image image) {
        respond image
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def update(Image image) {
        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'edit'
            return
        }

        image.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*'{ respond image, [status: OK] }
        }
    }

    @Transactional @Secured(['ROLE_ADMIN','ROLE_MODERATEUR'])
    def delete(Image image) {

        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        image.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
