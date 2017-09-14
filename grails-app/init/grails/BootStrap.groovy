package grails

import grails.mbds.projet.Role
import grails.mbds.projet.Utilisateur
import grails.mbds.projet.UtilisateurRole

class BootStrap {

    def init = { servletContext ->
        if(Role.count==0){
            def roleAdmin = new Role(authority:"ROLE_ADMIN").save(flush:true, failError:true)
            def roleModerateur = new Role(authority:"ROLE_MODERATEUR").save(flush:true, failError:true)
            def roleUtilisateur = new Role(authority:"ROLE_UTILISATEUR").save(flush:true, failError:true)

            def utilisateur = new Utilisateur(username:"user", password:"0000").save(flush:true, failError:true)
            def moderateur = new Utilisateur(username:"mod", password:"0000").save(flush:true, failError:true)
            def admin = new Utilisateur(username:"admin", password:"0000").save(flush:true, failError:true)

            UtilisateurRole.create( utilisateur, roleUtilisateur, true)
            UtilisateurRole.create (moderateur, roleModerateur, true)
            UtilisateurRole.create (admin, roleAdmin,true)
        }
    }
    def destroy = {
    }
}
