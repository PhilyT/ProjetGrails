package plateforme

class Image {
    static belongsTo = [Groupe:groupe]
    String nom
    long id
    static constraints = {
        nom blank: false , nullable: false,unique: true
    }
}
