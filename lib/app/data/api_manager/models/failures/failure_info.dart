import 'package:dio/dio.dart';
import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class FailureInfo {
  FailureInfo({
    this.request,
    this.response,
    this.exception,
  });
  final Request? request;
  final Response<dynamic>? response;
  final dynamic exception;
}
