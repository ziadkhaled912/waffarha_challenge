// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:waffarha_challenge/di/injection_container.config.dart';

final locator = GetIt.instance;

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
  // preferRelativeImports: false
)
void initDependencyInjection() => locator.init();
