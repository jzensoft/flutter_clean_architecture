import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_clean_architecture/core/recourses/data_state.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/domain/repository/photo_repository.dart';
import 'package:photo_clean_architecture/features/photo/domain/usecases/get_photo.dart';

part 'remote_photo_event.dart';
part 'remote_photo_state.dart';

class RemotePhotoBloc extends Bloc<RemotePhotoEvent, RemotePhotoState> {
  final PhotoRepository _photoRepository;
  final GetPhotoUseCase _getPhotoUseCase; // Or use repository

  RemotePhotoBloc(this._photoRepository, this._getPhotoUseCase)
      : super(const RemotePhotoLoading()) {
    on<GetPhotos>(_onGetPhoto);
  }

  _onGetPhoto(GetPhotos event, Emitter<RemotePhotoState> emit) async {
    final dataState = await _photoRepository.getPhotos();
    if (dataState is DateSuccess && dataState.data!.isNotEmpty) {
      emit(RemotePhotoDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemotePhotoError(dataState.error!));
    }
  }
}
