import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/photos/data/models/request/get_photos_request_model.dart';
import 'package:waffarha_challenge/photos/data/models/response/photo_model.dart';
import 'package:waffarha_challenge/photos/data/requests/get_photos_request.dart';

@lazySingleton
class PhotosRepository {
  PhotosRepository(this._apiManager);

  final APIsManager _apiManager;

  Future<Either<Failure, List<PhotoModel>>> getPhotosList(
    GetPhotosRequestModel requestModel,
  ) async {
    return _apiManager.send<List<PhotoModel>, MessageResponseModel>(
      request: GetPhotosRequest(requestModel),
      responseFromMap: photoModelFromJson,
    );
  }
}
