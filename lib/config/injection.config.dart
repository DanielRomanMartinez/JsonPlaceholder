// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../application/home_bloc/home_bloc.dart' as _i13;
import '../application/post_detail_bloc/post_detail_bloc.dart' as _i14;
import '../domain/repositories/comments_repository.dart' as _i11;
import '../domain/repositories/posts_repository.dart' as _i5;
import '../domain/services/http_service.dart' as _i3;
import '../domain/services/sqlite_service.dart' as _i7;
import '../domain/services/start_up_service.dart' as _i9;
import '../infrastructure/repositories/comments_repository.dart' as _i12;
import '../infrastructure/repositories/posts_repository.dart' as _i6;
import '../infrastructure/services/http_service.dart' as _i4;
import '../infrastructure/services/sqflite_service.dart' as _i8;
import '../infrastructure/services/start_up_service.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HttpService>(() => _i4.FlutterHttpService());
  gh.factory<_i5.PostsRepository>(
      () => _i6.HttpPostsRepository(gh<_i3.HttpService>()));
  gh.lazySingleton<_i7.SqliteService>(() => _i8.SqfliteService());
  gh.factory<_i9.StartUpService>(
      () => _i10.FlutterStartUpService(sqliteService: gh<_i7.SqliteService>()));
  gh.factory<_i11.CommentsRepository>(
      () => _i12.SqliteCommentsRepository(gh<_i7.SqliteService>()));
  gh.lazySingleton<_i13.HomeBloc>(
      () => _i13.HomeBloc(gh<_i5.PostsRepository>()));
  gh.lazySingleton<_i14.PostDetailBloc>(
      () => _i14.PostDetailBloc(gh<_i11.CommentsRepository>()));
  return getIt;
}
