package grails.mbds.projet

class Pois {
    Lieu lieu
    static belongsTo = Groupe
    static hasMany = [groupes:Groupe, images:Image]
    String nom
    String description

    static constraints = {
        nom blank: false , nullable: false,unique: true
    }
}
