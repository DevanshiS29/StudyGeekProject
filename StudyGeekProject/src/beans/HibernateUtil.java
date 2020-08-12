package beans;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil 
{
	//SessionFactory variable
	private static SessionFactory sessionFactory;
	
	//method for building SessionFactory
	@SuppressWarnings({ "deprecation"})
	public static SessionFactory getSessionFactory() 
	{
        //configuration object
        Configuration configuration=new Configuration();
        //configuring xml file
    	configuration.configure("hibernate.cfg.xml");
    	//SessionFactory object
    	sessionFactory=configuration.buildSessionFactory();
        //returning sessonFactory+
        return sessionFactory;
    }
}