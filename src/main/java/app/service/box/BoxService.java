package app.service.box;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.Product;

import java.util.List;

public interface BoxService {
    List<Box> getBoxesByClientStatusSort(CustomUser customUser, Integer status);
    List<Box> getBoxesByManagerStatusSort(CustomUser customUser, Integer status);
    List<Box> getBoxesAllStatusSort(Integer status);
    List<Box> getBoxesAllWorkStatusSort(Integer status);
    Box getOne(long id);
    Double getSum(CustomUser customUser);
    Box addBox(CustomUser customUser);
    void addProductInBox(CustomUser customUser, Product product, Integer numberProduct);
    void updateBox(Box box);
    void takeBox(long id, CustomUser customUser);
    void deleteBox(Box box);
    void orderBox(CustomUser customUser);
//    boolean completeBox(Box box);
}
