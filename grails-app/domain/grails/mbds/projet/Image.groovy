package grails.mbds.projet

class Image {
    static belongsTo = [groupe:Groupe, poi:Poi]
    String nom

    static constraints = {
        nom blank: false , nullable: true,unique: true
        groupe nullable: true
        poi nullable: true
    }
}
