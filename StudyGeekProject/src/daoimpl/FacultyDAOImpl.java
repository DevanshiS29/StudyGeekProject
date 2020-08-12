package daoimpl;
import org.hibernate.*;
import beans.*;
import dao.FacultyDAO;

public class FacultyDAOImpl implements FacultyDAO 
{
	private Session ses=null;
	
	public FacultyDAOImpl() 
	{
		SessionFactory fac=HibernateUtil.getSessionFactory();
		ses=fac.getCurrentSession();
		ses.beginTransaction();
	}

	@Override
	public boolean updateFacultyDp(String facId, String facDp) 
	{
		Faculty fac=(Faculty) ses.get(Faculty.class, facId);
		fac.setDp(facDp);
		ses.update(fac);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean updateFacultyPassword(String facId, String oldpass, String newpass) 
	{
		Faculty fac=(Faculty) ses.get(Faculty.class, facId);
		String pass=fac.getPassword();
		if(oldpass.equals(pass))
		{
			fac.setPassword(newpass);
			ses.update(fac);
			ses.getTransaction().commit();
			return true;
		}
		return false;
	}

	@Override
	public boolean insertQueryAnswer(Answers ans) 
	{
		ses.save(ans);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean insertAnnouncement(Announcement a)
	{
		ses.save(a);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean insertNotes(Notes n) 
	{
		ses.save(n);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean insertVideo(Videos v)
	{
		ses.save(v);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteFacultyDp(String facId) 
	{
		Faculty fac=(Faculty) ses.get(Faculty.class, facId);
		fac.setDp("admin/avatar.png");
		ses.update(fac);
		ses.getTransaction().commit();
		return true;
	}
}