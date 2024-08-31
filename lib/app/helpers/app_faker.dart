import 'package:faker/faker.dart';
import 'package:waffarha_challenge/app/data/api_manager/status_checker/status_checker.dart';

class AppFaker {
  const AppFaker._();

  static final faker = Faker();

  static const maxInt = 1000;
  static const maxList = 10;
  static const minList = 2;

  static int randomInt({int max = maxInt, int min = 1}) =>
      faker.randomGenerator.integer(max, min: min);

  static int get randomId => randomInt();

  static int get randmonListLength => randomInt(min: minList, max: maxList);

  static double get randomDouble => faker.randomGenerator.decimal(scale: 1000);

  static bool get randomBool => faker.randomGenerator.boolean();

  static String get email => faker.internet.disposableEmail();

  static String get name => faker.person.name();

  static String get mobile => faker.phoneNumber.us();

  static String get sentence => faker.lorem.sentence();

  static String get word => faker.lorem.word();
  static const _maxWords = 3;

  static String get words =>
      faker.lorem.words(randomInt(max: _maxWords)).join();

  static List<String> get wordsList =>
      faker.lorem.words(randomInt(max: _maxWords));

  static DateTime get dateTime => faker.date.dateTime(
        minYear: 2022,
        maxYear: 2023,
      );

  static DateTime get dateOnly {
    final date = faker.date.dateTime();

    return DateTime(date.year, date.month, date.day);
  }

  static String get image => AppFaker.randomBool
      ? ''
      : 'https://picsum.photos/100/100?random=$randomId';

  static const defaultListLength = 10;

  static List<int> get randomIdList =>
      List.generate(randmonListLength, (index) => randomInt());

  static T randomListItem<T>(List<T> items) =>
      items[randomInt(min: 0, max: items.length)];

  static List<T> randomList<T>(List<T> items) =>
      List.generate(items.length, (index) => randomListItem<T>(items));

  static int get responseStatus {
    final statusChecker = StatusChecker();
    final codes = statusChecker.validationError +
        statusChecker.authorizationError +
        statusChecker.resourceNotFoundError +
        statusChecker.methodNotAllowedError +
        statusChecker.timeout +
        statusChecker.success +
        statusChecker.authenticationError +
        statusChecker.invalidToken +
        statusChecker.serviceNotAvailable;
    return codes[randomInt(max: codes.length, min: 0)];
  }

  static String randomString({int max = maxInt, int min = 1}) =>
      faker.randomGenerator.string(max, min: min);

  static List<String> categories = [
    'Business',
    'Entertainment',
    'General',
  ];

  static String get randomCategory =>
      categories[randomInt(max: categories.length)];

  static List<String> randomXCategories(int x) {
    final list = <String>[];
    for (var i = 0; i < x; i++) {
      list.add(categories[i]);
    }
    return list;
  }
}
