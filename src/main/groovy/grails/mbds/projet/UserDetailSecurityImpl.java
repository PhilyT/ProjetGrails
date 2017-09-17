package grails.mbds.projet;

import grails.mbds.projet.Role;
import org.springframework.security.core.GrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;


public class UserDetailSecurityImpl implements org.springframework.security.core.userdetails.UserDetails {

    private String username;
    private String password;
    private boolean enabled;
    private String userLastName;

    private Set<GrantedAuthority> listAutorites;

    public UserDetailSecurityImpl(String user  ) {
        username = user;
    }

    public String getUserLastName() {
        return userLastName;
    }
    public  void setUserLastName(String lastName){
        userLastName = lastName ;
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return listAutorites;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String getUsername() {
        return  username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean newEnabled) {
        enabled = newEnabled;
    }

}
