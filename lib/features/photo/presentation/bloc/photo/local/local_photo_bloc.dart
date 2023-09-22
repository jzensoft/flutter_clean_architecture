import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/domain/repository/photo_repository.dart';

part 'local_photo_event.dart';
part 'local_photo_state.dart';

class LocalPhotoBloc extends Bloc<LocalPhotoEvent, LocalPhotoState> {
  final PhotoRepository _photoRepository;

  LocalPhotoBloc(this._photoRepository) : super(LocalPhotoLoading()) {
    on<GetSavedPhoto>((event, emit) async {
      final data = await _photoRepository.getPhotosLocal();
      emit(LocalPhotoDone(data));
    });
    on<RemovePhoto>((event, emit) async {
      await _photoRepository.deletePhoto(event.photoEntity!);
      final data = await _photoRepository.getPhotosLocal();
      emit(LocalPhotoDone(data));
    });
    on<SavePhoto>((event, emit) async {
      await _photoRepository.savePhoto(event.photoEntity!);
      final data = await _photoRepository.getPhotosLocal();
      emit(LocalPhotoDone(data));
    });
  }
}
