import 'dart:io';

import 'package:dio/dio.dart';
import 'package:photo_clean_architecture/core/recourses/data_state.dart';
import 'package:photo_clean_architecture/features/photo/data/data_sources/local/app_database.dart';
import 'package:photo_clean_architecture/features/photo/data/data_sources/remote/photo_api_service.dart';
import 'package:photo_clean_architecture/features/photo/data/models/photo_model.dart';
import 'package:photo_clean_architecture/features/photo/domain/entities/photo_entity.dart';
import 'package:photo_clean_architecture/features/photo/domain/repository/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoApiService _photoApiService;
  final AppDatabase _appDatabase;

  PhotoRepositoryImpl(this._photoApiService, this._appDatabase);

  @override
  Future<DataState<List<PhotoModel>>> getPhotos() async {
    try {
      final httpResponse = await _photoApiService.getPhotos();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DateSuccess(httpResponse.data);
      } else {
        return DataFailed(Exception(httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    } on Exception catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deletePhoto(PhotoEntity data) {
    return _appDatabase.photoDao.deleteData(PhotoModel.fromEntity(data));
  }

  @override
  Future<List<PhotoModel>> getPhotosLocal() {
    return _appDatabase.photoDao.getData();
  }

  @override
  Future<void> savePhoto(PhotoEntity data) {
    return _appDatabase.photoDao.insert(PhotoModel.fromEntity(data));
  }
}
