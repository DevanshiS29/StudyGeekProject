package beans;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="query")
public class Query {
		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int queryId;
	
	@Column(name="uploaded_by",length=20)
	private String name;
	
	@Column(name="topic",length=20)
	private String topic;
	    
	@Column(name="description",length=4000)
	private String description;
	
	@Temporal(TemporalType.TIMESTAMP)  
	@Column(name="upload_time")
	private Date uploadTime;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="scholar_id")
	private Scholar scholar;
	
	public Query() {}

	public Query(String name, String topic, String description, Date uploadTime, Scholar scholar) {
		this.name = name;
		this.topic = topic;
		this.description = description;
		this.uploadTime = uploadTime;
		this.scholar = scholar;
	}

	public int getQueryId() {
		return queryId;
	}

	public void setQueryId(int queryId) {
		this.queryId = queryId;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Scholar getScholar() {
		return scholar;
	}

	public void setScholar(Scholar scholar) {
		this.scholar = scholar;
	}
}