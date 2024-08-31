import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/request/get_request.dart';
import 'package:waffarha_challenge/photos/data/models/request/get_photos_request_model.dart';

class GetPhotosRequest with Request, GetRequest {
  const GetPhotosRequest(this.requestModel);

  @override
  String get path => '/photos';

  @override
  final GetPhotosRequestModel requestModel;
}
