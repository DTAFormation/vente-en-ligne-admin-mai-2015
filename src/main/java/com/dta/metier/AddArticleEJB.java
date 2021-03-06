package com.dta.metier;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.OptimisticLockException;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dta.entities.Article;
import com.dta.entities.Produit;

@Stateless(name="AddArticleEJB")
public class AddArticleEJB {

	private static final Logger LOG = LoggerFactory.getLogger(AddArticleEJB.class);
	
	@PersistenceContext(unitName="ecommercedb")
	private EntityManager em;

	public void save(Article article){
		if(!isArticleNameExists(article.getNom())){

			try{
				em.persist(article);
			} catch(OptimisticLockException e){
				LOG.error("ERROR: ", e);
			}
		}
	}

	public boolean isArticleNameExists(String name) {
		return !em.createNamedQuery("Article.findByName", Article.class)
				.setParameter("name", name)
				.getResultList()
				.isEmpty();
	}

	public Produit getProduitById(int id) {
		return em.createNamedQuery("Produit.findById", Produit.class)
				.setParameter("id", id)
				.getSingleResult();
	}

	public List<Produit> getAllProduits() {		
		return em.createNamedQuery("Produit.findAll", Produit.class)
				.getResultList();
	}

	public EntityManager getEm() {
		return em;
	}

	public void setEm(EntityManager em) {
		this.em = em;
	}
}