import 'package:equatable/equatable.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';

class ErrorException extends Equatable implements Exception {
  const ErrorException(this.statusCode, this.error);
  final int statusCode;
  final ResponseModel error;

  @override
  List<Object?> get props => [statusCode, error];
}
