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
            def administrateur = new Utilisateur(username:"admin", password:"0000", name: "Tata", lastName: "Piou").save(flush:true, failOnError:true)

            UtilisateurRole.create( utilisateur, roleUtilisateur,true)
            UtilisateurRole.create (moderateur, roleModerateur, true)
            UtilisateurRole.create (administrateur, roleAdmin,true)

            def groupe1 = new Groupe(nom:"Les points d'interets d'Aichatou").save(flush:true, failOnError:true)
            def groupe2 = new Groupe(nom:"Les points d'interets de Tom").save(flush:true, failOnError:true)
            def groupe3 = new Groupe(nom:"Les points d'interets communs").save(flush:true, failOnError:true)
            groupe1.addToImages(new Image(nom:"photo1.jpg"))
            groupe1.addToImages(new Image(nom:"photo2.jpg"))
            groupe2.addToImages(new Image(nom:"photo3.jpg"))
            groupe2.addToImages(new Image(nom:"photo4.jpg"))
            groupe3.addToImages(new Image(nom:"photo5.jpg"))
            groupe3.addToImages(new Image(nom:"photo6.jpg"))

            def lieu1 = new Lieu(nom:"Avenue Roumanille", ville:"Biot", codePostal: "06410", posX: "43.617955" , posY: "7.066923")
            def poi1 = new Poi(nom:"L'ardoise", description: "Restaurant Grill", lieu:lieu1, utilisateur: moderateur)
            poi1.addToImages(new Image(nom:"photo7.jpg"))
            poi1.addToImages(new Image(nom:"photo8.jpg"))
            def lieu2 = new Lieu(nom:"Rue Henrie Bosco", ville:"Valbonne", codePostal: "06560", posX: "43.622369"  , posY: "7.040392")
            def poi2 = new Poi(nom:"Mister Pizza", description: "Pizzeria", lieu:lieu2, utilisateur: moderateur)
            poi2.addToImages(new Image(nom:"photo9.jpg"))
            poi2.addToImages(new Image(nom:"photo10.jpg"))
            def lieu3 = new Lieu(nom:"Boulevard Jean Jaures", ville:"Nice", codePostal: "06300", posX: "43.697707"   , posY: "7.275092")
            def poi3 = new Poi(nom:"Planet Sushi", description: "Restaurant Japonais", lieu:lieu3, utilisateur: moderateur)
            poi3.addToImages(new Image(nom:"photo11.jpg"))
            poi3.addToImages(new Image(nom:"photo12.jpg"))
            def lieu4 = new Lieu(nom:"Valrose", ville:"Nice", codePostal: "06100", posX: "43.7153914", posY: "7.261485300000004")
            def poi4 = new Poi(nom:"Pizzeria Athena", description: "Pizzeria", lieu:lieu4, utilisateur: moderateur)
            poi4.addToImages(new Image(nom:"photo13.jpg"))
            poi4.addToImages(new Image(nom:"photo14.jpg"))
            def lieu5 = new Lieu(nom:"Angle Route De Grasse", ville:"Antibes", codePostal: "06600", posX: "43.599179"   , posY: "7.085624")
            def poi5 = new Poi(nom:"Burger King", description: "Restaurant Grill", lieu:lieu5, utilisateur: moderateur)
            poi5.addToImages(new Image(nom:"photo15.jpg"))
            poi5.addToImages(new Image(nom:"photo16.jpg"))
            def lieu6=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7052351" , posY: "7.265309699999989")
            def poi6=new Poi(nom:"KFC", description: "Restaurant poulet", lieu:lieu6, utilisateur: administrateur)
            def lieu7=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7040985" , posY: "7.266089100000045")
            def poi7=new Poi(nom:"cine", description: "cine PATHE", lieu:lieu7, utilisateur: administrateur)
            def lieu8=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7041726" , posY: "7.265924400000017")
            def poi8=new Poi(nom:"HM", description: "magasin de vetements", lieu:lieu8, utilisateur: administrateur)
            def lieu9=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.702069" , posY: "7.267177")
            def poi9=new Poi(nom:"fast food", description: "cine KEBAB", lieu:lieu9, utilisateur: administrateur)
            def lieu10=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.702069" , posY: "7.267177")
            def poi10=new Poi(nom:"parc", description: "jardin", lieu:lieu10, utilisateur: administrateur)
            def lieu11=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7018852" , posY: "7.26692909999997")
            def poi11=new Poi(nom:"ciné2", description: "cine PATHE", lieu:lieu11, utilisateur: administrateur)
            def lieu12=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.6988709" , posY: "7.269808799999964")
            def poi12=new Poi(nom:"gallerie la fayette", description: "magasin de vetements", lieu:lieu12, utilisateur: administrateur)
            def lieu13=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7032735" , posY: "7.266600499999981")
            def poi13=new Poi(nom:"fnac", description: "magasin d'accessoir", lieu:lieu13, utilisateur: administrateur)
            def lieu14=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.702069" , posY: "7.267177")
            def poi14=new Poi(nom:"KW", description: "magasin de vetement et chaussures", lieu:lieu14, utilisateur: administrateur)
            def lieu15=new Lieu(nom:"Jean Medecin", ville:"Nice", codePostal: "06000", posX: "43.7001692" , posY: "7.268467200000032")
            def poi15=new Poi(nom:"MCDONALD", description: "fast food", lieu:lieu15, utilisateur: administrateur)


            groupe2.addToPois(poi1)
            groupe2.addToPois(poi2)
            groupe2.addToPois(poi3)
            groupe2.addToPois(poi4)
            groupe2.addToPois(poi5)
            groupe2.save(flush:true, failOnError:true)


            groupe1.addToPois(poi6)
            groupe1.addToPois(poi7)
            groupe1.addToPois(poi8)
            groupe1.addToPois(poi9)
            groupe1.addToPois(poi10)
            groupe1.save(flush:true, failOnError:true)

            groupe3.addToPois(poi11)
            groupe3.addToPois(poi12)
            groupe3.addToPois(poi13)
            groupe3.addToPois(poi14)
            groupe3.addToPois(poi15)
            groupe3.save(flush:true, failOnError:true)

        }
    }
    def destroy = {
    }
}
