import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class ServiceNotAvailableFailure extends ReportableFailure {
  ServiceNotAvailableFailure(FailureInfo failureInfo)
      : super(failureInfo: failureInfo, type: 'Service Not Available');
}
