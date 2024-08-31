import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class MessageResponseModel extends ResponseModel {
  MessageResponseModel({required this.message});

  factory MessageResponseModel.fromMap(Map<String, dynamic> map) {
    final messageResponse =
        map['message'] ?? map['msg'] ?? map['non_field_errors'] ?? map['error'];
    var message = '';
    if (messageResponse is String) {
      message = messageResponse;
    } else if (messageResponse is List) {
      message = messageResponse.join(', ');
    }

    return MessageResponseModel(
      message: message,
    );
  }
  final String message;

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  @override
  List<Object?> get props => [
        message,
      ];
}
