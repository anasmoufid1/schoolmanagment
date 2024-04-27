package Presentation.Models;

public class Tache {
	private int id;
	private int pourcentage;
	private String description;
	public Tache(int id, int pourcentage, String description) {
		super();
		this.id = id;
		this.pourcentage = pourcentage;
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPourcentage() {
		return pourcentage;
	}
	public void setPourcentage(int pourcentage) {
		this.pourcentage = pourcentage;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
