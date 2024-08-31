import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/request/post_request.dart';

class PostRequestMock with Request, PostRequest {
  PostRequestMock(this.requestModel);

  @override
  final RequestModel requestModel;

  @override
  bool get multiPart => true;

  @override
  String get path => "path";
}
