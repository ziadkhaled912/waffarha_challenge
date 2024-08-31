import 'package:mocktail/mocktail.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';

class MockAPIsManager extends Mock implements APIsManager {}

class RequestFake extends Fake implements Request {}

class EmptyRequestModelFake extends Fake implements EmptyRequestModel {}
