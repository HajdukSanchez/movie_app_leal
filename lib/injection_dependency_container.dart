import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
