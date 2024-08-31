import 'package:mocktail/mocktail.dart';
import 'package:waffarha_challenge/photos/data/models/request/get_photos_request_model.dart';
import 'package:waffarha_challenge/photos/data/repository/photos_repository.dart';

import '../app/data/api_manager/faker.dart';

class MockPhotosRepository extends Mock implements PhotosRepository {}

class GetPhotosRequestModelFake extends Fake implements GetPhotosRequestModel {}

void setupFaker() {
  registerFallbackValue(RequestFake());
  registerFallbackValue(GetPhotosRequestModelFake());
}
