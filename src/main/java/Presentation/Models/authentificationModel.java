package Presentation.Models;

public class authentificationModel {
	
	private String username;
	private String password;
	private int role;
	public authentificationModel(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public authentificationModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
	
}
