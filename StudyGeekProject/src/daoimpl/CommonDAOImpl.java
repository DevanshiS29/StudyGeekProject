package daoimpl;
import dao.CommonDAO;
import java.util.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import beans.*;

public class CommonDAOImpl implements CommonDAO
{
	private Session ses=null;
	
	public CommonDAOImpl() 
	{
		SessionFactory fac=HibernateUtil.getSessionFactory();
		ses=fac.getCurrentSession();
		ses.beginTransaction();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<beans.Query> displayQuery() 
	{
		org.hibernate.Query q=ses.createQuery("from Query");
		List<beans.Query> queries=q.list();
		return queries;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Answers> displayAnswers() 
	{
		org.hibernate.Query q=ses.createQuery("from Answers");
		List<Answers> answers=q.list();
		return answers;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Announcement> displayAnnouncements()
	{
		org.hibernate.Query q=ses.createQuery("from Announcement");
		List<Announcement> announcements=q.list();
		return announcements;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Videos> displayVideos() 
	{
		org.hibernate.Query q=ses.createQuery("from Videos");
		List<Videos> videos=q.list();
		return videos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Notes> displayNotes() 
	{
		org.hibernate.Query q=ses.createQuery("from Notes");
		List<Notes> notes=q.list();
		return notes;
	}
}