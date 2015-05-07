package com.dta.validateur.addclient;


import javax.faces.validator.ValidatorException;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import com.dta.metier.AddClientEJB;

import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class ExistenceEmailValidatorTest {
	@Mock private AddClientEJB addclientEJB;
	private ExistenceEmailValidator elv;
	
	@Before
	public void init(){
		elv=new ExistenceEmailValidator();
		elv.setAddclientEJB(addclientEJB);	
	}
	
	@Test(expected=ValidatorException.class)
	public void validateTrueTest(){
		String Email = "Email";
		
		when(addclientEJB.SearchExistenceEmail(Email)).thenReturn(true);
		elv.validate(null, null, Email);
	}
	
	@Test
	public void validateFalseTest(){
		String Email = "Email";
		
		when(addclientEJB.SearchExistenceEmail(Email)).thenReturn(false);
		elv.validate(null, null, Email);
		Mockito.verify(addclientEJB).SearchExistenceEmail(Email);
	}
}
