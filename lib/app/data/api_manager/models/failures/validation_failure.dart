import 'package:waffarha_challenge/app/data/api_manager/models/models.dart';

class ValidationFailure extends Failure {
  ValidationFailure(this.valueKey);
  final String valueKey;

  @override
  List<Object?> get props => [id, valueKey];
}
