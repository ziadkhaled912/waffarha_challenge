import 'package:flutter_test/flutter_test.dart';

import 'mocks/get_photos_request_model_mock.dart';

void main() {
  test(
    'ContactUsRequestModel toMap Should have the right parameters',
    () async {
      // act
      final map = await GetPhotosRequestModelMock.mock.toMap();
      // assert
      expect(map['_page'], 1);
      expect(map['_per_page'], 10);
    },
  );

  test(
    'ContactUsRequestModel toMap Should return sortBy album if it is not null',
    () async {
      // act
      final map =
          await GetPhotosRequestModelMock.mockWithFilterAndAlbumSort.toMap();
      // assert
      expect(map['_sort'], 'albumId');
    },
  );

  test(
    'ContactUsRequestModel toMap Should return sortBy title if it is not null',
    () async {
      // act
      final map =
          await GetPhotosRequestModelMock.mockWithFilterAndTitleSort.toMap();
      // assert
      expect(map['_sort'], 'title');
    },
  );

  test(
    'ContactUsRequestModel toMap Should return filterParams if it is not null',
    () async {
      // act
      final map =
          await GetPhotosRequestModelMock.mockWithFilterAndAlbumSort.toMap();
      // assert
      expect(map['albumId'], 1);
    },
  );
}
