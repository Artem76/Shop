package app.service.box;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.Product;
import app.service.ord.OrdService;
//import app.service.product.ProductRepository;
import app.service.photo.PhotoService;
import app.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BoxServiceImpl implements BoxService {
    @Autowired
    private BoxRepository boxRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrdService ordService;

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByClientStatusSort(CustomUser customUser, Integer status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
        boxes.sort((a,b) -> a.getCustomUsers().size()-b.getCustomUsers().size());
        List<Box> boxesFilter = new ArrayList<>();
        for (Box b : boxes) {
            if (b.getCustomUserClient().getLogin().equals(customUser.getLogin())) {
                boxesFilter.add(b);
            }
        }
        return boxesFilter;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByClientStatus12Sort(CustomUser customUser) {
        List<Box> boxes = boxRepository.findByStatusSort(1);
        boxes.sort((a,b) -> a.getCustomUsers().size()-b.getCustomUsers().size());
        boxes.addAll(boxRepository.findByStatusSort(2));
        List<Box> boxesFilter = new ArrayList<>();
        for (Box b : boxes) {
            if (b.getCustomUserClient().getLogin().equals(customUser.getLogin())) {
                boxesFilter.add(b);
            }
        }
        return boxesFilter;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByManagerStatusSort(CustomUser customUser, Integer status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
        List<Box> boxesFilter = new ArrayList<>();
        for (Box b : boxes) {
            if ((customUser == null && b.getCustomUsers().size() == 1) ||
                    (customUser != null && b.getCustomUsers().size() > 1 && b.getCustomUserManager().getLogin().equals(customUser.getLogin()))) {
                boxesFilter.add(b);
            }
        }
        return boxesFilter;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesAllStatusSort(Integer status) {
        return boxRepository.findByStatusSort(status);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesAllWorkStatusSort(Integer status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
        List<Box> boxesFilter = new ArrayList<>();
        for (Box b : boxes) {
            if (b.getCustomUsers().size() > 1) {
                boxesFilter.add(b);
            }
        }
        return boxesFilter;
    }

    @Override
    @Transactional(readOnly = true)
    public Box getOne(long id) {
        return boxRepository.findOne(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Double getSum(CustomUser customUser) {
        Box box = addBox(customUser);
        double sum = 0.0;
        for (Ord ord :
                ordService.getOrdByBoxSort(box)) {
            sum = sum + (ord.getPriceOrd() * ord.getNumberProduct());
        }
        return new BigDecimal(sum).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    @Override
    @Transactional(readOnly = true)
    public Double getSumBox(Box box) {
        double sum = 0.0;
        for (Ord ord :
                ordService.getOrdByBoxSort(box)) {
            sum = sum + (ord.getPriceOrd() * ord.getNumberProduct());
        }
        return new BigDecimal(sum).setScale(2, RoundingMode.HALF_UP).doubleValue();
    }

    @Override
    @Transactional
    public Box addBox(CustomUser customUser) {
        List<Box> boxes = getBoxesByClientStatusSort(customUser, 0);
        if (boxes.size() == 0) {
            Box box = new Box(customUser);
            boxRepository.save(box);
            return box;
        }
        return boxes.get(0);
    }

    @Override
    @Transactional
    public void addProductInBox(CustomUser customUser, Product product, Integer numberProduct) {
        Box box = addBox(customUser);
        List<Ord> ords = ordService.getOrdByBoxSort(box);
        for (Ord o :
                ords) {
            if (o.getProduct().equals(product)) return;
        }
        Ord ord = new Ord(box, product, numberProduct);
        ordService.addOrd(ord);
    }

    @Override
    @Transactional
    public void updateBox(Box box) {
        boxRepository.save(box);
    }

    @Override
    @Transactional
    public void takeBox(long id, CustomUser customUser) {
        Box box = getOne(id);
        box.setCustomUserManager(customUser);
        boxRepository.save(box);
    }

    @Override
    @Transactional
    public void outBox(long id) {
        Box box = getOne(id);
        box.delManager();
        boxRepository.save(box);
    }


    @Override
    @Transactional
    public void deleteBox(Box box) {
        boxRepository.delete(box);
    }

    @Override
    public void orderBox(CustomUser customUser, String description) {
        Box box = addBox(customUser);
        if (ordService.getOrdByBoxSort(box).size()==0) return;
        box.setDescription(description);
        box.setDate(new Date(System.currentTimeMillis()));
        box.setStatus(1);
        boxRepository.save(box);
    }

    @Override
    @Transactional
    public boolean completeBox(Box box) {
        if (box.getStatus() == 1) {
            List<Ord> ords = ordService.getOrdByBoxSort(box);
            for (Ord ord : ords) {
                if (ord.getNumberProduct() > ord.getProduct().getNumber()) {
                    return false;
                }
            }
            for (Ord ord : ords) {
                Product product = ord.getProduct();
                product.setNumber(product.getNumber() - ord.getNumberProduct());
                productService.updateProduct(product);
            }
            box.setStatus(2);
            boxRepository.save(box);
            return true;
        }
        return false;
    }
}
