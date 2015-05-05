package com.dta.metier;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Query;

import com.dta.entities.Article;
import com.dta.entities.Produit;

@Stateless
public class SearchProduit extends SearchEntities<Produit> {

	public SearchProduit() {
		super(Produit.class);
	}
	
	public Produit findByName(String name){
		Query query = em.createQuery("SELECT p FROM Produit p WHERE p.nom = :name");
		query.setParameter("name", name);
		return (Produit) query.getSingleResult();	
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> findAllArticles (String name){
		Query query1 = em.createQuery("SELECT produitId FROM Produit p WHERE p.nom = :name");
		query1.setParameter("name", name);
		String id = (String) query1.getSingleResult();

		Query query = em.createQuery("SELECT a FROM Article a WHERE a.produit = :name");
		query.setParameter("name", name);
		return null;
	}


}
