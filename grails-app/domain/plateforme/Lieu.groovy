package plateforme

class Lieu {
    static hasOne = [Pois:pois]
    String nom
    Long id
    Long codePostal
    String ville
    Double posX
    Double posY
    static constraints = {
        nom blank: false , nullable: false,unique: true
        ville blank: false, nullable : false , unique :true

    }
}
