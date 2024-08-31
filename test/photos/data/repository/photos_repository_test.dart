import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/app/data/api_manager/status_checker/error_status.dart';
import 'package:waffarha_challenge/photos/data/models/response/photo_model.dart';
import 'package:waffarha_challenge/photos/data/repository/photos_repository.dart';

import '../../../app/data/api_manager/faker.dart';
import '../../faker.dart';
import '../models/mocks/get_photos_request_model_mock.dart';
import '../models/mocks/photo_model_mock.dart';

void main() {
  late PhotosRepository repository;
  late MockAPIsManager apIsManager;

  setUpAll(setupFaker);

  setUp(() {
    apIsManager = MockAPIsManager();
    repository = PhotosRepository(apIsManager);
  });

  group('sendContactUs', () {
    test(
      'should return Right(GenericApiResponse) when apiManager return valid data',
      () async {
        // arrange
        final output = PhotoModelMock.randomList;
        when(
          () => apIsManager.send<List<PhotoModel>, MessageResponseModel>(
            request: any(named: 'request'),
            responseFromMap: any(named: 'responseFromMap'),
          ),
        ).thenAnswer((_) async => Right(output));
        // act
        final result =
            await repository.getPhotosList(GetPhotosRequestModelMock.mock);
        // assert
        expect(
          result,
          Right<dynamic, List<PhotoModel>>(
            output,
          ),
        );
      },
    );

    test(
      'should return Left(ValidationError) when apiManager return invalid data',
      () async {
        // arrange
        final failure = ErrorFailure(
          errorStatus: ErrorStatus.validationError,
          error: MessageResponseModel(message: 'error'),
        );
        when(
          () => apIsManager.send<List<PhotoModel>, MessageResponseModel>(
            request: any(named: 'request'),
            responseFromMap: any(named: 'responseFromMap'),
          ),
        ).thenAnswer((_) async => Left(failure));
        // act
        final result =
            await repository.getPhotosList(GetPhotosRequestModelMock.mock);
        // assert
        expect(result, Left<ErrorFailure, dynamic>(failure));
      },
    );

    test(
      'should return Left(ServiceNotAvailableFailure) when apiManager return Server error',
      () async {
        // arrange
        final failure = ServiceNotAvailableFailure(FailureInfo());
        when(
          () => apIsManager.send<List<PhotoModel>, MessageResponseModel>(
            request: any(named: 'request'),
            responseFromMap: any(named: 'responseFromMap'),
          ),
        ).thenAnswer((_) async => Left(failure));
        // act
        final result =
            await repository.getPhotosList(GetPhotosRequestModelMock.mock);
        // assert
        expect(result, Left<ServiceNotAvailableFailure, dynamic>(failure));
      },
    );
  });
}
