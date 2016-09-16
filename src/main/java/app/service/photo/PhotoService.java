package app.service.photo;

import app.entity.Photo;

import java.util.List;

public interface PhotoService {
    List<Photo> getPhotoAll();
    void addPhoto(Photo photo);
    void updatePhoto(Photo photo);
    void deletePhoto(Photo photo);
}
