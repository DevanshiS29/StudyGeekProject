package dao;
import beans.*;

public interface FacultyDAO 
{	
	boolean updateFacultyDp(String facId,String facDp);
	
	boolean updateFacultyPassword(String facId,String oldpass,String newpass);

	boolean insertQueryAnswer(Answers ans);
	
	boolean insertAnnouncement(Announcement a);

	boolean insertNotes(Notes n);
	
	boolean insertVideo(Videos v);
	
	boolean deleteFacultyDp(String facId);
}