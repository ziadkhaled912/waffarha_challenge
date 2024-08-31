import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class GenericApiResponseModel extends ResponseModel {
  GenericApiResponseModel({
    required this.success,
  });

  factory GenericApiResponseModel.fromMap(Map<String, dynamic> map) {
    return GenericApiResponseModel(
      success: map['success'] as String?,
    );
  }
  // final int? responseCode;
  // final String? responseMessage;
  final String? success;
  // final String? errorMessage;

  @override
  List<Object?> get props => [
        // responseCode,
        // responseMessage,
        success,
        // errorMessage,
      ];
}
