package Data.Developer;

import java.util.ArrayList;

import Presentation.Models.Competance;
import Presentation.Models.Technologie;

public interface DevelopperInterface {
    boolean checkPassword(int authID, String existingInput);

    void editPassword(int authID, String newPass);

    ArrayList<Competance> getDevCompetances(int authID);

    Technologie getTechnologie(int id);

    int getDevID(int authID);

    ArrayList<Technologie> getAllTech();

    void addComp(int authID, Competance comp);
}
