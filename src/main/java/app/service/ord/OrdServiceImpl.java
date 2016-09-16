package app.service.ord;

import app.entity.Ord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public Ord getOrdOne(long id) {
        return ordRepository.findOne(id);
    }

    @Override
    @Transactional
    public void addOrd(Ord ord) {
        ordRepository.save(ord);
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
