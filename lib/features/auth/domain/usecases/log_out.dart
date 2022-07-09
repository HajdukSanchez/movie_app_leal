import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';

class LogOut extends UseCase<bool, NoParams> {
  /// Repository to handle the authentication
  final AuthRepository authRepository;

  LogOut(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.logOut();
  }
}
