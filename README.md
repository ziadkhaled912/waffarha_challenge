# Waffarha Challenge App

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Waffarha Challenge app

## Screenshots


|                                               |                                               |
| :-------------------------------------------: | :-------------------------------------------: |
| <Image src="screenshots/screenshot-1.png" width ="300"> | <Image src="screenshots/screenshot-2.png" width ="300">  |
| <Image src="screenshots/screenshot-3.png" width ="300">

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Waffarha Challenge works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].


### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

## Data Layer
The data layer is uses an API Manager to manage the API calls. The API Manager is a singleton (defiened by dependancy injection) that is used to make the API calls. The API Manager uses the Dio package to make the API calls. The API Manager is used by the Repository and The Repository is called in the Bloc.

# API Manager

The API Manager is a class that provides a simple interface for making API calls. It uses Dio for making the calls. It depends on a **_StatusChecker_** class to check the status of the response. and **_FailureHandler_** class to handle the failure of the API call. It can accept interceptors and adds them to the Dio instance.

## Usage

To use the API Manager, you need to call send method with the following parameters:

      * request: Request object that contains the information of the API call.
      * responseFromMap: A function that converts the response body to the desired model.
      * errorResponseFromMap: A function that converts the error response body to the desired model. This is optional and if not provided, the default error response model will be used.

The send method returns a Future of Either<Failure, R> where R is the type of the response model. The Future will resolve to a Left<Failure> if the API call fails and to a Right<R> if the API call succeeds.

## Example

    final response = await _apIsManager.send(
        request: LoginRequest(requestModel),
        responseFromMap: (map) => LoginResponseModel.fromMap(map),
        errorResponseFromMap: (map) => MessageResponseModel.fromMap(map), // optional
    );

The send should be called in the repository layer and the response should be handled in the logic layer.

## Handling the response

    Future<void> _login(LoginRequestModel requestModel) async {
        emit(state.requestLoading());
        final result = await _repository.login(requestModel);
        emit(
        result.fold(
            (failure) => state.requestFailed(failure),
            (responseModel) => state.requestSuccess(responseModel),
        ),
        );
    }

## Request

The Request class contains the information of the API call. it has already made mixins for the most common HTTP methods. You can use them or override all request parametes.

The base request class has the following parameters:

      * path: The path of the API call.
      * method: The HTTP method of the API call.
      * data: The data of the API call.
      * queryParameters: The query parameters of the API call.
      * requestModel: The request model of the API call.
      * includeAuthorization: A boolean that indicates if the authorization header should be added to the request or not. The default value is true.
      * multiPart: A boolean that indicates if the request is a multipart request or not. The default value is false.

GetRequest defaults the method to GET and data to null and **_RequestModel.toMap()_** to queryParameters.

PostRequest defaults the method to POST and queryParameters to null and **_RequestModel.toMap()_** to data.

PutRequest defaults the method to PUT and queryParameters to null and **_RequestModel.toMap()_** to data.

DeleteRequest defaults the method to DELETE and data to null and **_RequestModel.toMap()_** to queryParameters.

PatchRequest defaults the method to PATCH and queryParameters to null and **_RequestModel.toMap()_** to data.

### Example

    class LoginRequest with Request, PostRequest {
        const LoginRequest(this.requestModel);

        @override
        final LoginRequestModel requestModel;

        @override
        String get path => '/api/users/login';
    }

## RequestModel

The RequestModel is a class that contains the data of the API call. It has a method toMap that converts the model to a map.

### Example

    class LoginRequestModel extends RequestModel {
        final PhoneNumber phoneNumber;
        final Password password;

        LoginRequestModel({
            required this.phoneNumber,
            required this.password,
            RequestProgressListener? progressListener,
        }) : super(progressListener);

        @override
       Future<Map<String, dynamic>> toMap() async {
        final map = <String, dynamic>{
            'phoneNumber': phoneNumber.value.fold(
                    (l) => throw ValidationException(l.valueKey),
                    (r) => r,
                ),
            'password': password.value.fold(
                    (l) => throw ValidationException(l.valueKey),
                    (r) => r,
                ),
            };
    
            return map;
        }

        @override
        List<Object> get props => [phoneNumber, password];
    }

## Parameter (optional)

The Parameter class is a class that contain the user input that should be validated before sending the API call. It has a method validate that validates the parameter and stores a Failure if the validation fails.

### Example

    class PhoneNumber extends Equatable {
        final Either<ValidationFailure, String> value;
        const PhoneNumber._(this.value);

        factory PhoneNumber(String value) =>  PhoneNumber._(_validatePhoneNumber(value));
        
        factory PhoneNumber.error(ValidationFailure failure) => PhoneNumber._(Left(failure));

        static Either<ValidationFailure, String> _validatePhoneNumber(String value) {
            final phoneValid = RegExp('[0-9]{10,12}').hasMatch(value);
            if (phoneValid) {
                return Right(value);
            }

            return Left(ValidationFailure('invalid_phone_number'));
        }

        @override
        List<Object> get props => [value];
    }

## ResponseModel

The ResponseModel is a class that contains the response data of the API call. It has a method fromMap that converts the map to the model.

### Example

    class LoginResponseModel extends Equatable implements ResponseModel {
        final User user;
        final String token;

        const LoginResponseModel({required this.user, required this.token});

        factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
            return LoginResponseModel(
            user: User.fromMap(map['user']),
            token: map['token'],
            );
        }

        Map<String, dynamic> toMap() => {
                'user': user.toMap(),
                'token': token,
            };

        @override
        List<Object> get props => [user, token];
    }

