package app.service.box;

import app.entity.Box;
import app.entity.CustomUser;
import app.entity.Ord;
import app.entity.Product;
import app.service.ord.OrdService;
//import app.service.product.ProductRepository;
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
    BoxRepository boxRepository;

//    @Autowired
//    ProductRepository productRepository;

    @Autowired
    OrdService ordService;

    @Override
    @Transactional(readOnly = true)
    public List<Box> getBoxesByClientStatusSort(CustomUser customUser, Integer status) {
        List<Box> boxes = boxRepository.findByStatusSort(status);
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
        List<Box> boxesFilter = null;
        for (Box b : boxes) {
            if (b.getCustomUserManager().getLogin().equals(customUser.getLogin())) {
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
    public Double getSum(CustomUser customUser) {
        Box box = addBox(customUser);
        double sum = 0.0;
        for (Ord ord :
                ordService.getOrdByBoxSort(box)) {
            sum = sum+(ord.getPriceOrd()*ord.getNumberProduct());
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
        Ord ord = new Ord(box, product, numberProduct);
        ordService.addOrd(ord);
    }

//    @Override
//    @Transactional
//    public void updateBox(Box box) { //доработать
//        box.setDate(new Date(System.currentTimeMillis()));
//        boxRepository.save(box);
//    }


    @Override
    @Transactional
    public void deleteBox(Box box) {
        boxRepository.delete(box);
    }

    @Override
    public void orderBox(CustomUser customUser) {
        Box box = addBox(customUser);
        box.setStatus(1);
        boxRepository.save(box);
    }

//    @Override
//    @Transactional
//    public boolean completeBox(Box box) {
//        if (box.getStatus() == 1) {
//            List<Ord> ords = box.getOrders();
//            for (Ord ord : ords) {
//                if (ord.getNumberProduct() > ord.getProduct().getNumber()) {
//                    return false;
//                }
//            }
//            for (Ord ord : ords) {
//                Product product = ord.getProduct();
//                product.setNumber(product.getNumber() - ord.getNumberProduct());
//                productRepository.save(product);
//            }
//            box.setStatus(2);
//            boxRepository.save(box);
//            return true;
//        }
//        return false;
//    }
}
