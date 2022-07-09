import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  /// Name of the user to login
  final String name;

  /// Password of the user to login
  final String password;

  const Auth({required this.name, required this.password});

  @override
  List<Object?> get props => [name, password];
}
