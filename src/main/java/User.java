
public class User {
	private String nom ;
	private String Email ;
	private String Password ;
	
	public User(String nom, String email, String password) {
		super();
		this.nom = nom;
		Email = email;
		Password = password;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}

}
