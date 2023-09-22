import 'package:photo_clean_architecture/core/recourses/data_state.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';

abstract class PhotoRepository {
  Future<DataState<List<PhotoEntity>>> getPhotos();

  Future<List<PhotoEntity>> getPhotosLocal();

  Future<void> savePhoto(PhotoEntity data);

  Future<void> deletePhoto(PhotoEntity data);
}
