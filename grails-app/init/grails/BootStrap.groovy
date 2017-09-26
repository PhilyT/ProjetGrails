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
            groupe1.addToImages(new Image(nom:"photo1.jpg"))
            groupe1.addToImages(new Image(nom:"photo2.jpg"))
            groupe2.addToImages(new Image(nom:"photo3.jpg"))
            groupe2.addToImages(new Image(nom:"photo4.jpg"))
            groupe3.addToImages(new Image(nom:"photo5.jpg"))
            groupe3.addToImages(new Image(nom:"photo6.jpg"))

            def lieu1 = new Lieu(nom:"Avenue Roumanille", ville:"Biot", codePostal: "06410", posX: 43.617955 , posY: 7.066923)
            def poi1 = new Poi(nom:"L'ardoise", description: "Restaurant Grill", lieu:lieu1, utilisateur: moderateur)
            poi1.addToImages(new Image(nom:"photo7.jpg"))
            poi1.addToImages(new Image(nom:"photo8.jpg"))
            def lieu2 = new Lieu(nom:"Rue Henrie Bosco", ville:"Valbonne", codePostal: "06560", posX: 43.622369  , posY: 7.040392)
            def poi2 = new Poi(nom:"Mister Pizza", description: "Pizzeria", lieu:lieu2, utilisateur: moderateur)
            poi2.addToImages(new Image(nom:"photo9.jpg"))
            poi2.addToImages(new Image(nom:"photo10.jpg"))
            def lieu3 = new Lieu(nom:"Boulevard Jean Jaures", ville:"Nice", codePostal: "06300", posX: 43.697707   , posY: 7.275092)
            def poi3 = new Poi(nom:"Planet Sushi", description: "Restaurant Japonais", lieu:lieu3, utilisateur: moderateur)
            poi3.addToImages(new Image(nom:"photo11.jpg"))
            poi3.addToImages(new Image(nom:"photo12.jpg"))
            def lieu4 = new Lieu(nom:"Valrose", ville:"Nice", codePostal: "06100", posX: 43.7153914, posY: 7.261485300000004)
            def poi4 = new Poi(nom:"Pizzeria Athena", description: "Pizzeria", lieu:lieu4, utilisateur: moderateur)
            poi4.addToImages(new Image(nom:"photo13.jpg"))
            poi4.addToImages(new Image(nom:"photo14.jpg"))
            def lieu5 = new Lieu(nom:"Angle Route De Grasse", ville:"Antibes", codePostal: "06600", posX: 43.599179   , posY: 7.085624)
            def poi5 = new Poi(nom:"Burger King", description: "Restaurant Grill", lieu:lieu5, utilisateur: moderateur)
            poi5.addToImages(new Image(nom:"photo15.jpg"))
            poi5.addToImages(new Image(nom:"photo16.jpg"))


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
