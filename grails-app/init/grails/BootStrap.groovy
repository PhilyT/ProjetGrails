package grails

import grails.mbds.projet.Role
import grails.mbds.projet.Utilisateur
import grails.mbds.projet.UtilisateurRole
import grails.mbds.projet.Groupe
import grails.mbds.projet.Lieu
import grails.mbds.projet.Poi
import grails.mbds.projet.Image


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
            groupe1.addToImages(new Image(nom:"photo1.png"))
            groupe1.addToImages(new Image(nom:"photo2.png"))
            groupe2.addToImages(new Image(nom:"photo3.png"))
            groupe2.addToImages(new Image(nom:"photo4.png"))
            groupe3.addToImages(new Image(nom:"photo5.png"))
            groupe3.addToImages(new Image(nom:"photo6.png"))

            def lieu1 = new Lieu(nom:"Avenue Roumanille", ville:"Biot", codePostal: "06100")
            def poi1 = new Poi(nom:"L'ardoise", description: "Restaurant Grill", lieu:lieu1, utilisateur: moderateur)
            poi1.addToImages(new Image(nom:"photo7.png"))
            poi1.addToImages(new Image(nom:"photo8.png"))
            def lieu2 = new Lieu(nom:"Place machin", ville:"Valbonne", codePostal: "06500")
            def poi2 = new Poi(nom:"Mister Pizza", description: "Pizzeria", lieu:lieu2, utilisateur: moderateur)
            poi2.addToImages(new Image(nom:"photo9.png"))
            poi2.addToImages(new Image(nom:"photo10.png"))
            def lieu3 = new Lieu(nom:"Cour Saleya", ville:"Nice", codePostal: "06000")
            def poi3 = new Poi(nom:"Planet Sushi", description: "Restaurant Japonais", lieu:lieu3, utilisateur: moderateur)
            poi3.addToImages(new Image(nom:"photo11.png"))
            poi3.addToImages(new Image(nom:"photo12.png"))
            def lieu4 = new Lieu(nom:"Valrose", ville:"Nice", codePostal: "06000")
            def poi4 = new Poi(nom:"Pizzeria Athena", description: "Pizzeria", lieu:lieu4, utilisateur: moderateur)
            poi4.addToImages(new Image(nom:"photo13.png"))
            poi4.addToImages(new Image(nom:"photo14.png"))
            def lieu5 = new Lieu(nom:"Rond Point", ville:"Antibes", codePostal: "06000")
            def poi5 = new Poi(nom:"Burger King", description: "Restaurant Grill", lieu:lieu5, utilisateur: moderateur)
            poi5.addToImages(new Image(nom:"photo15.png"))
            poi5.addToImages(new Image(nom:"photo16.png"))


            groupe2.addToPois(poi1)
            groupe2.addToPois(poi2)
            groupe2.addToPois(poi3)
            groupe2.addToPois(poi4)
            groupe2.addToPois(poi5)
            groupe2.save(flush:true, failOnError:true)

        }
    }
    def destroy = {
    }
}
