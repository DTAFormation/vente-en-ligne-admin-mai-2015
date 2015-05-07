package com.dta.beans;

import java.io.IOException;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import com.dta.entities.Utilisateur;
import com.dta.metier.SearchUtilisateur;

@ManagedBean(name="autehentificationBean")
@SessionScoped
public class AuthentificationBean {
	
	@EJB
	private SearchUtilisateur searchUtilisateur;
	
	Utilisateur utilisateur;
	
	private String login;
	private String password;
	private String typeUtil;
	
	
	
	public void verifyAuth() throws IOException{
		utilisateur = searchUtilisateur.findAuthentification(login, password, typeUtil);
		if(utilisateur == null){
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Utilisateur inconnu"));
			FacesContext.getCurrentInstance().getExternalContext().redirect("errorAuth.xhtml");
			return;
		}
		else{
			FacesContext.getCurrentInstance().getExternalContext().redirect("index.xhtml");
			return;
		}
	}
	
	public boolean isLoggedIn() {
        return utilisateur != null;
    }
	
	public void logout() throws IOException{
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		FacesContext.getCurrentInstance().getExternalContext().redirect("authentification.xhtml");
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTypeUtil() {
		return typeUtil;
	}
	public void setTypeUtil(String typeUtil) {
		this.typeUtil = typeUtil;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}
	
	
	

}