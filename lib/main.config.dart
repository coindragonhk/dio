// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dtg_web_admin/src/data/preferences/app_preferences.dart' as _i8;
import 'package:dtg_web_admin/src/page/auth/authentication/authentication_cubit.dart'
    as _i3;
import 'package:dtg_web_admin/src/page/content_main_drawer/bloc/content_main_drawer_cubit.dart'
    as _i4;
import 'package:dtg_web_admin/src/page/home/bloc/home_cubit.dart' as _i5;
import 'package:dtg_web_admin/src/page/main/bloc/main_cubit.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AuthenticationCubit>(() => _i3.AuthenticationCubit());
    gh.lazySingleton<_i4.ContentMainDrawerCubit>(
        () => _i4.ContentMainDrawerCubit());
    gh.lazySingleton<_i5.HomeCubit>(() => _i5.HomeCubit());
    gh.lazySingleton<_i6.MainCubit>(() => _i6.MainCubit());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i8.AppPreferences>(
        () => _i8.AppPreferences(gh<_i7.SharedPreferences>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
