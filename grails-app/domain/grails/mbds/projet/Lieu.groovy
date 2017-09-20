package grails.mbds.projet

class Lieu {
    static belongsTo = [poi:Poi]
    String nom

    String  codePostal
    String ville
    Double posX
    Double posY
    static constraints = {
        nom blank: false , nullable: false
        ville blank: false, nullable : false
        codePostal blank:  false, nullable : false
        posX nullable: true
        posY nullable: true
    }
}
