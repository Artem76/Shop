package app.service.box;

import app.entity.Box;
import app.entity.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public class BoxServiceImpl implements BoxService{
    @Autowired
    BoxRepository boxRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByClientStatusSort(CustomUser customUser, Boolean status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
        for (Box box:
             boxes) {
            if(!box.getCustomUserClient().equals(customUser)) boxes.remove(box);
        }
        return boxes;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByManagerStatusSort(CustomUser customUser, Boolean status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
        for (Box box:
                boxes) {
            if(!box.getCustomUserManager().equals(customUser)) boxes.remove(box);
        }
        return boxes;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesAllStatusSort(Boolean status) {
        return boxRepository.findByStatusSort(status);
    }

    @Override
    @Transactional
    public void addBox(Box box) {
        box.setDate(new Date(System.currentTimeMillis()));
        boxRepository.save(box);
    }

    @Override
    @Transactional
    public void updateBox(Box box) {
        box.setDate(new Date(System.currentTimeMillis()));
        boxRepository.save(box);
    }

    @Override
    @Transactional
    public void deleteBox(Box box) {
        boxRepository.delete(box);
    }

    @Override
    @Transactional
    public void completeBox(Box box) {
//Дописать
    }
}
