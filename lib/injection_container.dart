import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_clean_architecture/features/photo/data/data_sources/remote/photo_api_service.dart';
import 'package:photo_clean_architecture/features/photo/data/repository/photo_repository_impl.dart';
import 'package:photo_clean_architecture/features/photo/domain/repository/photo_repository.dart';
import 'package:photo_clean_architecture/features/photo/domain/usecases/get_photo.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/local/local_photo_bloc.dart';
import 'package:photo_clean_architecture/features/photo/presentation/bloc/photo/remote/remote_photo_bloc.dart';

import 'features/photo/data/data_sources/local/app_database.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database').build();

  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<PhotoApiService>(PhotoApiService(sl()));
  sl.registerSingleton<PhotoRepository>(PhotoRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetPhotoUseCase>(GetPhotoUseCase(sl()));

  //Blocs
  sl.registerFactory<RemotePhotoBloc>(() => RemotePhotoBloc(sl(), sl()));
  sl.registerFactory<LocalPhotoBloc>(() => LocalPhotoBloc(sl()));
}
