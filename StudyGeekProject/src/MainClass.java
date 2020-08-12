import org.hibernate.*;
import beans.*;

public class MainClass 
{
	public static void main(String[] args) 
	{
		SessionFactory fac=beans.HibernateUtil.getSessionFactory();
		Session ses=fac.getCurrentSession();
		ses.beginTransaction();
		ses.saveOrUpdate(new Admin("A1","Kashif","kash@123","Male","kash@hcl.com",1234567891,"admin/avatar.png"));
		ses.getTransaction().commit();
	}
}
