import 'package:floor/floor.dart';
import 'package:photo_clean_architecture/features/photo/data/models/photo_model.dart';

@dao
abstract class PhotoDao {
  @Insert()
  Future<void> insert(PhotoModel data);

  @delete
  Future<void> deleteData(PhotoModel data);

  @Query("SELECT * FROM photo")
  Future<List<PhotoModel>> getData();
}
