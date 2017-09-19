package grails

import grails.mbds.projet.Role
import grails.mbds.projet.Utilisateur
import grails.mbds.projet.UtilisateurRole
import grails.mbds.projet.Groupe
import grails.mbds.projet.Lieu

class BootStrap {

    def init = { servletContext ->
        if(Role.count==0){
            def roleAdmin = new Role(authority:"ROLE_ADMIN").save(flush:true, failOnError:true)
            def roleModerateur = new Role(authority:"ROLE_MODERATEUR").save(flush:true, failOnError:true)
            def roleUtilisateur = new Role(authority:"ROLE_UTILISATEUR").save(flush:true, failOnError:true)

            def utilisateur = new Utilisateur(username:"user", password:"0000", name: "Toto", lastName: "Dupont").save(flush:true, failOnError:true)
            def moderateur = new Utilisateur(username:"mod", password:"0000", name: "Titi", lastName: "Piou").save(flush:true, failOnError:true)
            def admin = new Utilisateur(username:"admin", password:"0000", name: "Tata", lastName: "Piou").save(flush:true, failOnError:true)

            UtilisateurRole.create( utilisateur, roleUtilisateur,true)
            UtilisateurRole.create (moderateur, roleModerateur, true)
            UtilisateurRole.create (admin, roleAdmin,true)

            def groupe1 = new Groupe(nom:"Les points d'interets d'Aichatou").save(flush:true, failOnError:true)
            def groupe2 = new Groupe(nom:"Les points d'interets de Tom").save(flush:true, failOnError:true)
            def groupe3 = new Groupe(nom:"Les points d'interets communs").save(flush:true, failOnError:true)

            def lieu1 = new Lieu(nom:"Avenue Roumanille", ville:"Biot", codePostal: "06100")

//            def poi1 = new Poi(nom:"L'ardoise", description: "Restaurant Grill", lieu:lieu1, utilisateur: utilisateur)
//            poi1.addToImages(new Image(nom:"photo7.png"))
//            poi1.addToImages(new Image(nom:"photo20000.png"))
//            groupe2.addToPois(poi1)
//            groupe2.save(flush:true, failOnError:true)

        }
    }
    def destroy = {
    }
}
