package dao;
import beans.*;

public interface ScholarDAO 
{	
	boolean updateScholarDp(String schId,String schDp);
	
	boolean updateScholarPassword(String schId,String oldpass,String newpass);

	boolean insertQuery(Query q);
	
	boolean deleteScholarDp(String schId);
}
