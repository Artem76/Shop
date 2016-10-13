package app.service.photo;

import app.entity.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.rowset.serial.SerialBlob;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

@Service
public class PhotoServiceImpl implements PhotoService{
    @Autowired
    private PhotoRepository photoRepository;

    @Override
    @Transactional(readOnly = true)
    public List<Photo> getPhotoAll() {
        return photoRepository.findAll();
    }

    @Override
    public Photo getPhotoByName(String name) {
        return photoRepository.findByName(name);
    }

    @Override
    public Photo getPhotoOne(long id) {
        return photoRepository.findOne(id);
    }

    @Override
    public List<String> getNames() {
        TreeSet<String> nameSet = new TreeSet<String>();
        for (Photo photo:
                photoRepository.findAll()) {
            nameSet.add(photo.getName());
        }
        List<String> nameList = new ArrayList<>();
        nameList.addAll(nameSet);
        return nameList;
    }

    @Override
    @Transactional
    public boolean addPhoto(String name, byte[] bytes) {
        if (photoRepository.findByName(name) != null) return false;
        Blob blob = null;
        try {
            blob = new SerialBlob(bytes);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        Photo photo = new Photo(name,blob);
        photoRepository.save(photo);
        return true;
    }

    @Override
    @Transactional
    public void updatePhoto(Photo photo) {
        photoRepository.save(photo);
    }

    @Override
    @Transactional
    public void deletePhoto(Photo photo) {
        photoRepository.delete(photo);
    }
}
