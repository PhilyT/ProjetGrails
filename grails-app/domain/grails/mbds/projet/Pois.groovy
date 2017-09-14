package grails.mbds.projet

class Pois {
    static hasOne = [lieu:Lieu]
    static hasMany = [groupes:Groupe]
    String nom
    String description

    static constraints = {
        nom blank: false , nullable: false,unique: true
    }
}
