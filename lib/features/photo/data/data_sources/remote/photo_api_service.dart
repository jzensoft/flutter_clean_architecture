import 'package:photo_clean_architecture/core/constants/constants.dart';
import 'package:photo_clean_architecture/features/photo/data/models/photo_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio) = _PhotoApiService;

  @GET("/photos")
  Future<HttpResponse<List<PhotoModel>>> getPhotos();
}
