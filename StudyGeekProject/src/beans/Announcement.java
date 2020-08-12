package beans;
import java.util.*;
import javax.persistence.*;

//table for announcements
@Entity
@Table(name="announcement")
public class Announcement 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int announcementId;
	
	@Column(name="title",length=20)
	private String title;
	
	@Column(name="description",length=4000)
	private String description;
	
	@Column(name="announced_by",length=20)
	private String name;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="upload_time")
	private Date uploadTime;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="faculty_id")
	private Faculty faculty;
	
	//no-argument constructor
	public Announcement() {}

	//parameterized constructor
	public Announcement(String title, String description, String name, Date uploadTime,
			Faculty faculty) {
		this.title = title;
		this.description = description;
		this.name = name;
		this.uploadTime = uploadTime;
		this.faculty = faculty;
	}

	public int getAnnouncementId() {
		return announcementId;
	}

	public void setAnnouncementId(int announcementId) {
		this.announcementId = announcementId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	
	//getters and setters for all the fields
}