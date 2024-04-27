package Data.Projet;

import java.util.ArrayList;

import Presentation.Models.ProjetModel;
import Presentation.Models.Service;

public interface ProjetDataInterface {
        
    int getNumberOfChef();
    int getNumberOfProjects();
    int getNumberOfClient();
    int getNumberOfDevloppeur();

    ArrayList<ProjetModel> getDeveloperProjects(int authID);

    ArrayList<Service> getDevProjectServices(int projetID, int authID);

    void updatepercentage(int taskID, int percentage);

}
