import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';

class RequestModelMock extends RequestModel {
  RequestModelMock({
    required this.data,
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  final String data;

  @override
  List<Object?> get props => [data];

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {'data': 'data_mock'};
  }
}
