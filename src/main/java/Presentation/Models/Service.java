package Presentation.Models;

import java.util.ArrayList;

public class Service {
	private int id;
	private String description;
	private int duree;
	private ArrayList<Tache> tasks=new ArrayList<Tache>();
	public Service(int id, String description, int duree,ArrayList<Tache> tache) {
		super();
		this.id = id;
		this.description = description;
		this.duree = duree;
		this.tasks=tache;
	}
	public ArrayList<Tache> getTasks() {
		return tasks;
	}
	public void setTasks(ArrayList<Tache> tasks) {
		this.tasks = tasks;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	
}
