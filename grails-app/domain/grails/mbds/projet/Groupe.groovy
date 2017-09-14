package grails.mbds.projet

class Groupe {
    static hasMany = [Pois:pois]
    String nom
    Long id

    static constraints = {
        nom blank: false , nullable: false,unique: true

    }
}
