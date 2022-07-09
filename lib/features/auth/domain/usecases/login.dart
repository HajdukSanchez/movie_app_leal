import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';

class Login extends UseCase<Auth, Params> {
  /// Repository to handle the authentication
  final AuthRepository authRepository;

  Login(this.authRepository);

  @override
  Future<Either<Failure, Auth>> call(Params params) async {
    return await authRepository.login(params.auth);
  }
}

class Params extends Equatable {
  final Auth auth;

  const Params(this.auth);

  @override
  List<Object?> get props => [auth];
}
