import 'package:waffarha_challenge/app/data/api_manager/models/response/generic_api_response_model.dart';
import 'package:waffarha_challenge/app/helpers/app_faker.dart';

class GenericApiResponseModelMock {
  // This return the !same! instance every time it's called.
  static final mock = random;

  // This return the !different! instance every time it's called.
  static GenericApiResponseModel get random {
    return GenericApiResponseModel(
      success: AppFaker.randomString(),
      // errorMessage: AppFaker.sentence,
      // responseCode: AppFaker.responseStatus,
      // responseMessage: AppFaker.sentence,
    );
  }
}
