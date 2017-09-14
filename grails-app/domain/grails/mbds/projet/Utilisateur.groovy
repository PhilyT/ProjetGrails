package grails.mbds.projet

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Utilisateur implements Serializable {

    private static final long serialVersionUID = 1

    String name
    String lastName
    String username
    String password
    String email
    boolean admin= false
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (UtilisateurRole.findAllByUtilisateur(this) as List<UtilisateurRole>)*.role as Set<Role>
    }
    String toString() {
        return this.lastName + ' ' + this.name
    }
    static constraints = {
        name blank: false , nullable: false,unique: false
        lastName blank: false,  nullable: false,unique: false
        username size: 2..15, blank: false, unique: true
        password size: 4..15, blank: false, nullable: false,password: true
        email email: true

    }

    static mapping = {
	    password column: '`password`'
    }
}
