package app.service.ord;

import app.entity.Box;
import app.entity.Ord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrdServiceImpl implements OrdService{
    @Autowired
    OrdRepository ordRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Ord> getOrdAll() {
        return ordRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Ord> getOrdByBoxSort(Box box) {
        List<Ord> ords = ordRepository.findByBox(box);
        ords.sort((a,b) -> a.getProduct().getType().compareTo(b.getProduct().getType())!=0 ? a.getProduct().getType().compareTo(b.getProduct().getType()) :
                a.getProduct().getNumberOfWires().compareTo(b.getProduct().getNumberOfWires())!=0 ? a.getProduct().getNumberOfWires().compareTo(b.getProduct().getNumberOfWires()) :
                        a.getProduct().getArea().compareTo(b.getProduct().getArea()));
        return ords;
    }

    @Override
    @Transactional(readOnly = true)
    public Ord getOrdOne(long id) {
        return ordRepository.findOne(id);
    }

    @Override
    @Transactional
    public Ord addOrd(Ord ord) {
        List <Ord> ords = ordRepository.findByProductBox(ord.getProduct(),ord.getBox());
        if (ords.size() != 0){
            int n = ord.getNumberProduct();
            ord = ords.get(0);
            ord.setNumberProduct(n);
        }
        ordRepository.save(ord);
        return ord;
    }

    @Override
    @Transactional
    public void updateOrd(Ord ord) {
        ordRepository.save(ord);
    }

    @Override
    @Transactional
    public void deleteOrd(Ord ord) {
        ordRepository.delete(ord);
    }
}
