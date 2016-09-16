package app.service.ord;

import app.entity.Ord;

import java.util.List;

public interface OrdService {
    List<Ord> getOrdAll();
    Ord getOrdOne(long id);
    void addOrd(Ord ord);
    void updateOrd(Ord ord);
    void deleteOrd(Ord ord);
}
