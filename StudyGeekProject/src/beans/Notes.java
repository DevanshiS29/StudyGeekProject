package beans;
import java.util.*;
import javax.persistence.*;

//table for notes
@Entity
@Table(name="notes")
public class Notes 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int notesId;
	
	@Column(name="uploaded_by",length=20)
	private String name;
	
	@Column(name="topic",length=20)
	private String topic;
	
	@Column(name="notes_file")
	private String file;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="upload_time")
	private Date uploadTime;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private Faculty faculty;
	
	//no-argument constructor
	public Notes() {}

	//parameterized constructor
	public Notes(String name, String topic, String file, Date uploadTime, Faculty faculty) {
		this.name = name;
		this.topic = topic;
		this.file = file;
		this.uploadTime = uploadTime;
		this.faculty = faculty;
	}

	public int getNotesId() {
		return notesId;
	}

	public void setNotesId(int notesId) {
		this.notesId = notesId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
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