package daoimpl;
import java.util.*;
import org.hibernate.*;
import beans.*;
import dao.*;

public class AdminDAOImpl implements AdminDAO 
{
	private Session ses=null;
	
	public AdminDAOImpl() 
	{
		SessionFactory fac=HibernateUtil.getSessionFactory();
		ses=fac.getCurrentSession();
		ses.beginTransaction();
	}

	@Override
	public boolean updateAdminDp(String adId, String adDp) {
		Admin ad=(Admin) ses.get(Admin.class, adId);
		ad.setDp(adDp);
		ses.update(ad);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean updateAdminPassword(String adminId, String oldpass, String newpass) {
		Admin ad=(Admin) ses.get(Admin.class, adminId);
		String pass=ad.getPassword();
		if(oldpass.equals(pass))
		{
			ad.setPassword(newpass);
			ses.update(ad);
			ses.getTransaction().commit();
			return true;
		}
		return false;
	}

	@Override
	public boolean insertScholar(Scholar sch) {
		ses.save(sch);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteScholar(String schId) {
		Scholar sch=(Scholar)ses.get(Scholar.class, schId);
		sch.setName("StudyGeek");
		sch.setPassword("$tudy@Geek");
		sch.setDp("admin/avatar.png");
		sch.setActive("false");
		ses.update(sch);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean insertFaculty(Faculty fac) {
		ses.save(fac);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteFaculty(String facId) {
		Faculty fac=(Faculty)ses.get(Faculty.class, facId);
		fac.setName("StudyGeek");
		fac.setPassword("$tudy@Geek");
		fac.setDp("admin/avatar.png");
		fac.setActive("false");
		ses.update(fac);
		ses.getTransaction().commit();
		return true;
	}

	@Override
	public boolean deleteAdminDp(String adminId) {
		Admin ad=(Admin) ses.get(Admin.class, adminId);
		ad.setDp("admin/avatar.png");
		ses.update(ad);
		ses.getTransaction().commit();
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Scholar> displayScholars() 
	{
		List<Scholar> scholars=new LinkedList<>();
		SQLQuery q=ses.createSQLQuery("select * from Scholar where active=?");
		q.setString(0, "true");
		List<Object[]> rows=q.list();
		for(Object[] row : rows)
		{
			Scholar sch=new Scholar();
			sch.setScholarId(row[0].toString());
			sch.setActive(row[1].toString());
			sch.setContact(Long.parseLong(row[2].toString()));
			sch.setCourse(row[3].toString());
			sch.setDp(row[4].toString());
			sch.setGender(row[5].toString());
			sch.setMail(row[6].toString());
			sch.setName(row[7].toString());
			sch.setPassword(row[8].toString());
			scholars.add(sch);
		}
		return scholars;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Faculty> displayFaculty() 
	{
		List<Faculty> faculty=new LinkedList<>();
		SQLQuery q=ses.createSQLQuery("select * from Faculty where active=?");
		q.setString(0, "true");
		List<Object[]> rows=q.list();
		for(Object[] row : rows)
		{
			Faculty fac=new Faculty();
			fac.setFacultyId(row[0].toString());
			fac.setActive(row[1].toString());
			fac.setContact(Long.parseLong(row[2].toString()));
			fac.setCourse(row[3].toString());
			fac.setDp(row[4].toString());
			fac.setGender(row[5].toString());
			fac.setMail(row[6].toString());
			fac.setName(row[7].toString());
			fac.setPassword(row[8].toString());
			faculty.add(fac);
		}
		return faculty;
	}
}