package beans;
import javax.persistence.*;

@Entity
@Table(name="faculty")
public class Faculty {

	@Id
    @Column(name="id",length=10)
	private String facultyId;
	
    @Column(name="name",length=20)
	private String name;
	
    @Column(name="password")
    private String password;

	@Column(name="gender",length=6)
	private String gender;
	
	@Column(name="course",length=20)
	private String course;
	
    @Column(name="mail",length=30)
	private String mail;
	
    @Column(name="contact",length=10)
	private long contact;
	
    @Column(name="dp")
	private String dp;
    
    @Column(name="active",length=5)
    private String active;
    
	public Faculty() {}

	public Faculty(String facultyId, String name, String password, String gender,String course, String mail, long contact, String dp) {
		this.facultyId = facultyId;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.course=course;
		this.mail = mail;
		this.contact = contact;
		this.dp = dp;
		this.active = "true";
	}

	public String getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(String facultyId) {
		this.facultyId = facultyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	public String getDp() {
		return dp;
	}

	public void setDp(String dp) {
		this.dp = dp;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
}