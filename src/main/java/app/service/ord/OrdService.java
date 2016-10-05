package app.service.ord;

import app.entity.Box;
import app.entity.Ord;

import java.util.List;

public interface OrdService {
    List<Ord> getOrdAll();
    List<Ord> getOrdByBoxSort(Box box);
    Ord getOrdOne(long id);
    Ord addOrd(Ord ord);
    void updateOrd(Ord ord);
    void deleteOrd(Ord ord);
}
