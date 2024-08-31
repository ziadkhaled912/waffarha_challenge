import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

mixin GetRequest on Request {
  @override
  RequestModel get requestModel => EmptyRequestModel();

  @override
  Future<Map<String, dynamic>?> get queryParameters async {
    final map = await requestModel.toMap();

    return map.isEmpty ? null : requestModel.toMap();
  }

  @override
  Future<dynamic> get data async => null;

  @override
  String get method => 'GET';
}
