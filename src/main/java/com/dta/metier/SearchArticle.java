package com.dta.metier;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Query;

import com.dta.entities.Article;

@Stateless
public class SearchArticle extends SearchEntities<Article>{

	public SearchArticle() {
		super(Article.class);

	}
	
	@SuppressWarnings("unchecked")
	public List<Article> findByName(String name){
		Query query = em.createQuery("SELECT a FROM Article a WHERE a.nom = :name");
		query.setParameter("name", name);
		return query.getResultList();
		
	}
		
	public String requestGenerator(Article model){

		String request = "SELECT a FROM Article a WHERE ";

		if(model.getNom()!=null){
			request += "a.nom='"+model.getNom()+"' ";
		}
		if(model.getPrix()!=-1){
			if(model.getNom()!=null){
				request += "AND a.prix="+model.getPrix()+" ";
			}else{
				request += "a.prix="+model.getPrix()+" ";
			}
		}
		if(model.getStock()!=-1){
			if(model.getPrix()!=-1 || model.getNom() != null){
				request += "AND a.stock="+model.getStock()+" ";
			}else{
				request += "a.stock="+model.getStock()+" ";
			}
		}
		return request;
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> findDetail (Article article){
		String requete = requestGenerator(article);
		Query query = em.createQuery(requete);
		if (query.getResultList().size() == 0)
			return new ArrayList<Article>();
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Article> findById(int articleId){
		Query query = em.createQuery("SELECT a FROM Article a WHERE a.articleId = :id");
		query.setParameter("id", articleId);
		return query.getResultList();
	}

}
