package grails.mbds.projet

class Poi {
    Lieu lieu
    Utilisateur utilisateur
    static belongsTo = Groupe
    static hasMany = [groupes:Groupe, images:Image]
    String nom
    String description

    static constraints = {
        nom blank: false , nullable: false,unique: true
        images nullable: true
        description blank: true, nullable: true
    }
}
