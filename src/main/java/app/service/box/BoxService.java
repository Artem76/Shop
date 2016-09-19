package app.service.box;

import app.entity.Box;
import app.entity.CustomUser;

import java.util.List;

public interface BoxService {
    List<Box> getBoxesByClientStatusSort(CustomUser customUser, Boolean status);
    List<Box> getBoxesByManagerStatusSort(CustomUser customUser, Boolean status);
    List<Box> getBoxesAllStatusSort(Boolean status);
    void addBox(Box box);
    void updateBox(Box box);
    void deleteBox(Box box);
    boolean completeBox(Box box);
}
