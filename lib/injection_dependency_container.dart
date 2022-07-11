import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';
import 'package:movies_app_leal/features/tv_show/data/repositories/tv_show_repository_impl.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_details_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_popular_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_recommended_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies_app_leal/core/util/failure_to_message.dart';
import 'package:movies_app_leal/core/util/url_path_converter.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies_app_leal/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/log_out.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/login.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - TvShow
  //? Bloc
  sl.registerLazySingleton(
    () => TvShowBloc(
      getAiringTodayTvShows: sl(),
      getDetailsTvShows: sl(),
      getPopularTvShows: sl(),
      getRecommendedTvShows: sl(),
      message: sl(),
    ),
  );

  //? UseCases
  sl.registerLazySingleton(() => GetAiringTodayTvShows(sl()));
  sl.registerLazySingleton(() => GetPopularTvShow(sl()));
  sl.registerLazySingleton(() => GetRecommendedTvShow(sl()));
  sl.registerLazySingleton(() => GetDetailsTvShow(sl()));

  //? Repository
  sl.registerLazySingleton<TvShowRepository>(
    () => TvShowRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  //? Data Sources
  sl.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(
      client: sl(),
      urlPathConverter: sl(),
    ),
  );

  //! Features - Auth
  //? Bloc
  sl.registerLazySingleton(() => AuthBloc(login: sl(), logout: sl(), message: sl()));

  //? UseCases
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => LogOut(sl()));

  //? Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()));

  //? Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton(() => UrlPathConverter());
  sl.registerLazySingleton(() => Message());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
