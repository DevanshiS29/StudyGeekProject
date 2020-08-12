package dao;
import beans.*;
import java.util.List;

public interface AdminDAO 
{
	boolean updateAdminDp(String adminId,String adDp);
	
	boolean updateAdminPassword(String adId,String oldpass,String newpass);
	
	boolean insertScholar(Scholar sch);

	boolean deleteScholar(String schId);

	boolean insertFaculty(Faculty faculty);

	boolean deleteFaculty(String facId);
	
	boolean deleteAdminDp(String adminId);
	
	List<Scholar> displayScholars();
	
	List<Faculty> displayFaculty();
}
