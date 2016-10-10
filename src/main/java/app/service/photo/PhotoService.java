package app.service.photo;

import app.entity.Photo;

import java.util.List;

public interface PhotoService {
    List<Photo> getPhotoAll();
    Photo getPhotoByName(String name);
    Photo getPhotoOne(long id);
    void addPhoto(Photo photo);//добавить проверку такойже фотографии
    void updatePhoto(Photo photo);
    void deletePhoto(Photo photo);
}
