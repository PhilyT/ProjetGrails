package grails.mbds.projet;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImpl implements UserDetailsService {
    private Utilisateur utilisateur ;

    public UserDetailsServiceImpl(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetailSecurityImpl  detailUser = null;
        String login = utilisateur.getUsername();
        if (login == null) {
            throw new UsernameNotFoundException(login + " non trouvée");
        } else {

            detailUser = new  UserDetailSecurityImpl(login);
            detailUser.setPassword(utilisateur.getPassword());
            detailUser.setEnabled(utilisateur.getEnabled());
            detailUser.setUserLastName(utilisateur.getLastName());


        }

        return detailUser;
    }

}
