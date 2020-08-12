package beans;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="answers")
public class Answers {
		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id")
	private int answerId;
	
	@Column(name="answer",length=4000)
	private String answer;
	    
	@Temporal(TemporalType.TIMESTAMP)    
	@Column(name="upload_time")
	private Date uploadTime;

	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="faculty_id")
	private Faculty faculty;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="query_id")
	private Query query;

	public Answers() {}
	
	public Answers(String answer, Date uploadTime, Faculty faculty, Query query) {
		this.answer = answer;
		this.uploadTime = uploadTime;
		this.faculty = faculty;
		this.query = query;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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

	public Query getQuery() {
		return query;
	}

	public void setQuery(Query query) {
		this.query = query;
	}
}