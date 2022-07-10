import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      final response = await localDataSource.logOut();
      return Right(response); // Right(true)
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> login(Auth auth) async {
    try {
      final response = await remoteDataSource.logInWithNameAndPassword(auth);
      localDataSource.cacheAuthData(response); // Save response in local storage
      return Right(response);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
