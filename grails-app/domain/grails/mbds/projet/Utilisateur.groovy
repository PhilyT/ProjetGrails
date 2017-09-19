package grails.mbds.projet

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Utilisateur implements Serializable {

    private static final long serialVersionUID = 1
    static hasMany = [pois:Pois]
    String name
    String lastName
    String username
    String password
    String email
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UtilisateurRole.findAllByUtilisateur(this) as List<UtilisateurRole>)*.role as Set<Role>
    }

    static constraints = {
        name blank: false , nullable: false
        lastName blank: false,  nullable: false
        username blank: false, unique: true, nullable: false
        password blank: false, nullable: false,password: true
        email email: true , nullable: true

    }

    static mapping = {
	    password column: '`password`'
    }
}
