package Metier.ProjetMetier;

import java.util.ArrayList;

import Presentation.Models.ProjetModel;
import Presentation.Models.Service;

public interface DevelopperProjectsManagerInterface {
    ArrayList<ProjetModel> getDeveloperProjects(int authID);

    ArrayList<Service> getdevprojectServices(int prID, int authID);

    void updatepercentage(int taskID, int percentage);
}
