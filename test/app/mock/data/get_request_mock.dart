import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/request/get_request.dart';

class GetRequestMock with Request, GetRequest {
  GetRequestMock(this.requestModel);

  @override
  final RequestModel requestModel;

  @override
  String get path => 'path';
}
