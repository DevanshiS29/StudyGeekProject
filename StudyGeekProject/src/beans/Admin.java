package beans;
import javax.persistence.*;

@Entity
@Table(name="admin")
public class Admin {
	@Id
    @Column(name="id",length=10)
	private String adminId;
	
    @Column(name="name",length=20)
	private String name;
	
    @Column(name="password")
    private String password;

	@Column(name="gender",length=6)
	private String gender;
	
    @Column(name="mail",length=30)
	private String mail;
	
    @Column(name="contact",length=10)
	private long contact;
	
    @Column(name="dp")
	private String dp;
   
	public Admin() {}

	public Admin(String adminId, String name, String password, String gender, String mail, long contact, String dp) 
	{
		this.adminId = adminId;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.mail = mail;
		this.contact = contact;
		this.dp = dp;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}