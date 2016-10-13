package app.service.photo;

import app.entity.Photo;

import java.util.List;

public interface PhotoService {
    List<Photo> getPhotoAll();
    Photo getPhotoByName(String name);
    Photo getPhotoOne(long id);
    List<String> getNames();
    boolean addPhoto(String name, byte[] bytes);
    void updatePhoto(Photo photo);
    void deletePhoto(Photo photo);
}
