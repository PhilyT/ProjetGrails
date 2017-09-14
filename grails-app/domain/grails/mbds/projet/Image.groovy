package grails.mbds.projet

class Image {
    static belongsTo = [groupe:Groupe, poi:Pois]
    String nom

    static constraints = {
        nom blank: false , nullable: false,unique: true
        groupe nullable: true
        poi nullable: true
    }
}