import 'package:faker/faker.dart';
import 'package:waffarha_challenge/photos/data/enums/photos_request_enums.dart';
import 'package:waffarha_challenge/photos/data/models/request/get_photos_request_model.dart';
import 'package:waffarha_challenge/photos/data/models/request/photos_filter_params.dart';

class GetPhotosRequestModelMock {
  static final mock = GetPhotosRequestModel(
    page: 1,
  );

  static final mockWithFilterAndAlbumSort = GetPhotosRequestModel(
    page: Faker().randomGenerator.integer(100),
    limit: Faker().randomGenerator.integer(100),
    sortBy: SortBy.albumId,
    filterParams: const PhotosFilterParams(
      albumId: 1,
    ),
  );

  static final mockWithFilterAndTitleSort = GetPhotosRequestModel(
    page: Faker().randomGenerator.integer(100),
    limit: Faker().randomGenerator.integer(100),
    sortBy: SortBy.title,
    filterParams: const PhotosFilterParams(
      albumId: 1,
    ),
  );
}
