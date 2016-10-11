package app.service.photo;

import app.entity.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    @Transactional
    public void addPhoto(Photo photo) {
        photoRepository.save(photo);
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
