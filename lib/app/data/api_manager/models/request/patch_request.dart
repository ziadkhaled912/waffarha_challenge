import 'package:dio/dio.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

mixin PatchRequest on Request {
  @override
  Future<Map<String, dynamic>?> get queryParameters async => null;
  @override
  Future<dynamic> get data async {
    final map = await requestModel.toMap();
    if (map.isEmpty) return null;

    return multiPart ? FormData.fromMap(map) : map;
  }

  @override
  String get method => 'PATCH';
}
