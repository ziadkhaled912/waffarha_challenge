import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class TypeFailure extends ReportableFailure {
  TypeFailure(FailureInfo failureInfo, [this.data])
      : super(failureInfo: failureInfo, type: 'TypeError');
  final dynamic data;
}
