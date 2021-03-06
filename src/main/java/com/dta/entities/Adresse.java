package com.dta.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Version;

@Entity
public class Adresse {

	@Id
	@GeneratedValue
	@Column(name="adresse_id", length=19)
	private int adresseId;
	@Column(name="code_postal", length=10)
	private int codePostal;
	@Column(name="departement", length=255)
	private String departement;
	@Column(name="numero", length=10)
	private int num;
	@Column(name="pays", length=255)
	private String pays;
	@Column(name="rue", length=255)
	private String rue;
	@Column(name="ville", length=255)
	private String ville;
	@OneToMany(mappedBy="adresse")
	private List<Commande> commande;
	@ManyToOne
	@JoinTable(name="adresses_utilisateur")
	private Utilisateur utilisateur;
	@Version
	private long version = 0L;
	
	public Adresse() {
		
	}

	public int getAdresseId() {
		return adresseId;
	}
	public void setAdresseId(int adresseId) {
		this.adresseId = adresseId;
	}
	public int getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(int codePostal) {
		this.codePostal = codePostal;
	}
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	public String getRue() {
		return rue;
	}
	public void setRue(String rue) {
		this.rue = rue;
	}
	public long getVersion() {
		return version;
	}
	public void setVersion(long version) {
		this.version = version;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public Utilisateur getUtilisateur() {
		return utilisateur;
	}
	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public List<Commande> getCommande() {
		return commande;
	}
	public void setCommande(List<Commande> commande) {
		this.commande = commande;
	}


	@Override
	public String toString() {
		return "Addresse [adresseId=" + adresseId + ", codePostal="
				+ codePostal + ", departement=" + departement + ", num=" + num
				+ ", pays=" + pays + ", rue=" + rue + ", ville=" + ville + "]";
	}
}