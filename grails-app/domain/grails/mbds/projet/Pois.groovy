package grails.mbds.projet

class Pois {
    static hasOne = [Lieu:lieu]
    static hasMany = [Groupe:groupe]
    String nom
    String description
    Long id
    static constraints = {
        nom blank: false , nullable: false,unique: true
    }
}
