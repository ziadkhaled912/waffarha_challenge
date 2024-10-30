// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../app/data/api_manager/api_manager.dart' as _i538;
import '../app/data/api_manager/apis_manager_implementation.dart' as _i49;
import '../photos/data/repository/photos_repository.dart' as _i774;
import '../photos/presentation/cubit/photos_cubit.dart' as _i59;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i49.APIsManager>(() => _i49.APIsManager());
    gh.lazySingleton<_i774.PhotosRepository>(
        () => _i774.PhotosRepository(gh<_i538.APIsManager>()));
    gh.factory<_i59.PhotosCubit>(
        () => _i59.PhotosCubit(gh<_i774.PhotosRepository>()));
    return this;
  }
}
