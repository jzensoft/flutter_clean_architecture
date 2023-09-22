import 'package:photo_clean_architecture/core/recourses/data_state.dart';
import 'package:photo_clean_architecture/core/usecases/usecase.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/domain/repository/photo_repository.dart';

class GetPhotoUseCase implements UseCase<DataState<List<PhotoEntity>>, void> {
  final PhotoRepository _photoRepository;

  GetPhotoUseCase(this._photoRepository);

  @override
  Future<DataState<List<PhotoEntity>>> call({void params}) {
    return _photoRepository.getPhotos();
  }
}
