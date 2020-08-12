package daoimpl;
import beans.*;
import beans.Query;
import dao.*;
import org.hibernate.*;

public class ScholarDAOImpl implements ScholarDAO 
{
	private Session ses=null;
	
	public ScholarDAOImpl() 
	{
		SessionFactory fac=HibernateUtil.getSessionFactory();
		ses=fac.getCurrentSession();
		ses.beginTransaction();
	}
	
	@Override
	public boolean updateScholarDp(String schId, String schDp) 
	{
		Scholar sch=(Scholar) ses.get(Scholar.class, schId);
		sch.setDp(schDp);
		ses.update(sch);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean updateScholarPassword(String schId, String oldpass, String newpass) 
	{
		Scholar sch=(Scholar) ses.get(Scholar.class, schId);
		String pass=sch.getPassword();
		if(oldpass.equals(pass))
		{
			sch.setPassword(newpass);
			ses.update(sch);
			ses.getTransaction().commit();
			return true;
		}
		return false;
	}

	@Override
	public boolean insertQuery(Query q) 
	{
		ses.save(q);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteScholarDp(String schId) 
	{
		Scholar sch=(Scholar) ses.get(Scholar.class, schId);
		sch.setDp("admin/avatar.png");
		ses.update(sch);
		ses.getTransaction().commit();
		return true;
	}	
}
