package Presentation.Models;

public class Competance {
	private int id;
	private String Experience;
	private String Description;
	private Technologie tech;
	public Competance(int id, String experience, String description, Technologie tech) {
		super();
		this.id = id;
		Experience = experience;
		Description = description;
		this.tech = tech;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getExperience() {
		return Experience;
	}
	public void setExperience(String experience) {
		Experience = experience;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}

	public Technologie getTech() {
		return tech;
	}
	public void setTech(Technologie tech) {
		this.tech = tech;
	}

}
