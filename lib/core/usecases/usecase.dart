import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app_leal/core/error/failures.dart';

/// Abstract class to create and handle a new usecase in the application
///
/// We can use the call method to execute the usecase.
/// This call method allow us not to add the method name to handle the default behavior of the usecase.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle a new usecases without parameters.
///
/// Some usecases do not need parameters in his call implementation.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
