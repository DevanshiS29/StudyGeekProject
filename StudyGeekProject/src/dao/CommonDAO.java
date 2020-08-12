package dao;
import java.util.List;
import beans.*;

public interface CommonDAO 
{
	List<Query> displayQuery();
	
	List<Answers> displayAnswers();
	
	List<Announcement> displayAnnouncements();
	
	List<Videos> displayVideos();
	
	List<Notes> displayNotes();
}
