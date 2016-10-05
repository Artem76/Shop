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
    Box addBox(CustomUser customUser);
    void addProductInBox(CustomUser customUser, Product product, Integer numberProduct);
//    void updateBox(Box box);
    void deleteProductFromBox(CustomUser customUser, Ord ord);
    void deleteBox(Box box);
//    boolean completeBox(Box box);
}
