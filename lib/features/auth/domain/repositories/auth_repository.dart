import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';

abstract class AuthRepository {
  /// Login user in the application.
  ///
  /// Returns [true] or [false] if the user was logged in successfully.
  /// Also Return a [Failure] if there was an error.
  Future<Either<Failure, Auth>> login(Auth auth);

  /// Logout user from the application.
  ///
  /// Returns [true] or [false] if the user was logged out successfully.
  /// Also Return a [Failure] if there was an error.
  Future<Either<Failure, bool>> logOut();
}
