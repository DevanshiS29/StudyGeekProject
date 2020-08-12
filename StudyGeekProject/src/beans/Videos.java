package beans;
import java.util.*;
import javax.persistence.*;

//table to store videos
@Entity
@Table(name="videos")
public class Videos 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int videoId;

	@Column(name="uploaded_by",length=20)
	private String name;
	
	@Column(name="video_file")
	private String file;

	@Column(name="topic",length=20)
	private String topic;
	
	@Column(name="upload_time")
	private Date uploadTime;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn
	private Faculty faculty;
	
	//no-argument constructor
	public Videos() {}
	
	//parameterized constructor
	public Videos(String name, String file, String topic, Date uploadTime, Faculty faculty) {
		this.name = name;
		this.file = file;
		this.topic = topic;
		this.uploadTime = uploadTime;
		this.faculty = faculty;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
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
}