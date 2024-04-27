package Metier.developper;

import java.util.ArrayList;

import Presentation.Models.Competance;
import Presentation.Models.Technologie;

public interface ProfileSettingsInterface {
    int editPass(int authID, String newPass, String existing, String existingconfirm);

    ArrayList<Competance> getDevCompetances(int authID);

    ArrayList<Technologie> getAllTech();

    void addCompetance(int devid, String exp, String desc, int techid);

}
