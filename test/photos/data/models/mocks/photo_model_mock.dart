import 'package:waffarha_challenge/app/helpers/app_faker.dart';
import 'package:waffarha_challenge/photos/data/models/response/photo_model.dart';

class PhotoModelMock {
  //*this return the !same! instance every time it's called
  static final mock = random;

  //*this return the !different! instance every time it's called
  static PhotoModel get random => PhotoModel(
        albumId: AppFaker.randomInt(),
        id: AppFaker.randomInt(),
        title: AppFaker.randomString(max: 1),
        url: AppFaker.randomString(max: 1),
        thumbnailUrl: AppFaker.randomString(max: 1),
      );

  static List<PhotoModel> get randomList => List.generate(
        AppFaker.randomInt(max: 10),
        (index) => random,
      );
}
