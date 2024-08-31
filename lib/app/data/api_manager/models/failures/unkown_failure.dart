import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class UnknownFailure extends ReportableFailure {
  UnknownFailure(FailureInfo failureInfo)
      : super(failureInfo: failureInfo, type: 'Unknown Failure');
}
