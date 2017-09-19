package grails.mbds.projet

import grails.gorm.transactions.Transactional

@Transactional
class TestService {

    def serviceMethod() {
        new Groupe(nom: System.currentTimeMillis().toString())
        .addToPois(new Poi(nom: System.currentTimeMillis().toString(), lieu: new Lieu(nom: "Avenue Roumanille", ville: "Biot", codePostal: "06100"), utilisateur: Utilisateur.get(1)))
        .save()

        return "lol"


    }
}
