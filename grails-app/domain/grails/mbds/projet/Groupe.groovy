package grails.mbds.projet

class Groupe {
    static hasMany = [pois:Poi, images:Image]
    String nom

    static constraints = {
        nom blank: false , nullable: false,unique: true
        images nullable: true

    }
}
