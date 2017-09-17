package grails.mbds.projet

class Lieu {
    static belongsTo = [pois:Pois]
    String nom

    String  codePostal
    String ville
    Double posX
    Double posY
    static constraints = {
        nom blank: false , nullable: false,unique: true
        ville blank: false, nullable : false , unique :true
        codePostal blank:  false, nullable : false , unique :false

    }
}
