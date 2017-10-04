package grails.mbds.projet

class Lieu {
    String nom
    String  codePostal
    String ville
    String posX
    String posY
    static constraints = {
        nom blank: false , nullable: false
        ville blank: false, nullable : false
        codePostal blank:  false, nullable : false
        posX nullable: true
        posY nullable: true
    }

}
