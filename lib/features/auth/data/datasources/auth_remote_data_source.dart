import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';

abstract class AuthRemoteDataSource {
  /// Login user using name and password
  ///
  /// Returns a Future<Auth> with the user data if the login is successful,
  Future<Auth> logInWithNameAndPassword(Auth auth);
}

//! Default data only for testing purposes
const defaultListAuthData = [
  Auth(name: "maria", password: "password"),
  Auth(name: "pedro", password: "123456"),
];

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Auth> logInWithNameAndPassword(Auth auth) {
    Future.delayed(const Duration(seconds: 2)); // Delay to simulate a network call
    final authData = defaultListAuthData.firstWhere(
        (data) => data.name == auth.name && data.password == auth.password,
        orElse: () => throw ServerException()); // Throws an exception if the auth data is not found
    return Future.value(authData);
  }
}
